class Week

  week = ['sunday', 'monday', 'tuesday', 'wednesday', 'thurday', 'friday', 'saturday']
  week.map do |day|  
    num = week.index day
    define_method(:"#{day}") { num }
  end
end

test = Week.new
test.monday
test.wednesday
test.saturday
