require 'logger'    

module Logging

    attr_accessor :nlevel, :logger

    def logger
        logger ||= Logger.new(STDOUT)
    end

    # Exception
    def raise_exception  
        begin  
            raise 'An error has occured.'   
        rescue  
            puts 'Specific level is not part of the list of available level.'  
        end 
    end

    def loginfo(msg)
        logger.level = Logger::INFO
        logger.info("Info Message #{msg}")
    end    

    def msglevel(msg,level) 

        levels = ["debug" , "info", "warn", "error" , "fatal"] 

        # Validate level in array levels
        unless levels.include?(level)
            raise_exception
        else
            case level.upcase
            when "DEBUG"
                logger.debug("#{msg}")
            when "INFO"
                logger.info("#{msg}")  
            when "WARN"
                logger.warn("#{msg}")
            when "ERROR"
                logger.error("#{msg}") 
            when "FATAL"
                logger.fatal("#{msg}")
            end
        end
        
    end
    
end
    
class Messages
    
    include Logging

end

logn = Messages.new
logn.loginfo("Standard Output")  

logn.msglevel("I'm a debug log","debug")
logn.msglevel("I'm a info log","info")
logn.msglevel("I'm a warn log","warn")
logn.msglevel("I'm a error log","error")
logn.msglevel("I'm a fatal log","fatal")

logn.msglevel("I'm a fatal log","other")