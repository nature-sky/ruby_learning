class Week  
 
  week = ['sunday', 'monday', 'tuesday', 'wednesday', 'thurday', 'friday', 'saturday']
  week.map.with_index do |day, i|
    class_eval <<-LALALA
       def #{day}
         #{i}
       end
    LALALA
  end      
end

test = Week.new
puts test.monday
