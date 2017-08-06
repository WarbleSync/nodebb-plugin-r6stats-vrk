<form role="form" class="r6stats-settings">
	<div class="row">
		<div class="col-sm-12 col-xs-12">
			<p class="lead">
				This plugin uses R6stats.com for data.
			</p>
		</div>
	</div>
	<div class="col-sm-12 col-xs-12">
		<div class="form-group">
				<label for="platform">Platfrom</label>
				<select id="platform" name="platform" title="Platform" class="form-control">
					<option value="uplay">PC</option>
					<option value="ps4">PS4</option>
					<option value="xone">Xbox One</option>
				</select>
		</div>
		<div class="form-group">
			<label for="updateTime">Update Time (in cron format):</label>
			<input type="text" id="updateTime" name="updateTime" title="Update Time" class="form-control" placeholder="Example: 15 0 * * *"/>
		</div>
	</div>
	<div class="col-sm-12 col-xs-12 text-right">
		<button id="updateStats" class="btn btn-primary">Update Stats</button>
	</div>
</form>

<button id="save" class="floating-button mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored">
	<i class="material-icons">save</i>
</button>
