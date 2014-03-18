class Matrix
  attr_accessor :subMatrix 

  def initialize(matrix)
    @subMatrix = matrix
  end
  
  def move_leftmost_leading_one_to_first_row (subMatrix, column, row) 
    i = column + subMatrix[column..(subMatrix.length-1)].index { |ele| not ele[row] == 0 } 
    subMatrix[column], subMatrix[i] = subMatrix[i], subMatrix[column]
    #for counter in (column)..(subMatrix.length-1)
      #if(not subMatrix[counter][row] == 0)
	#subMatrix[column], subMatrix[counter] = subMatrix[counter], subMatrix[column]
	#break
      #end
    #end
    subMatrix
  end
 
  def divide_leading_entry_from_first_row (subMatrix, column, row)
    divider = subMatrix[column][row]
    subMatrix[column].each_with_index { |ele, i| subMatrix[column][i] = subMatrix[column][i] / divider }
    subMatrix
  end

  def replace_to_zero_of_first_row (subMatrix, column, row)
    ind = (column+1) + subMatrix[(column+1)..(subMatrix.length-1)].index { |ele| not ele[row] == 0 } 
    multiplier = subMatrix[ind][row]
    subMatrix[ind].each_with_index { |ele, i| subMatrix[ind][i] = subMatrix[ind][i] - subMatrix[column][i] * multiplier }
    #for counter in (column+1)..(subMatrix.length-1)
      #if(not subMatrix[counter][row] == 0)
       # multiplier = subMatrix[counter][row]
        #subMatrix[counter].each_with_index { |ele, i| subMatrix[counter][i] = subMatrix[counter][i] - subMatrix[column][i] * multiplier }
      #end
    #end
    subMatrix
  end

  def row_operation
    column = 0,row = 0
    for column in 0..(subMatrix.length-1)
      if(subMatrix[subMatrix.length-1][row] == 0)
        break
      else
	move_leftmost_leading_one_to_first_row subMatrix , column, row
	divide_leading_entry_from_first_row subMatrix , column, row
	subMatrix.each { |ele| replace_to_zero_of_first_row subMatrix , column, row }
	#replace_to_zero_of_first_row subMatrix , column, row
      end
	  
      if(row < subMatrix[column].length-1)
	row = row + 1
      else
	break
      end
    end
    subMatrix
  end

end

  
