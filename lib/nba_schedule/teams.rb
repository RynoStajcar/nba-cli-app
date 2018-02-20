class Teams

attr_accessor :team_name

@@teams = []

def initialize(team_name)
  @team_name = team_name
  @@teams << team_name
end


end
