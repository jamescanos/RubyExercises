class Tournament
    
    attr_accessor :teamsname, :count, :team_count

    def initialize()  
        @team_count = 0
        @count = 0
        @teamsname = []        
    end

    def teams        
        
        team_count = gets.chomp.to_i

        while team_count != count
            puts "\nName of Team #{count + 1}?" 
            @teamsname.push(gets.chomp)
            @count = count + 1
        end
            
    end

    def print_results
        @teamsname.each do |match|
            puts match
        end
    end

end

class Match

    attr_accessor :pointsgamea, :pointsgameb, :matches, :score, :score2, :totpoints, :allteams

    def initialize()
        # Constants 
        @WIN = 3
        @DRAW = 1
        @LOSE = 0 
        
        @pointsgamea = 0
        @pointsgameb = 0
        @matches = {}
        @score = []
        @score2 = []
        @totpoints = []
    end

    def schedule(allteams)       

        for i in allteams do
            for j in allteams do
                # Can't fixture games with itself
                if(i != j)
                    # Can't schedule games played before
                    if(j > i)
                        puts "\nTeam #{i} vs Team #{j}"
                        result = gets.chomp
                        matches.store("#{i}*#{j}", "#{result}")
                    end
                end
            end
        end
    end

    def totalpoint

        matches.each_with_index do |(key, value), i|
            couple = key.split("*")
            gameresult = value.split("*")
            
            if(gameresult[0].to_i > gameresult[1].to_i)                
                pointsgamea = @WIN
                pointsgameb = @LOSE
            elsif(gameresult[0].to_i == gameresult[1].to_i)            
                pointsgamea = @DRAW
                pointsgameb = @DRAW
            else                
                pointsgamea = @LOSE
                pointsgameb = @WIN
            end
            score.push(["#{couple[0]}",pointsgamea])
            score.push(["#{couple[1]}",pointsgameb])
        end
      
        # Sum teams point
        @totpoints = score.each_with_object(Hash.new(0)) { |(k, v), h| h[k] += v }
    end 
        
    def print_results
        # Sort 
        arrsort = @totpoints.sort_by{ |k,v| "Team #{v} " }.reverse        
        x = 1
        # Print Sorted Values
        arrsort.each_with_index do |(key, value), i|
            puts "\nPosition #{x} | Team: #{key} | Points: #{value}" 
            #puts score.inspect
            x+=1
        end        
    end
end

obj = Tournament.new
puts "\n########### Football Tournament ###########\n
              \nInstruction: You must entering how many teams will play the tournament. 
              Each team should have a name and all the teams will play against each other 
              If a team wins the match, it receives 3 points, if it ties it receives 1 point,
              and if it loses, it receives no points
              \n###########################################\n
              \nHow many Teams will you be entering?"

obj.teams

nMatch = Match.new
puts "\n########### Team Matches ###########
              \nPlease enter Match result separated by asterisk (*). Ex: 2*1, 0*1, 1*1 "
nMatch.schedule(obj.teamsname)
nMatch.totalpoint
puts "\n########### Final Tournament Standings ###########\n"
nMatch.print_results
puts "\n##################################################\n"