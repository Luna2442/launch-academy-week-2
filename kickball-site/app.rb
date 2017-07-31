require "sinatra"
require_relative "models/player"
require_relative "models/team"
require_relative "models/team_data"

set :bind, '0.0.0.0'  # bind to all interfaces

get "/" do
  "
  <h1>The LACKP Homepage<h1>

  <img src='http://sites.redlands.edu/globalassets/sites/ursaa/kickball2_large.png' height='400' width='500'>

  <h2><a href = '/teams'>Teams</a></h2>

  <h2><a href = '/positions'>Positions</a></h2>
  "
end

get "/teams" do
  @teams = Team.all
  erb :teams
end

get "/teams/:team_name" do
  @team_name = params[:team_name]
  @teams = Team.all
  erb :team
end

get "/positions" do
  @positions = TeamData::ROLL_CALL.values[0].keys
  erb :positions
end

get "/positions/:position" do
  @position = params[:position]
  @teams = Team.all
  erb :position
end
