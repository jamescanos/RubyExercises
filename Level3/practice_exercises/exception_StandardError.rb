begin  
  raise 'A test exception.'  
rescue StandardError => e  
  puts e.message  
  puts e.backtrace.inspect  
end