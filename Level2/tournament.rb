class Team
    
    attr_accessor :name

    def initialize(name)
        @name = name
        @matches = []
    end

    def to_s
        @name
    end

    def play(match)
        @matches << match
    end

    def print_results
        @matches.each do |match|
        puts match
        end
    end

    def total_points
        total_points = 0
        @matches.each do |match|
            if match.winner == self
                total_points += 3
            elsif match.tied?
                total_points += 1
            end
        end
        return total_points
    end

end

class Match
    attr_accessor :teamA, :teamB, :goalsA, :goalsB
    
    def initialize(teamA, teamB, goalsA, goalsB)
        @teamA = teamA
        @teamB = teamB
        @goalsA = goalsA
        @goalsB = goalsB
    end

    def to_s
        "#{@teamA} #{@goalsA} x #{goalsB} #{teamB}"
    end

    def home_team
        @teamA
    end

    def away_team
        @teamB
    end

    def winner
        if @goalsA > @goalsB
            @teamA
        elsif @goalsB > @goalsA
            @teamB
        else
            nil
        end
    end

    def tied?
        self.winner.nil?
    end
end

teams = []

t1 = Team.new("Sao Paulo")
t2 = Team.new("Santos")
t3 = Team.new("Palmeiras")
t4 = Team.new("Corinthians")

teams << t1
teams << t2
teams << t3
teams << t4

m1 = Match.new(t1, t2, 2, 0)
m2 = Match.new(t3, t4, 0, 0)
m3 = Match.new(t1, t3, 0, 0)
m4 = Match.new(t2, t4, 2, 1)
m5 = Match.new(t1, t4, 2, 2)
m6 = Match.new(t2, t3, 2, 2)

t1.play(m1)
t1.play(m3)
t1.play(m5)
t2.play(m1)
t2.play(m4)
t2.play(m6)
t3.play(m2)
t3.play(m3)
t3.play(m6)
t4.play(m2)
t4.play(m4)
t4.play(m5)

teams.sort_by(&:total_points).reverse.each {|t| puts "#{t.name}: #{t.total_points}"}