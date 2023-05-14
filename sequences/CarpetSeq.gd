extends TextureRect

const SIZE = 256
var k = 3.0
var n = 1
var coding = [Vector2(1.0,0), Vector2(1.0,1.0), Vector2(0,1.0), Vector2(1.0,2.0), Vector2(2.0,1.0)]

func _ready():
	draw_coding()

func draw(array, n, N):
	if n > N:
		return array
	else:
		var new_array = []
		for entry in array:
			for code in coding:
				new_array.append(entry + code * k ** (-n))
		return draw(new_array, n+1, N)

func draw_coding(new_coding = coding, new_k = k):
	coding = new_coding
	k = float(new_k)
	n = 1
	# create empty image
	var image = empty_image(SIZE, SIZE)
	# add ponts to image
	for point in draw(coding, 1, 1):
		image.set_pixel(point.x * SIZE / k, point.y * SIZE / k, Color.BLACK)
	# set image
	self.set_texture(ImageTexture.create_from_image(image))

func empty_image(sizex, sizey):
	var image = Image.create(sizex, sizey, false, Image.FORMAT_RGB8)
	image.fill(Color("#ffffff"))
	return image

func increase_accuracy():
	if n < ceil(log(SIZE) / log(k)): # maximal accuracy
		var image = empty_image(SIZE, SIZE)
		# add ponts to image
		for point in draw(coding, 1, n):
			image.set_pixel(point.x * SIZE / k, point.y * SIZE / k, Color.BLACK)
		# set image
		self.set_texture(ImageTexture.create_from_image(image))
		n += 1
