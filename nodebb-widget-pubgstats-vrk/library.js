'use strict';

var async =  module.parent.require('async'),
fs = require('fs'),
path = require('path'),
templates = module.parent.require('templates.js'),
db = require.main.require('./src/database'),
util = require("util"),
players = [],
_ = require('lodash'),
app;

var Widget = {
	templates: {}
};

Widget.init = function(params, callback) {
  console.log('[' + new Date().toISOString() + '][PUBGSTATS] 🔫 WIDGET INIT')
  app = params.app;
  var templatesToLoad = [
    'widget.tpl',
    'pubgstats.tpl'
  ];

  function loadTemplate(template, next){
    fs.readFile(path.resolve(__dirname,'./public/templates/' + template), function(err,data){
      if(err){
        console.log('[' + new Date().toISOString() + '][PUBGSTATS] 🔫 ' + err.message);
        return next(err);
      }
      Widget.templates[template] = data.toString();
      next(null);
    });
  }

  async.each(templatesToLoad, loadTemplate);

  callback();
};

Widget.renderPubgStatsWidget = function(widget, callback) {
  var lookup_keys = []
  var players_solo = [],
	players_duo = [],
	players_squad = []

  async.waterfall([
    function(callback){
			db.getSortedSetRangeWithScores('username:uid',0,-1,function(err,res){
				var results = res
				results.forEach(function(u){
					lookup_keys.push('user:' + u.score + ':pubgstats')
				})
				callback()
			})
    },
		function(callback){
			db.getObjects(lookup_keys,function(err, results){
				results.forEach(function(u){
					if(typeof u !== 'undefined'){
						u.stats.forEach(function(stats){
							if(stats.Match == 'solo'){
								var player = {
									stats: {}
								}
								player.username = u.username
								if(!_.isEmpty(u.picture)){
									player.picture = u.picture
								}
								else{
									player.picture = u.avatar
								}
								stats.Stats.forEach(function(s){
									if(s.field.includes("Time")){
										var time = Math.floor(s.value / 3600 ) + ' h ' + Math.floor((s.value % 3600) / 60) + ' m'
										player.stats[s.field] = time
									}
									else{
										player.stats[s.field] = s.value
									}
								})
								players_solo.push(player)
							}

							if(stats.Match == 'duo'){
								var player = {
									stats: {}
								}
								player.username = u.username
								if(!_.isEmpty(u.picture)){
									player.picture = u.picture
								}
								else{
									player.picture = u.avatar
								}
								stats.Stats.forEach(function(s){
									if(s.field.includes("Time")){
										var time = Math.floor(s.value / 3600 ) + ' h ' + Math.floor((s.value % 3600) / 60) + ' m'
										player.stats[s.field] = time
									}
									else{
										player.stats[s.field] = s.value
									}
								})
								players_duo.push(player)
							}

							if(stats.Match == 'squad'){
								var player = {
									stats: {}
								}
								player.username = u.username
								if(!_.isEmpty(u.picture)){
									player.picture = u.picture
								}
								else{
									player.picture = u.avatar
								}
								stats.Stats.forEach(function(s){
									if(s.field.includes("Time")){
										var time = Math.floor(s.value / 3600 ) + ' h ' + Math.floor((s.value % 3600) / 60) + ' m'
										player.stats[s.field] = time
									}
									else{
										player.stats[s.field] = s.value
									}
								})
								players_squad.push(player)
							}
						})
					}
				})
				callback()
			})
		}
  ],function(err,result){

		var rep = {
			'players_solo': _.orderBy(players_solo,function(e){ return e.stats.KillDeathRatio},['desc']),
			'players_duo': _.orderBy(players_duo,function(e){ return e.stats.KillDeathRatio},['desc']),
			'players_squad': _.orderBy(players_squad,function(e){ return e.stats.KillDeathRatio},['desc']),
		};
		// console.dir(JSON.stringify(rep.players))
		// console.dir(JSON.stringify(rep))
	  var pre = ""+fs.readFileSync(path.resolve(__dirname,'./public/templates/pubgstats.tpl'));
		widget.html = templates.parse(pre, rep)
		// callback(null, templates.parse(pre, rep));
		// console.log(widget.data)
		callback(null, widget);
  })
};

Widget.defineWidgets = function(widgets, callback) {
  widgets = widgets.concat([
  		{
  			widget: "pubgstats-vrk",
  			name: "pubgstats-vrk",
  			description: "description",
  			content: Widget.templates['widget.tpl']
  		}
  	]);
    callback(null, widgets);
};

module.exports = Widget;
