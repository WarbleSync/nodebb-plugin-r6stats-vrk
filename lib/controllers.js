'use strict';

var Controllers = {},
pubsub = require.main.require('./src/pubsub'),
db = require.main.require('./src/database'),
meta = require.main.require('./src/meta'),
cron = require.main.require('cron').CronJob,
async = require('async'),
nconf = require('nconf'),
RainbowSixApi = require('rainbowsix-api-node'),
R6 = new RainbowSixApi(),
parser = require('cron-parser'),
_ = require('lodash'),
cronJobs = [];

Controllers.renderAdminPage = function (req, res, next) {
	/*
		Make sure the route matches your path to template exactly.

		If your route was:
			myforum.com/some/complex/route/
		your template should be:
			templates/some/complex/route.tpl
		and you would render it like so:
			res.render('some/complex/route');
	*/

	res.render('admin/plugins/r6stats', {});
};

Controllers.updateStatsManual = function(req, res, next){
	Controllers.updateStats();
	res.render('admin/plugins/r6stats', {});
}

Controllers.updateStats = function(){
	var settings = {}
	pubsub.publish('nodebb-plugin-r6stat-vrk:updateStarted')
	async.waterfall([
		function(callback){
			console.log('[' + new Date().toISOString() + '][R6STATS] --- UPDATE STATS START')
			callback()
		},
		function(callback){ // get r6stats settings
			console.log('[' + new Date().toISOString() + '][R6STATS] --- RETRIVING R6STATS SETTINGS')
			meta.settings.get('r6stats', function (err, results){
				settings = results
				callback()
			})
		},
		function(callback){ //get uids
			console.log('[' + new Date().toISOString() + '][R6STATS] --- RETRIVING UIDS')
			db.getSortedSetRangeWithScores('username:uid', 0, -1,function(err, uids){
				if (err) return console.log(err)
				// console.log(uids)
				var userKeys = []
				uids.forEach(function(u,i){
					userKeys.push('user:' + u.score + ':ns:custom_fields')
				})
				settings['userKeys'] = userKeys
				callback()
			})
		},
		function(callback){ //get user platform info
			console.log('[' + new Date().toISOString() + '][R6STATS] --- RETRIVING USER PLATFORM INFORMATION')
			db.getObjects(settings.userKeys, function(err, result){
				if (err) return console.log(err)
				var users = []
				// console.dir(result)
				result.forEach(function(u,i){
					if(typeof u !== 'undefined' && u.hasOwnProperty('uplay_id')){
						if(u.uplay_id !== ''){
							users.push({
								_key: 'user:' + settings.userKeys[i].replace('user:','').replace(':ns:custom_fields','') + ':r6stats',
								uid: settings.userKeys[i].replace('user:','').replace(':ns:custom_fields',''),
								uplay_id: u.uplay_id,
							})
						}
					}
				})
				settings['users'] = users
				callback()
			})
		},
		function(callback){ // get users forum info
			console.log('[' + new Date().toISOString() + '][R6STATS] --- RETRIVING USER FORUM INFORMATION')
			var userKeys = []
			settings.users.forEach(function(u,i){
				userKeys.push('user:' + u.uid)
			})
			db.getObjects(userKeys, function(err, result){
				if (err) return console.log(err)
				async.forEachOf(result, function(user, index, cb){
					settings.users.forEach(function(u,i){
						if(user.uid == u.uid){
							settings.users[i].username = user.username
							settings.users[i].picture = user.picture
						}
					})
					cb()
				},function(err){
					callback()
				})
			})
		},
		function(callback){ // get R6Stats
			console.log('[' + new Date().toISOString() + '][R6STATS] --- RETRIVING STATS START')
			async.forEachOf(settings.users, function(user, index, cb){
				R6.stats(user.uplay_id,settings.platform,false).then(response => {
					if(response.hasOwnProperty('player')){
						console.log('[' + new Date().toISOString() + '][R6STATS] --- RETRIVING STATS FOR 🔫 ' + settings.users[index].username + ' 🔫')
						settings.users[index].stats = response.player.stats
					}
					cb()
				}).catch(error => {
					// console.log(error)
					cb()
				})
			},function(err){
				console.log('[' + new Date().toISOString() + '][R6STATS] --- RETRIVING STATS END')
				callback()
			})
		},
		function(callback){ // get R6Operators
			console.log('[' + new Date().toISOString() + '][R6STATS] --- RETRIVING OPERATORS START')
			async.forEachOf(settings.users, function(user, index, cb){
				R6.stats(user.uplay_id,settings.platform,true).then(response => {
					if(response.hasOwnProperty('operator_records')){
						// console.log(response)
						console.log('[' + new Date().toISOString() + '][R6STATS] --- RETRIVING OPERATORS FOR 🔫 ' + settings.users[index].username + ' 🔫')
						settings.users[index].operator_records = response.operator_records
					}
					cb()
				}).catch(error => {
					// console.log(error)
					cb()
				})
			},function(err){
				console.log('[' + new Date().toISOString() + '][R6STATS] --- RETRIVING OPERATORS END')
				callback()
			})
		},
		function(callback){
			console.log('[' + new Date().toISOString() + '][R6STATS] --- SAVING STATS/OPERATORS START')
			async.forEachOf(settings.users, function(user, index, cb){
				if(user.hasOwnProperty('stats')){
					db.setObject(user._key,user,function(err,result){
						console.log('[' + new Date().toISOString() + '][R6STATS] --- STATS/OPERATORS SAVED FOR 🔫 ' + settings.users[index].username + ' 🔫')
						cb()
					})
				}
				else{
					cb()
				}
			},function(err){
				console.log('[' + new Date().toISOString() + '][R6STATS] --- SAVING STATS/OPERATORS END')
				callback()
			})
		}
	],function(err, result){
		console.log('[' + new Date().toISOString() + '][R6STATS] --- UPDATE STATS END')
		pubsub.publish('nodebb-plugin-r6stat-vrk:updateEnded')

	})
}

Controllers.startJobs = function(){
	var settings = {}
	// console.log('[' + new Date().toISOString() + '][R6STATS] --- CRONJOB STARTED')
	async.waterfall([
		function(callback){
			meta.settings.get('r6stats', function (err, results){
				settings = results
				callback()
			})
		},
		function(callback){
			if(settings.hasOwnProperty('updateTime')){
				settings.validCron = parser.parseString(settings.updateTime)
			}
			console.log(_.isEmpty(settings.validCron.errors))
			callback()
		},
		function(callback){
			settings.started = false;
			if(_.isEmpty(settings.validCron.errors) && settings.updateTime != ''){
				cronJobs.push(new cron(settings.updateTime, function(){
					Controllers.updateStats()
				}, null, false));
				settings.started = true;
			}
			callback()
		},
		function(callback){
			cronJobs.forEach(function(job) {
				console.log('[' + new Date().toISOString() + '][R6STATS] --- STARTING CRON JOBS')
				job.start()
			})
			callback()
		}
	],function(err, result){
		if(settings.started){
			settings.validCron = parser.parseExpression(settings.updateTime)
			console.log('[' + new Date().toISOString() + '][R6STATS] --- CRON JOBS STARTED')
			console.log('[' + new Date().toISOString() + '][R6STATS] --- NEXT UPDATE @ ' + settings.validCron.next().toString())
		}
		else{
			console.log('[' + new Date().toISOString() + '][R6STATS] --- CRON JOBS NOT STARTED')
			console.log('[' + new Date().toISOString() + '][R6STATS] --- CHECK SETTINGS')
		}
	})
}

module.exports = Controllers;
