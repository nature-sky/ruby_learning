  week = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thurday', 'Friday', 'Saturday']
  week.map.with_index do |day, i|
    eval <<-LALALA
      class #{day}
        
         def #{day.downcase}
           #{i}
         end
      end
    LALALA
  end      
test = Monday.new
puts test.monday
