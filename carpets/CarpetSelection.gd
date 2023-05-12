extends GridContainer

signal new_carpet

@onready var Children = get_children()

# if any button is pressed: run "_on_button_pressed"
func _ready():
	for i in len(Children):
		Children[i].pressed.connect(_on_button_pressed)

# tells GUI to load a new carpet
func _on_button_pressed():
	emit_signal("new_carpet")

func add_line():
	self.columns += 1
	Children = self.get_children()
	for i in self.columns ** 2 - len(Children):
		var new_switch = CheckButton.new()
		new_switch.name = "Q" + str(len(Children) + i)
		new_switch.pressed.connect(_on_button_pressed)
		self.add_child(new_switch)
	Children = self.get_children()

func delete_line():
	self.columns -= 1
	Children = self.get_children()
	for i in len(Children) - self.columns ** 2:
		Children[i + self.columns ** 2].queue_free()
	_on_button_pressed()

# which Qi are pressed?
# emits new coding
func marked_cells():
	Children = self.get_children()
	var marked = []
	for i in len(Children):
		if Children[i].button_pressed:
			marked.append(i)
	return marked

func load_coding(coding):
	Children = self.get_children()
	for i in len(Children):
		Children[i].button_pressed = i in coding
