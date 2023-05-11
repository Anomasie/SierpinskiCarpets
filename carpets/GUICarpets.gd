extends HBoxContainer

@onready var Carpet = $Carpet # actual carpet
@onready var CurrentCarpet = $Options/CurrentCarpet # options on the right

func _ready():
	_on_current_carpet_new_carpet()

func _on_button_pressed():
	Carpet.insert_self()

func _on_current_carpet_new_carpet():
	print(CurrentCarpet.marked_cells())
	Carpet.load_coding(CurrentCarpet.marked_cells())
