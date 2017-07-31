require "spec_helper"

RSpec.describe Player do
  let(:player){Player.new("Bart Simpson", "Pitcher", "Simpson Slammers")}

  describe "#.new" do

    it "initializes with a name, position, and team name." do
      expect(player.name).to eq("Bart Simpson")
      expect(player.position).to eq("Pitcher")
      expect(player.team_name).to eq("Simpson Slammers")
    end

  end

  describe ".all" do
    all_players = Player.all

    it "returns an array of all player objects" do
      expect(all_players.class).to be(Array)
    end

    it "contains player objects" do
      expect(all_players[0].class).to be(Player)
    end

  end

end
