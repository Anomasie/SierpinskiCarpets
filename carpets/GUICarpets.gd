extends HBoxContainer

@onready var Carpet = $Carpet # actual carpet
@onready var CarpetSelection = $Options/CarpetSelection # options on the right
@onready var BoxDim = $Options/BoxDim

func _ready():
	# load empty carpet
	_on_carpet_selection_new_carpet()

func _on_button_pressed():
	Carpet.insert_self()

func _new_line_pressed():
	# carpet
	Carpet.add_line()
	# carpet selection buttons
	CarpetSelection.add_line()
	# reset current carpet to empty
	_on_reset_pressed()

func _del_line_pressed():
	if Carpet.columns > 0:
		Carpet.delete_line()
		CarpetSelection.delete_line()
	_on_reset_pressed()

func _on_carpet_selection_new_carpet():
	var marked_cells = CarpetSelection.marked_cells()
	Carpet.load_coding(marked_cells)
	# print box dimension
	## if no marked cells: 0
	if len(marked_cells) != 0:
		BoxDim.text = str(log(len(marked_cells)) / log(Carpet.columns))
	else:
		BoxDim.text = str(0)

func _on_reset_pressed():
	Carpet.load_coding([])
	CarpetSelection.load_coding([])
