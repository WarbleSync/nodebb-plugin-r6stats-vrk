"use strict";

var controllers = require('./lib/controllers'),
plugin = {};

plugin.init = function(params, callback) {
	var router = params.router,
		hostMiddleware = params.middleware,
		hostControllers = params.controllers;

	// We create two routes for every view. One API call, and the actual route itself.
	// Just add the buildHeader middleware to your route and NodeBB will take care of everything for you.

	router.get('/admin/plugins/r6stats', hostMiddleware.admin.buildHeader, controllers.renderAdminPage);
	router.get('/api/admin/plugins/r6stats', controllers.renderAdminPage);
	router.get('/admin/plugins/r6stats/update', hostMiddleware.admin.buildHeader, controllers.updateStatsManual);

	//schedule cron jobs
	controllers.startJobs();
	callback();
};

plugin.addAdminNavigation = function(header, callback) {
	header.plugins.push({
		route: '/plugins/r6stats',
		icon: 'fa-tint',
		name: 'R6STATS'
	});

	callback(null, header);
};

module.exports = plugin;
