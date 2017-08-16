<script type="text/javascript" src="/plugins/nodebb-widget-pubgstats-vrk/public/scripts/pubg.js"></script>
<link rel="stylesheet" type="text/css" href="/plugins/nodebb-widget-pubgstats-vrk/public/css/style.css" />
<div>
  <div class="container-fluid">
    <div class="row align-middle table-title">
      <div class="col-md-12">
        <div class="form-group">
          <label for="pubgselect">Game Mode</label>
          <select class="form-control" id="pubgselect" onchange="selectGame()">
            <option value="solo">Solo</option>
            <option value="duo">Duo</option>
            <option value="squad">Squad</option>
          </select>
        </div>
      </div>
    </div>
  </div>

  <div class="container-fluid">
     <div class="row align-middle table-title">
      <div class="col-md-3 text-uppercase text-center"><strong>Name</strong></div>
      <div class="col-md-1 text-uppercase"><strong>K/D</strong></div>
      <div class="col-md-1 text-uppercase"><strong>W/L</strong></div>
      <div class="col-md-1 text-uppercase"><strong>Top 10s</strong></div>
      <div class="col-md-1 text-uppercase"><strong>Damage Dealt</strong></div>
      <div class="col-md-1 text-uppercase"><strong>Rounds Played</strong></div>
      <div class="col-md-2 text-uppercase"><strong>Time Survived</strong></div>
      <div class="col-md-2 text-uppercase"><strong>Rating</strong></div>
     </div>
  </div>

  <div id="solo">
    <!-- BEGIN players_solo -->
    <div class="row"><hr/></div>
    <div class="row align-middle table-title statsToggle" onclick="showData(this)">
      <div class="col-md-1">
        <img class="img-responsive" src="{players_solo.picture}" style="max-width:32px;" />
      </div>
      <div class="col-md-2">
        <h5 class="">{players_solo.username}</h5>
      </div>
      <div class="col-md-1">{players_solo.stats.KillDeathRatio}</div>
      <div class="col-md-1">{players_solo.stats.Wins} / {players_solo.stats.Losses}</div>
      <div class="col-md-1">{players_solo.stats.Top10s}</div>
      <div class="col-md-1">{players_solo.stats.DamageDealt}</div>
      <div class="col-md-1">{players_solo.stats.RoundsPlayed}</div>
      <div class="col-md-2">{players_solo.stats.TimeSurvived}</div>
      <div class="col-md-2">{players_solo.stats.Rating}</div>
    </div>

    <div id="solo_details" class="row align-middle table-title well" style="display: none;">
      <div class="row">
        <div class="col-md-12">
          <span class="badge">Assists: {players_solo.stats.Assists}</span>&nbsp;&nbsp;
          <span class="badge">Avg Ride Distance: {players_solo.stats.AvgRideDistance}</span>&nbsp;&nbsp;
          <span class="badge">Avg Survival Time: {players_solo.stats.AvgSurvivalTime}</span>&nbsp;&nbsp;
          <span class="badge">Avg Walk Distance: {players_solo.stats.AvgWalkDistance}</span>&nbsp;&nbsp;
          <span class="badge">Best Rank: {players_solo.stats.BestRank}</span>&nbsp;&nbsp;
          <span class="badge">Best Rating: {players_solo.stats.BestRating}</span>&nbsp;&nbsp;
          <span class="badge">Boosts: {players_solo.stats.Boosts}</span>&nbsp;&nbsp;
          <span class="badge">DBNOs: {players_solo.stats.DBNOs}</span>&nbsp;&nbsp;
          <span class="badge">Daily Kills: {players_solo.stats.DailyKills}</span>&nbsp;&nbsp;
          <span class="badge">Damage Dealt: {players_solo.stats.DamageDealt}</span>&nbsp;&nbsp;
          <span class="badge">Damage Pg: {players_solo.stats.DamagePg}</span>&nbsp;&nbsp;
          <span class="badge">Days: {players_solo.stats.Days}</span>&nbsp;&nbsp;
          <span class="badge">Headshot Kill Ratio: {players_solo.stats.HeadshotKillRatio}</span>&nbsp;&nbsp;
          <span class="badge">Headshot Kills: {players_solo.stats.HeadshotKills}</span>&nbsp;&nbsp;
          <span class="badge">Headshot Kills Pg: {players_solo.stats.HeadshotKillsPg}</span>&nbsp;&nbsp;
          <span class="badge">Heals: {players_solo.stats.Heals}</span>&nbsp;&nbsp;
          <span class="badge">Heals Pg: {players_solo.stats.HealsPg}</span>&nbsp;&nbsp;
          <span class="badge">Kill Death Ratio: {players_solo.stats.KillDeathRatio}</span>&nbsp;&nbsp;
          <span class="badge">Kills: {players_solo.stats.Kills}</span>&nbsp;&nbsp;
          <span class="badge">Kills Pg: {players_solo.stats.KillsPg}</span>&nbsp;&nbsp;
          <span class="badge">Longest Kill: {players_solo.stats.LongestKill}</span>&nbsp;&nbsp;
          <span class="badge">Longest Time Survived: {players_solo.stats.LongestTimeSurvived}</span>&nbsp;&nbsp;
          <span class="badge">Losses: {players_solo.stats.Losses}</span>&nbsp;&nbsp;
          <span class="badge">Max Kill Streaks: {players_solo.stats.MaxKillStreaks}</span>&nbsp;&nbsp;
          <span class="badge">Most Survival Time: {players_solo.stats.MostSurvivalTime}</span>&nbsp;&nbsp;
          <span class="badge">Move Distance: {players_solo.stats.MoveDistance}</span>&nbsp;&nbsp;
          <span class="badge">Rating: {players_solo.stats.Rating}</span>&nbsp;&nbsp;
          <span class="badge">Revives: {players_solo.stats.Revives}</span>&nbsp;&nbsp;
          <span class="badge">Revives Pg: {players_solo.stats.RevivesPg}</span>&nbsp;&nbsp;
          <span class="badge">Ride Distance: {players_solo.stats.RideDistance}</span>&nbsp;&nbsp;
          <span class="badge">Road Kills: {players_solo.stats.RoadKills}</span>&nbsp;&nbsp;
          <span class="badge">Road Kills Pg: {players_solo.stats.RoadKillsPg}</span>&nbsp;&nbsp;
          <span class="badge">Round Most Kills: {players_solo.stats.RoundMostKills}</span>&nbsp;&nbsp;
          <span class="badge">Rounds Played: {players_solo.stats.RoundsPlayed}</span>&nbsp;&nbsp;
          <span class="badge">Suicides: {players_solo.stats.Suicides}</span>&nbsp;&nbsp;
          <span class="badge">Team Kills: {players_solo.stats.TeamKills}</span>&nbsp;&nbsp;
          <span class="badge">Team Kills Pg: {players_solo.stats.TeamKillsPg}</span>&nbsp;&nbsp;
          <span class="badge">Time Survived: {players_solo.stats.TimeSurvived}</span>&nbsp;&nbsp;
          <span class="badge">Time Survived Pg: {players_solo.stats.TimeSurvivedPg}</span>&nbsp;&nbsp;
          <span class="badge">Top 10 Ratio: {players_solo.stats.Top10Ratio}</span>&nbsp;&nbsp;
          <span class="badge">Top 10s: {players_solo.stats.Top10s}</span>&nbsp;&nbsp;
          <span class="badge">Top 10s Pg: {players_solo.stats.Top10sPg}</span>&nbsp;&nbsp;
          <span class="badge">Vehicle Destroys: {players_solo.stats.VehicleDestroys}</span>&nbsp;&nbsp;
          <span class="badge">Walk Distance: {players_solo.stats.WalkDistance}</span>&nbsp;&nbsp;
          <span class="badge">Weapon Acquired: {players_solo.stats.WeaponAcquired}</span>&nbsp;&nbsp;
          <span class="badge">Weekly Kills: {players_solo.stats.WeeklyKills}</span>&nbsp;&nbsp;
          <span class="badge">Win Points: {players_solo.stats.WinPoints}</span>&nbsp;&nbsp;
          <span class="badge">Win Ratio: {players_solo.stats.WinRatio}</span>&nbsp;&nbsp;
          <span class="badge">Win Top10 Ratio: {players_solo.stats.WinTop10Ratio}</span>&nbsp;&nbsp;
          <span class="badge">Wins: {players_solo.stats.Wins}</span>&nbsp;&nbsp;
        </div>
      </div>
    </div>
    <!-- END players_solo -->
  </div>

  <div id="duo" style="display: none;">
    <!-- BEGIN players_duo -->
    <div class="row"><hr/></div>
    <div class="row align-middle table-title statsToggle" onclick="showData(this)">
      <div class="col-md-1">
        <img class="img-responsive" src="{players_duo.picture}" style="max-width:32px;" />
      </div>
      <div class="col-md-2">
        <h5 class="">{players_duo.username}</h5>
      </div>
      <div class="col-md-1">{players_duo.stats.KillDeathRatio}</div>
      <div class="col-md-1">{players_duo.stats.Wins} / {players_duo.stats.Losses}</div>
      <div class="col-md-1">{players_duo.stats.Top10s}</div>
      <div class="col-md-1">{players_duo.stats.DamageDealt}</div>
      <div class="col-md-1">{players_duo.stats.RoundsPlayed}</div>
      <div class="col-md-2">{players_duo.stats.TimeSurvived}</div>
      <div class="col-md-2">{players_duo.stats.Rating}</div>
    </div>

    <div id="duo_details" class="row align-middle table-title well" style="display: none;">
      <div class="row">
        <div class="col-md-12">
          <span class="badge">Assists: {players_duo.stats.Assists}</span>&nbsp;&nbsp;
          <span class="badge">Avg Ride Distance: {players_duo.stats.AvgRideDistance}</span>&nbsp;&nbsp;
          <span class="badge">Avg Survival Time: {players_duo.stats.AvgSurvivalTime}</span>&nbsp;&nbsp;
          <span class="badge">Avg Walk Distance: {players_duo.stats.AvgWalkDistance}</span>&nbsp;&nbsp;
          <span class="badge">Best Rank: {players_duo.stats.BestRank}</span>&nbsp;&nbsp;
          <span class="badge">Best Rating: {players_duo.stats.BestRating}</span>&nbsp;&nbsp;
          <span class="badge">Boosts: {players_duo.stats.Boosts}</span>&nbsp;&nbsp;
          <span class="badge">DBNOs: {players_duo.stats.DBNOs}</span>&nbsp;&nbsp;
          <span class="badge">Daily Kills: {players_duo.stats.DailyKills}</span>&nbsp;&nbsp;
          <span class="badge">Damage Dealt: {players_duo.stats.DamageDealt}</span>&nbsp;&nbsp;
          <span class="badge">Damage Pg: {players_duo.stats.DamagePg}</span>&nbsp;&nbsp;
          <span class="badge">Days: {players_duo.stats.Days}</span>&nbsp;&nbsp;
          <span class="badge">Headshot Kill Ratio: {players_duo.stats.HeadshotKillRatio}</span>&nbsp;&nbsp;
          <span class="badge">Headshot Kills: {players_duo.stats.HeadshotKills}</span>&nbsp;&nbsp;
          <span class="badge">Headshot Kills Pg: {players_duo.stats.HeadshotKillsPg}</span>&nbsp;&nbsp;
          <span class="badge">Heals: {players_duo.stats.Heals}</span>&nbsp;&nbsp;
          <span class="badge">Heals Pg: {players_duo.stats.HealsPg}</span>&nbsp;&nbsp;
          <span class="badge">Kill Death Ratio: {players_duo.stats.KillDeathRatio}</span>&nbsp;&nbsp;
          <span class="badge">Kills: {players_duo.stats.Kills}</span>&nbsp;&nbsp;
          <span class="badge">Kills Pg: {players_duo.stats.KillsPg}</span>&nbsp;&nbsp;
          <span class="badge">Longest Kill: {players_duo.stats.LongestKill}</span>&nbsp;&nbsp;
          <span class="badge">Longest Time Survived: {players_duo.stats.LongestTimeSurvived}</span>&nbsp;&nbsp;
          <span class="badge">Losses: {players_duo.stats.Losses}</span>&nbsp;&nbsp;
          <span class="badge">Max Kill Streaks: {players_duo.stats.MaxKillStreaks}</span>&nbsp;&nbsp;
          <span class="badge">Most Survival Time: {players_duo.stats.MostSurvivalTime}</span>&nbsp;&nbsp;
          <span class="badge">Move Distance: {players_duo.stats.MoveDistance}</span>&nbsp;&nbsp;
          <span class="badge">Rating: {players_duo.stats.Rating}</span>&nbsp;&nbsp;
          <span class="badge">Revives: {players_duo.stats.Revives}</span>&nbsp;&nbsp;
          <span class="badge">Revives Pg: {players_duo.stats.RevivesPg}</span>&nbsp;&nbsp;
          <span class="badge">Ride Distance: {players_duo.stats.RideDistance}</span>&nbsp;&nbsp;
          <span class="badge">Road Kills: {players_duo.stats.RoadKills}</span>&nbsp;&nbsp;
          <span class="badge">Road Kills Pg: {players_duo.stats.RoadKillsPg}</span>&nbsp;&nbsp;
          <span class="badge">Round Most Kills: {players_duo.stats.RoundMostKills}</span>&nbsp;&nbsp;
          <span class="badge">Rounds Played: {players_duo.stats.RoundsPlayed}</span>&nbsp;&nbsp;
          <span class="badge">Suicides: {players_duo.stats.Suicides}</span>&nbsp;&nbsp;
          <span class="badge">Team Kills: {players_duo.stats.TeamKills}</span>&nbsp;&nbsp;
          <span class="badge">Team Kills Pg: {players_duo.stats.TeamKillsPg}</span>&nbsp;&nbsp;
          <span class="badge">Time Survived: {players_duo.stats.TimeSurvived}</span>&nbsp;&nbsp;
          <span class="badge">Time Survived Pg: {players_duo.stats.TimeSurvivedPg}</span>&nbsp;&nbsp;
          <span class="badge">Top 10 Ratio: {players_duo.stats.Top10Ratio}</span>&nbsp;&nbsp;
          <span class="badge">Top 10s: {players_duo.stats.Top10s}</span>&nbsp;&nbsp;
          <span class="badge">Top 10s Pg: {players_duo.stats.Top10sPg}</span>&nbsp;&nbsp;
          <span class="badge">Vehicle Destroys: {players_duo.stats.VehicleDestroys}</span>&nbsp;&nbsp;
          <span class="badge">Walk Distance: {players_duo.stats.WalkDistance}</span>&nbsp;&nbsp;
          <span class="badge">Weapon Acquired: {players_duo.stats.WeaponAcquired}</span>&nbsp;&nbsp;
          <span class="badge">Weekly Kills: {players_duo.stats.WeeklyKills}</span>&nbsp;&nbsp;
          <span class="badge">Win Points: {players_duo.stats.WinPoints}</span>&nbsp;&nbsp;
          <span class="badge">Win Ratio: {players_duo.stats.WinRatio}</span>&nbsp;&nbsp;
          <span class="badge">Win Top10 Ratio: {players_duo.stats.WinTop10Ratio}</span>&nbsp;&nbsp;
          <span class="badge">Wins: {players_duo.stats.Wins}</span>&nbsp;&nbsp;
        </div>
      </div>
    </div>
    <!-- END players_duo -->
  </div>

  <div id="squad" style="display: none;">
    <!-- BEGIN players_squad -->
    <div class="row"><hr/></div>
    <div class="row align-middle table-title statsToggle" onclick="showData(this)">
      <div class="col-md-1">
        <img class="img-responsive" src="{players_squad.picture}" style="max-width:32px;" />
      </div>
      <div class="col-md-2">
        <h5 class="">{players_squad.username}</h5>
      </div>
      <div class="col-md-1">{players_squad.stats.KillDeathRatio}</div>
      <div class="col-md-1">{players_squad.stats.Wins} / {players_squad.stats.Losses}</div>
      <div class="col-md-1">{players_squad.stats.Top10s}</div>
      <div class="col-md-1">{players_squad.stats.DamageDealt}</div>
      <div class="col-md-1">{players_squad.stats.RoundsPlayed}</div>
      <div class="col-md-2">{players_squad.stats.TimeSurvived}</div>
      <div class="col-md-2">{players_squad.stats.Rating}</div>
    </div>

    <div id="squad_details" class="row align-middle table-title well" style="display: none;">
      <div class="row">
        <div class="col-md-12">
          <span class="badge">Assists: {players_squad.stats.Assists}</span>&nbsp;&nbsp;
          <span class="badge">Avg Ride Distance: {players_squad.stats.AvgRideDistance}</span>&nbsp;&nbsp;
          <span class="badge">Avg Survival Time: {players_squad.stats.AvgSurvivalTime}</span>&nbsp;&nbsp;
          <span class="badge">Avg Walk Distance: {players_squad.stats.AvgWalkDistance}</span>&nbsp;&nbsp;
          <span class="badge">Best Rank: {players_squad.stats.BestRank}</span>&nbsp;&nbsp;
          <span class="badge">Best Rating: {players_squad.stats.BestRating}</span>&nbsp;&nbsp;
          <span class="badge">Boosts: {players_squad.stats.Boosts}</span>&nbsp;&nbsp;
          <span class="badge">DBNOs: {players_squad.stats.DBNOs}</span>&nbsp;&nbsp;
          <span class="badge">Daily Kills: {players_squad.stats.DailyKills}</span>&nbsp;&nbsp;
          <span class="badge">Damage Dealt: {players_squad.stats.DamageDealt}</span>&nbsp;&nbsp;
          <span class="badge">Damage Pg: {players_squad.stats.DamagePg}</span>&nbsp;&nbsp;
          <span class="badge">Days: {players_squad.stats.Days}</span>&nbsp;&nbsp;
          <span class="badge">Headshot Kill Ratio: {players_squad.stats.HeadshotKillRatio}</span>&nbsp;&nbsp;
          <span class="badge">Headshot Kills: {players_squad.stats.HeadshotKills}</span>&nbsp;&nbsp;
          <span class="badge">Headshot Kills Pg: {players_squad.stats.HeadshotKillsPg}</span>&nbsp;&nbsp;
          <span class="badge">Heals: {players_squad.stats.Heals}</span>&nbsp;&nbsp;
          <span class="badge">Heals Pg: {players_squad.stats.HealsPg}</span>&nbsp;&nbsp;
          <span class="badge">Kill Death Ratio: {players_squad.stats.KillDeathRatio}</span>&nbsp;&nbsp;
          <span class="badge">Kills: {players_squad.stats.Kills}</span>&nbsp;&nbsp;
          <span class="badge">Kills Pg: {players_squad.stats.KillsPg}</span>&nbsp;&nbsp;
          <span class="badge">Longest Kill: {players_squad.stats.LongestKill}</span>&nbsp;&nbsp;
          <span class="badge">Longest Time Survived: {players_squad.stats.LongestTimeSurvived}</span>&nbsp;&nbsp;
          <span class="badge">Losses: {players_squad.stats.Losses}</span>&nbsp;&nbsp;
          <span class="badge">Max Kill Streaks: {players_squad.stats.MaxKillStreaks}</span>&nbsp;&nbsp;
          <span class="badge">Most Survival Time: {players_squad.stats.MostSurvivalTime}</span>&nbsp;&nbsp;
          <span class="badge">Move Distance: {players_squad.stats.MoveDistance}</span>&nbsp;&nbsp;
          <span class="badge">Rating: {players_squad.stats.Rating}</span>&nbsp;&nbsp;
          <span class="badge">Revives: {players_squad.stats.Revives}</span>&nbsp;&nbsp;
          <span class="badge">Revives Pg: {players_squad.stats.RevivesPg}</span>&nbsp;&nbsp;
          <span class="badge">Ride Distance: {players_squad.stats.RideDistance}</span>&nbsp;&nbsp;
          <span class="badge">Road Kills: {players_squad.stats.RoadKills}</span>&nbsp;&nbsp;
          <span class="badge">Road Kills Pg: {players_squad.stats.RoadKillsPg}</span>&nbsp;&nbsp;
          <span class="badge">Round Most Kills: {players_squad.stats.RoundMostKills}</span>&nbsp;&nbsp;
          <span class="badge">Rounds Played: {players_squad.stats.RoundsPlayed}</span>&nbsp;&nbsp;
          <span class="badge">Suicides: {players_squad.stats.Suicides}</span>&nbsp;&nbsp;
          <span class="badge">Team Kills: {players_squad.stats.TeamKills}</span>&nbsp;&nbsp;
          <span class="badge">Team Kills Pg: {players_squad.stats.TeamKillsPg}</span>&nbsp;&nbsp;
          <span class="badge">Time Survived: {players_squad.stats.TimeSurvived}</span>&nbsp;&nbsp;
          <span class="badge">Time Survived Pg: {players_squad.stats.TimeSurvivedPg}</span>&nbsp;&nbsp;
          <span class="badge">Top 10 Ratio: {players_squad.stats.Top10Ratio}</span>&nbsp;&nbsp;
          <span class="badge">Top 10s: {players_squad.stats.Top10s}</span>&nbsp;&nbsp;
          <span class="badge">Top 10s Pg: {players_squad.stats.Top10sPg}</span>&nbsp;&nbsp;
          <span class="badge">Vehicle Destroys: {players_squad.stats.VehicleDestroys}</span>&nbsp;&nbsp;
          <span class="badge">Walk Distance: {players_squad.stats.WalkDistance}</span>&nbsp;&nbsp;
          <span class="badge">Weapon Acquired: {players_squad.stats.WeaponAcquired}</span>&nbsp;&nbsp;
          <span class="badge">Weekly Kills: {players_squad.stats.WeeklyKills}</span>&nbsp;&nbsp;
          <span class="badge">Win Points: {players_squad.stats.WinPoints}</span>&nbsp;&nbsp;
          <span class="badge">Win Ratio: {players_squad.stats.WinRatio}</span>&nbsp;&nbsp;
          <span class="badge">Win Top10 Ratio: {players_squad.stats.WinTop10Ratio}</span>&nbsp;&nbsp;
          <span class="badge">Wins: {players_squad.stats.Wins}</span>&nbsp;&nbsp;
        </div>
      </div>
    </div>
    <!-- END players_squad -->
  </div>
</div>
