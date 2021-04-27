class Tournament
    
    attr_accessor :teamsname, :count, :pointsgamea, :pointsgameb, :matches, :score, :score2, :team_count

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
        @score = {}
        @score2 = {}
        
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

        x=0
        sum = 0

        matches.each_with_index do |(key, value), i|
            puts "k: #{key}, v: #{value}" 
            couple = key.split("*")
            gameresult = value.split("*")
            #puts "Cou: #{couple}, GR: #{gameresult}" 
            
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
            #score.store("#{x}", :description=>'games', :"#{couple[0]}"=>pointsgamea, :"#{couple[1]}"=>pointsgameb)
            puts "#{pointsgamea} + #{pointsgameb}"
            #score.store("#{x}", :"#{couple[0]}"=>pointsgamea)
            #score2.store("#{x}", :"#{couple[1]}"=>pointsgameb)
            score.store("#{x}", "#{couple[0]}"=>pointsgamea, "#{couple[1]}"=>pointsgameb)
            x+=1
        end
        
        #score.to_a
        
        #newscore = score.merge(score2) {|key, old_val, new_val| old_val < new_val ? old_val : new_val}
        #newscore = score.merge(score2)

        score.each do |key, value|
            puts "k: #{key}, v: #{value}" 

            sum = sum.to_i + value.to_i

            puts "Sum: #{sum}"
            #puts score.inspect
            #sum += value
            #puts sum
        end 

        #score2.each_with_index do |(key, value), i|
        #    puts "k: #{key}, v: #{value}" 
        #    #puts score.inspect
        #end 

    end

end

obj = Tournament.new
obj.teams()
obj.schedule()