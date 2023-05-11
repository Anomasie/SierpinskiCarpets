extends GridContainer

var coding = [0,2,4,6,8]
@onready var Children = self.get_children()

func load_coding(new_coding=coding):
	print("loading!")
	coding = new_coding
	for i in len(Children):
		if i in coding:
			Children[i].set_texture(load("res://assets/quad_black.png"))
		else:
			Children[i].set_texture(load("res://assets/quad.png"))

func insert_self():
	print("insert!")
	var screenshot = get_viewport().get_texture()
	var image = screenshot.get_image()
	image.crop(self.size.x, self.size.y)
	image.resize(Children[0].size.x, Children[0].size.y)
	var texture = ImageTexture.create_from_image(image)
	
	for i in len(Children):
		if i in coding:
			Children[i].set_texture(texture)
