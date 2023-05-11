extends GridContainer

signal new_carpet

@onready var children = get_children()

# if any button is pressed: run "_on_button_pressed"
func _ready():
	for i in len(children):
		children[i].pressed.connect(_on_button_pressed)

# tells GUI to load a new carpet
func _on_button_pressed():
	emit_signal("new_carpet")

# which Qi are pressed?
# emits new coding
func marked_cells():
	var marked = []
	for i in len(children):
		if children[i].button_pressed:
			marked.append(i)
	return marked
