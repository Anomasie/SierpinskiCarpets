extends HBoxContainer

# actual carpets
@onready var CarpetScr = $CarpetScr
@onready var CarpetSeq = $CarpetSeqBox/CarpetSeq
@onready var CarpetSelection = $Options/CarpetSelection # options on the right
@onready var BoxDim = $Options/BoxDim

func _ready():
	# load empty carpet
	_on_carpet_selection_new_carpet()

func _on_button_pressed():
	CarpetScr.insert_self()
	CarpetSeq.increase_accuracy()

func _new_line_pressed():
	# carpet
	CarpetScr.add_line()
	# carpet selection buttons
	CarpetSelection.add_line()
	# reset current carpet to empty
	_on_reset_pressed()

func _del_line_pressed():
	if CarpetScr.columns > 0:
		CarpetScr.delete_line()
		CarpetSelection.delete_line()
	_on_reset_pressed()

func get_coding(cells, k):
	var coding = []
	for cell in cells:
		coding.append(Vector2(cell % k, float(int(cell / k)) ))
	return coding

func _on_carpet_selection_new_carpet():
	var marked_cells = CarpetSelection.marked_cells()
	var marked_coding = get_coding(marked_cells, CarpetSelection.columns)
	# draw screenshot-carpet
	CarpetScr.load_coding(marked_cells)
	# draw sequence-carpet
	CarpetSeq.draw_coding(marked_coding, CarpetSelection.columns)
	# print box dimension
	## if no marked cells: 0
	if len(marked_cells) != 0:
		BoxDim.text = str(log(len(marked_cells)) / log(CarpetScr.columns))
	else:
		BoxDim.text = str(0)

func _on_reset_pressed():
	CarpetScr.load_coding([])
	CarpetSelection.load_coding([])
	CarpetSeq.draw_coding([], 1)
