start = xiangqi_command

xiangqi_command = standard_movement_command
                / extended_movement_command
                / extended_capture_command
                / extended_check_command
                / extended_crossriver_command
                / meta_command

standard_movement_command = "std:" piece vertical_relative_position? column_number movement_direction (column_number / num_of_steps)

extended_movement_command = "ext:" piece extended_piece_position extended_movement_direction (column_number / num_of_steps)?

extended_capture_command = "ext:" (piece extended_piece_position?)? capture_symbol (piece extended_piece_position?)?

extended_check_command = "ext:" (piece extended_piece_position?)? check_symbol check_specifier? column_number?

extended_crossriver_command = "ext:" soldier_piece extended_piece_position? cross_river_symbol

meta_command = "meta:" (confirm_symbol / cancel_symbol / ask_for_draw_symbol / ask_for_change_side_symbol / ask_for_takeback_symbol / resign_symbol / new_game_symbol)


extended_piece_position = (extended_relative_position / column_number / extended_relative_position column_number / piece_tag)?


piece = general_piece / soldier_piece / cannon_piece / horse_piece / elephant_piece / rook_piece / advisor_piece
general_piece = "G" / "Tg"
cannon_piece = "P"
horse_piece = "M"
elephant_piece = "T"
soldier_piece = "B"
rook_piece = "X"
advisor_piece = "S"

vertical_relative_position = front_pos / back_pos / mid_pos / frontmid_pos / backmid_pos
front_pos = "t"
back_pos = "s"
mid_pos = "g"
frontmid_pos = "tg"
backmid_pos = "sg"

column_number = [1-9]
num_of_steps = [1-9]

movement_direction = forward_move / backward_move / sideways_move
forward_move = "."
backward_move = "/"
sideways_move = "-"

extended_relative_position = vertical_relative_position / left_pos / right_pos / leftmid_pos / rightmid_pos
left_pos = "-t"
right_pos = "-p"
leftmid_pos = "-tg"
rightmid_pos = "-pg"

extended_movement_direction = movement_direction / forwardleft_move / forwardright_move / backwardleft_move / backwardright_move
left_move = "-t"
right_move = "-p"
forwardleft_move = ".-t"
forwardright_move = ".-p"
backwardleft_move = "/-t"
backwardright_move = "/-p"

piece_tag = circle_tag / square_tag / x_tag / y_tag / z_tag
circle_tag = "#circle"
square_tag = "#square"
x_tag = "#x"
y_tag = "#y"
z_tag = "#z"

capture_symbol = "x"
check_symbol = "+"
cross_river_symbol = ".s"

check_specifier = indirect_check_specifier / direct_check_specifier
indirect_check_specifier = "?"
direct_check_specifier = "!"


confirm_symbol = "ok"
cancel_symbol = "ko"
ask_for_draw_symbol = "="
ask_for_change_side_symbol = "><"
ask_for_takeback_symbol = "<"
resign_symbol = "$"
new_game_symbol = "^"