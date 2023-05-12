extends GridContainer

var coding = [0,2,4,6,8]
@onready var Children = self.get_children()

func add_line():
	self.columns += 1
	Children = self.get_children()
	for i in self.columns ** 2 - len(Children):
		var new_texture = TextureRect.new()
		new_texture.name = "Q" + str(len(Children) + i)
		new_texture.texture = load("res://assets/quad.png")
		self.add_child(new_texture)
	Children = self.get_children()

func delete_line():
	self.columns -= 1
	Children = self.get_children()
	for i in len(Children) - self.columns ** 2:
		Children[i].queue_free()

func load_coding(new_coding=coding):
	coding = new_coding
	Children = self.get_children()
	for i in len(Children):
		if i in coding:
			Children[i].set_texture(load("res://assets/quad_black.png"))
		else:
			Children[i].set_texture(load("res://assets/quad.png"))

func insert_self():
	var screenshot = get_viewport().get_texture()
	var image = screenshot.get_image()
	image.crop(128*self.columns, 128*self.columns)
	image.resize(128, 128)
	var texture = ImageTexture.create_from_image(image)
	
	for i in len(Children):
		if i in coding:
			Children[i].set_texture(texture)
