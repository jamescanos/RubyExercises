require "logger"
logger = Logger.new(STDOUT)
logger.debug("I'm a debug log")
logger.info("I'm an info log")
logger.warn("I'm a warn log")
logger.error("I'm an error log: error message")
logger.fatal("I'm a fatal log")