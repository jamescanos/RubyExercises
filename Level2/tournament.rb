class Tournament
    
    attr_accessor :teamsname, :count, :pointsgamea, :pointsgameb, :matches, :score, :score2, :team_count, :totpoints

    def initialize()
        # Constants 
        @WIN = 3
        @DRAW = 1
        @LOSE = 0 
        
        @team_count = 0
        @count = 0
        @pointsgamea = 0
        @pointsgameb = 0
        @teamsname = []
        @matches = {}
        @score = []
        @score2 = []
        @totpoints = []
        
    end

    def teams()

        puts "\n########### Football Tournament ###########\n
              \nInstruction: You must entering how many teams will play the tournament. 
              Each team should have a name and all the teams will play against each other 
              If a team wins the match, it receives 3 points, if it ties it receives 1 point,
              and if it loses, it receives no points
              \n###########################################\n
              \nHow many Teams will you be entering?"
        
        team_count = gets.chomp.to_i

        while team_count != count
            puts "\nName of Team #{count + 1}?" 
            teamsname.push(gets.chomp)
            @count = count + 1
        end
            
    end

    def schedule

        puts "\n########### Team Matches ###########
              \nPlease enter Match result separated by asterisk (*). Ex: 2*1, 0*1, 1*1 "

        # Show teams in Tournament
        #teamsname.each_with_index do |team, i|
        #    puts "Register teams #{teamsname.at(i)}"
        #    puts "Team #{teamsname.at(0)} vs Team #{teamsname.at(i)}"
        #end  

        for i in teamsname do
            #puts "Games #{i}"
            for j in teamsname do
                # Can't fixture games with itself
                if(i != j)
                    # Can't schedule games played before
                    if(j > i)
                        puts "\nTeam #{i} vs Team #{j}"
                        #matches.push(gets.chomp)
                        result = gets.chomp
                        matches.store("#{i}*#{j}", "#{result}")
                    end
                end
            end
        end

        matches.each_with_index do |(key, value), i|
            #puts "k: #{key}, v: #{value}" 
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
        totpoints = score.each_with_object(Hash.new(0)) { |(k, v), h| h[k] += v }
        
        # Sort 
        arrsort = totpoints.sort_by{ |k,v| "Team #{v} " }.reverse

        puts "\n########### Final Tournament Standings ###########\n"

        x = 1
        # Print Sorted Values
        arrsort.each_with_index do |(key, value), i|
            puts "\nPosition #{x} | Team: #{key} | Points: #{value}" 
            #puts score.inspect
            x+=1
        end

        puts "\n##################################################\n"

    end

end

obj = Tournament.new
obj.teams()
obj.schedule()