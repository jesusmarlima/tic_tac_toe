class Game < ApplicationRecord
  belongs_to :user

  def computer_move(game)
    changed = full_win_check(game)
    if game != changed
      return changed.flatten
    else
     if game.index("")
        game[game.index("")] = 'O'
     end
   end
   game
  end

  def get_rows(array)
  	array.each_slice(3).to_a
  end

  def get_cols(array)
  	get_rows(array).transpose
  end

  def get_right_diag(array)
  	[array[0], array[4], array[8]]
  end

  def get_left_diag(array)
  	[array[2], array[4], array[6]]
  end

  def find_winning_line(array)
  	array.find_index {|row| row.count("O") == 2 && row.count("") == 1 }
  end


  def row_and_col_check(arrays_to_check)
  	if index = find_winning_line(arrays_to_check)
  		arrays_to_check[index].map! do |cell|
  			if cell == ""
  				cell = "O"
  			end
  			cell
  		end

  end
  arrays_to_check
  end


  def fill_cells(array)
  	rows = get_rows(array)
  	test_rows = get_rows(array)
  	cols = get_cols(array)
  	cols_rows = get_cols(array)


  	if test_rows == row_and_col_check(rows)
  		return row_and_col_check(cols).transpose
  	end

  	row_and_col_check(rows)
  end

  def right_diag_check(diag, original_array)
  	if diag.count("O") == 2 && diag.count("") == 1
  		cell_index = diag.find_index('')
  		if cell_index == 0
  			original_array[0] = "O"
  		elsif cell_index == 1
  			original_array[4] = "O"
  		elsif cell_index == 2
  			original_array[8] = "O"
  		end
  	end
  	original_array
  end

  def left_diag_check(diag, original_array)
  	if diag.count("O") == 2 && diag.count("") == 1
  		cell_index = diag.find_index('')
  		if cell_index == 0
  			original_array[2] = "O"
  		elsif cell_index == 1
  			original_array[4] = "O"
  		elsif cell_index == 2
  			original_array[6] = "O"
  		end
  	end
  	original_array
  end

  def diagonal_check(array)
  	if array == right_diag_check(get_right_diag(array), array.dup)
  		return left_diag_check(get_left_diag(array), array.dup)
  	end
  	right_diag_check(get_right_diag(array), array.dup)
  end


  def full_win_check(array)
  	new_arry = []
  	fill_cells(array).flatten.each do |x|
  		new_arry << x
  	end
  	if array == new_arry
  		puts array
  		return diagonal_check(array) if diagonal_check(array)
  	end
  	 fill_cells(array)
  end

  # diagonal_check(array)

  #full_win_check(array)
  # fill_cells(array)
  # row_and_col_check(get_rows(array))













































end
