require_relative "./team_data"

class Player
  attr_reader :name, :position, :team_name

  def initialize(name, position, team_name)
    @name = name
    @position = position
    @team_name = team_name
  end


  def self.all()
    all_players = []
    all_teams = TeamData::ROLL_CALL

    all_teams.each do |team, hash|
      hash.each do |position, name|
        player = Player.new(name, position, team)
        all_players << player
      end
    end
    return all_players
  end

end
