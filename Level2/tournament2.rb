class Tournament

    def teams()
        
        @WIN = 3
        @DRAW = 1
        @LOSE = 0        

        puts "\n########### Football Tournament ###########\n"
        puts "\nInstruction: You must entering how many teams will play the tournament. 
             Each team should have a name and all the teams will play against each other 
             If a team wins the match, it receives 3 points, if it ties it receives 1 point,
             and if it loses, it receives no points"
        puts "\n###########################################\n"
        puts "\nHow many Teams will you be entering?"                

        team_count = gets.chomp.to_i
        teamsname = []
        count = 0
        #matches = []
        matches = {}
        score = {}
        matchpoints = 0
        pointsold = 0
        allresults = [] 
        allresultsb = []
        arrorder =[]
        ending = []

        puts "\n########### Teams ###########"

        while team_count != count
            puts "\nName of Team #{count + 1}?" 
            teamsname.push(gets.chomp)
            count = count + 1
        end

        puts "\n########### Team Matches ###########"
        puts "\nPlease enter Match result separated by asterisk (*). Ex: 2*1, 0*1, 1*1 "
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

        def joinresults(hash, list, value = nil)
            # Snip off the last element
            *list, tail = list
          
            # Iterate through the elements in the path...
            final = list.inject(hash) do |h, k|
              # ...and populate with a hash if necessary.
              h[k] ||= { }
            end
          
            # Add on the final value
            final[tail] = value
          
            hash
        end

        matches.each_with_index do |(key, value), i|
            #puts "k: #{key}, v: #{value}" 
            couple = key.split("*")
            gameresult = value.split("*")
            
            if(gameresult[0].to_i > gameresult[1].to_i)
                score.store("#{couple[0]}*#{couple[1]}", "#{@WIN}*#{@LOSE}")
            elsif(gameresult[0].to_i == gameresult[1].to_i)
                score.store("#{couple[0]}*#{couple[1]}", "#{@DRAW}*#{@DRAW}")
            else
                score.store("#{couple[0]}*#{couple[1]}", "#{@LOSE}*#{@WIN}")
            end

        end
        points,newpoints = 0
        score.each_with_index do |(key, value), i|
            #puts "k: #{key}, v: #{value}, i: #{i}" 
            team = key.split("*")
            teampoints = value.split("*")
            #print "Team 0: #{team[0]}-#{teampoints[0]}\n"   
            #print "Team 1: #{team[1]}-#{teampoints[1]}\n" 
            h = allresults.push([team[0]<<"#{i}", teampoints[0]])
            g = allresultsb.push([team[1]<<"#{i}", teampoints[1]])
             
            # Join Hashes
            arrorder = Hash[h].merge!(Hash[g]){|k,a,b|h+g}.to_a

        end

        oldval, newoldval = 0
        arrorder.each_with_index do |(key, value), i|

            #puts "k: #{key}, v: #{value}" 
            
            #key = key.split('').last
            key = key[/\A.{#{key.size-1}}/] #=> "stri"
            #puts "#{key} => #{value}"
            teamold = key
            oldval = value

            if(key == teamold)
                #value = oldval.to_i + value.to_i
                ending.push([key, value])
            end

            
            #ending.store("#{key}", "#{key}" << "#{value}")
            #details[key] = allresults[key].to_i + allresults[key].to_i
 
        end

        ending.each_with_index do |(key, value), i|
            puts "k: #{key}, v: #{value}" 
        end

        #ending.group_by { |h| ending.keys.first }.map do |k, v| 
        #    Hash[k, v.reduce(0) { |acc, n| acc + n.values.first.to_i }]
        #end 
        

    end

end

obj = Tournament.new
obj.teams()