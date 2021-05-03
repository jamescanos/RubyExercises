require 'logger'    

module Logging

    attr_accessor :nlevel, :logger

    def logger
        logger ||= Logger.new(STDOUT)
    end

    def loginfo(msg)
        logger.level = Logger::INFO
        logger.info("Info Message #{msg}")
    end

    def raise_exception  
        begin  
            raise 'An error has occured.'   
        rescue  
        puts 'Specific level is not part of the list of available level.'  
        end 
    end

    def msglevel(msg,level) 

        levels = ["debug" , "info", "warn", "error" , "fatal"] 

        unless levels.include?(level)
            raise_exception
        else
            if(level.upcase=="DEBUG")
                logger.debug("#{msg}")
            elsif(level.upcase=="INFO")
                logger.info("#{msg}")
            elsif(level.upcase=="WARN")
                logger.warn("#{msg}")
            elsif(level.upcase=="ERROR")
                logger.error("#{msg}")
            elsif(level.upcase=="FATAL")
                logger.fatal("#{msg}")
            end  
        end
        
    end
    
end
    
class Messages
    
    include Logging
    #Now you have access to the method `logger` and the instance variable `@logger`.

    logn = Messages.new

    logn.loginfo("Standard Output")  

    logn.msglevel("I'm a debug log","debug")
    logn.msglevel("I'm a info log","info")
    logn.msglevel("I'm a warn log","warn")
    logn.msglevel("I'm a error log","error")
    logn.msglevel("I'm a fatal log","fatal")

    logn.msglevel("I'm a fatal log","other")

end

#obj = Messages.new
#obj.loginfo("I'm a debug log jj") 