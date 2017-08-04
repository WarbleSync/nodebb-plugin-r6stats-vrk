'use strict';

var Controllers = {};

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
	console.log('[' + new Date().toISOString() + '][r6stats] --- Update Stats START --- ')
	console.log('[' + new Date().toISOString() + '][r6stats] --- Update Stats END --- ')
}
module.exports = Controllers;
