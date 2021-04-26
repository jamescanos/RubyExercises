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
        hash = Hash.new { |h, k| h[k] = h.dup.clear }
        x=0
        matches.each_with_index do |(key, value), i|
            #puts "k: #{key}, v: #{value}" 
            couple = key.split("*")
            gameresult = value.split("*")
            
            if(gameresult[0].to_i > gameresult[1].to_i)
                #score.store("#{x}", :description=>'games', :"#{couple[0]}"=>@WIN.to_i, :"#{couple[1]}"=>@LOSE.to_i)
                pointsgamea = @WIN
                pointsgameb = @LOSE
            elsif(gameresult[0].to_i == gameresult[1].to_i)
                #score.store("#{x}", :description=>'games', :"#{couple[0]}"=>@DRAW.to_i, :"#{couple[1]}"=>@DRAW.to_i)
                pointsgamea = @DRAW
                pointsgameb = @DRAW
            else
                #score.store("#{x}", :description=>'games', :"#{couple[0]}"=>@LOSE.to_i, :"#{couple[1]}"=>@WIN.to_i)
                pointsgamea = @LOSE
                pointsgameb = @WIN
            end
            score.store("#{x}", :description=>'games', :"#{couple[0]}"=>pointsgamea, :"#{couple[1]}"=>pointsgameb)
            x+=1
        end
        
        score.each_with_index do |(key, value), i|
            #puts "k: #{key}, v: #{value}" 
            puts score.inspect
        end

        array_of_hashes = [
        {description: 'small', a: 1, b: 0.2, c: 0.3},
        {description: 'large', a: 100, b: 200, c: 300},
        {description: 'small', a: 4, b: 0.5, c: 0.6},
        {description: 'large', a: 400, b: 500, c: 600},
        {description: 'unique', a: 'hi', b: true, c: false},
        ]

        answer = array_of_hashes.group_by {|h| h[:description]}.values
        answer.map! {|first, *rest|
        if rest.empty?
            first
        else
            first.dup.tap {|sum|
            rest.each {|h| sum[:b] += h[:b]; sum[:c] += h[:c]}}
        end
        }

        #score.select { |key, val| key == "games" }

        #score.replace( [{ score.first.keys.first => score.reduce(0) {|s, v| s + v.values.first.to_i } }] )

    end

end

obj = Tournament.new
obj.teams()