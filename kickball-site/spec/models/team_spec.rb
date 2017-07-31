require "spec_helper"

RSpec.describe Team do
  let(:team){Team.new("Space Jammers")}

  describe "#new" do
    it "is created with a name" do
      expect(team.name).to eq("Space Jammers")
    end
  end

  describe ".all" do
    all_teams = Team.all

    it "returns an aray of Team objects for every team" do
      expect(all_teams.class).to eq(Array)
    end

    it "contains team objects" do
      expect(all_teams[0].class).to eq(Team)
    end
  end

  describe "#players" do

    it "returns an array of Player objects on this team" do
      team.team_members << Player.new("Bob Ross", "Painter", "Space Jammers")
      team.team_members << Player.new("Michael Jorden", "Balla", "Space Jammers")
      team.team_members << Player.new("Repair Man", "Repair Man", "Space Jammers")

      expect(team.team_members.class).to eq(Array)
      expect(team.team_members[0].class).to eq(Player)
      expect(team.team_members[0].name).to include("Bob Ross")
      expect(team.team_members[0].position).to include("Painter")
      expect(team.team_members[0].team_name).to include("Space Jammers")
    end

    it "returns the array of players on the team" do
      expect(team.players.class).to eq(Array)
    end
  end


end
