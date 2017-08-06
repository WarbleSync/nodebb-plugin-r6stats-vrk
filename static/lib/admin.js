'use strict';
/* globals $, app, socket */

define('admin/plugins/r6stats', ['settings'], function(Settings) {

	var ACP = {};

	ACP.init = function() {
		Settings.load('r6stats', $('.r6stats-settings'));

		$('#save').on('click', function() {
			Settings.save('r6stats', $('.r6stats-settings'), function() {
				console.log('save')
				app.alert({
					type: 'success',
					alert_id: 'r6stats-saved',
					title: 'Settings Saved',
					message: 'Please restart the forum before running update',
					clickfn: function() {
						socket.emit('admin.reload');
					}
				});
			});
		});

		$('#updateStats').on('click', function(){
			window.location.href = "/admin/plugins/r6stats/update";
			return false;
		})

	};

	return ACP;
});
