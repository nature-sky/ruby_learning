Arr_to_hash = proc do |row, col|
    corelate = {}
    col = ['a', 'b', 'c']
    case row  
    when Array then 
    row.map { |r| corelate = Hash[ row.zip(col) ]}
    when Hash then 
    row.map { |r| corelate = Hash[ row.zip(col) ]}
    when Fixnum then
    corelate <<= row
    end
    corelate
end
