extends HBoxContainer

@onready var Carpet = $Carpet # actual carpet
@onready var CurrentCarpet = $Options/CurrentCarpet # options on the right
@onready var BoxDim = $Options/BoxDim

func _ready():
	_on_current_carpet_new_carpet()

func _on_button_pressed():
	Carpet.insert_self()

func _new_line_pressed():
	Carpet.add_line()
	CurrentCarpet.add_line()

func _del_line_pressed():
	if Carpet.columns > 0:
		Carpet.delete_line()
		CurrentCarpet.delete_line()

func _on_current_carpet_new_carpet():
	var marked_cells = CurrentCarpet.marked_cells()
	Carpet.load_coding(marked_cells)
	# print box dimension
	## if no marked cells: 0
	if len(marked_cells) == 0:
		BoxDim.text = "0"
	elif len(marked_cells) == Carpet.columns:
		BoxDim.text = "1"
	## if all cells marked: full dimension
	elif len(marked_cells) == Carpet.columns ** 2:
		BoxDim.text = "2"
	else:
		BoxDim.text = "ln" + str(len(marked_cells)) + "/ln" + str(Carpet.columns)
