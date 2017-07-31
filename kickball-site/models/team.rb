require_relative "./team_data"

class Team
  attr_reader :name
  attr_accessor :team_members

  def initialize(name)
    @name = name
    @team_members = []
  end

  def self.all
    all_teams = []

    TeamData::ROLL_CALL.each do |team, hash|
      all_teams << Team.new(team)
    end
    return all_teams
  end

  def players
    players = Player.all
    players.each do |player|
      if player.team_name == @name
        @team_members << player
      end
    end
    return @team_members
  end

end
