GDPC                 �                                                                         \   res://.godot/exported/133200997/export-3637f2a73937813457cd998c80a0e7df-CarpetSelection.scn �	      w      �n���_�^�����    T   res://.godot/exported/133200997/export-376fe03041f9900d5736b881919b73f2-Screen.scn  �      �
      
���o�y��!�)��AV    X   res://.godot/exported/133200997/export-3f450f0ff49ff11f924910beda348cb1-CarpetSeq.scn   �-      \      ���F<&�ez���X    X   res://.godot/exported/133200997/export-e463b95a3f7e19a41a76cf0bfe5da57a-CarpetScr.scn   0#      �      �6�$�^��aU��cm    ,   res://.godot/global_script_class_cache.cfg                 ��Р�8���8~$}P�    H   res://.godot/imported/favicon.png-c964f8f49dee2757ab431bd2d7896c74.ctex         �       ��@�1�3�(�E�+    D   res://.godot/imported/quad.png-2643de9bfadf66c7f76437e17c6f1f58.ctex�      ^       S�.b:LVWmF�<�E�    L   res://.godot/imported/quad_black.png-43729c195ecdb1de441f713234423f23.ctex  �      Z       !4�30�--�96�    H   res://.godot/imported/white.png-936ea7d0834e1e21adf362ba74ff2135.ctex          ^       P���A#d�e<�       res://.godot/uid_cache.bin  �3      3      ��7f��Hu�<!q"t�       res://GUI/CarpetSelection.gd0      w      Q������`2��w�m    $   res://GUI/CarpetSelection.tscn.remap1      l       �Q���;�®��o�D       res://GUI/GUICarpets.gd 0      �      ��"y����ݺ�
Р       res://GUI/Screen.tscn.remap �1      c       @"�W����}�1�G��       res://assets/favicon.png�2      �       ʒ��I#G�Co�� H�        res://assets/favicon.png.import �       �       ȗ�^�K@���I��Q       res://assets/quad.png.import       �       ��_6۠�?8e��yi��    $   res://assets/quad_black.png.import  0      �       �s#R���;X#��6��        res://assets/white.png.import   `      �       ��#�ZУ�R^Rq>       res://project.binary�4      o      ���%�� Ʃo�%�.        res://screenshots/CarpetScr.gd  �      |      %<T����=��3���    (   res://screenshots/CarpetScr.tscn.remap  �1      f       �1�U����x�	le       res://sequences/CarpetSeq.gd�(      �      c@�k���^�М��F^    $   res://sequences/CarpetSeq.tscn.remap`2      f       �J;�G��+���=t     ���ʯU�6�list=Array[Dictionary]([])
H<�GST2              ����                          n   RIFFf   WEBPVP8LZ   /� 0ҳ<��x`�V������� -q�	| �KIU������mۆI�r���!��jL~$�1�&�_h�|O5�a$�1�O��	}L 6S�Ov�#[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://ckxt4k3awryfi"
path="res://.godot/imported/favicon.png-c964f8f49dee2757ab431bd2d7896c74.ctex"
metadata={
"vram_texture": false
}
 �..&��s���GST2   �   �      ����               � �        &   RIFF   WEBPVP8L   /� P�.w�����  e�[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://c3sqdnrru6ovi"
path="res://.godot/imported/quad.png-2643de9bfadf66c7f76437e17c6f1f58.ctex"
metadata={
"vram_texture": false
}
 
Oop�Gפ��hӦ��GST2   �   �      ����               � �        "   RIFF   WEBPVP8L   /� �DD�g#�![remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://bk1pf2pq6p1im"
path="res://.godot/imported/quad_black.png-43729c195ecdb1de441f713234423f23.ctex"
metadata={
"vram_texture": false
}
 ��u�Ť�]GST2            ����                        &   RIFF   WEBPVP8L   /��? ���������  ��[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://jchugfy84xci"
path="res://.godot/imported/white.png-936ea7d0834e1e21adf362ba74ff2135.ctex"
metadata={
"vram_texture": false
}
 �-��m���]궥TFextends GridContainer

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
��vy�i�0�RSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://GUI/CarpetSelection.gd ��������      local://PackedScene_2070c          PackedScene          	         names "         CurrentCarpet    size_flags_horizontal    columns    script    GridContainer    Q1    layout_mode    CheckButton    Q2    Q3    Q4    Q5    Q6    Q7    Q8    Q9    	   variants                                         node_count    
         nodes     ^   ��������       ����                                        ����                           ����                        	   ����                        
   ����                           ����                           ����                           ����                           ����                           ����                   conn_count              conns               node_paths              editable_instances              version             RSRC!���1�4�extends HBoxContainer

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
ۗ�"�yU����RSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://GUI/GUICarpets.gd ��������   PackedScene !   res://screenshots/CarpetScr.tscn �*���U<   PackedScene    res://GUI/CarpetSelection.tscn �����g�N   PackedScene    res://sequences/CarpetSeq.tscn �6o�dC&      local://PackedScene_16bxs �         PackedScene          	         names "   &      Screen    offset_right    offset_bottom    MarginContainer    GUI    custom_minimum_size    layout_mode $   theme_override_constants/separation    script    HBoxContainer 
   CarpetScr    Options    size_flags_horizontal    VBoxContainer    Panel    size_flags_vertical    text    horizontal_alignment    vertical_alignment    Label    AccuracyButton    Button    AddLineButton    DelLineButton    CarpetSelection    ResetButton    BoxDimLabel    BoxDim    CarpetSeqBox 
   CarpetSeq    autowrap_mode    _on_button_pressed    pressed    _new_line_pressed    _del_line_pressed     _on_carpet_selection_new_carpet    new_carpet    _on_reset_pressed    	   variants           @D     �C
     HD             d                                        Sierpinski Carpets             improve accuracy    	   add line       delete line       current carpet:                reset    
         current Box dimension:             ln3/ln2                    \   construction using different properties

left: self-similarity
right: sequence space coding       node_count             nodes     �   ��������       ����                            	      ����                                      ���
                                ����                                ����                  	      
      
                    ����                                ����                                ����                                ����                  
              ���                                ����                                ����                        
                    ����                        
      
                    ����                    ���                                            ����                                     conn_count             conns     #                                     !                        "              	      $   #              
          %                    node_paths              editable_instances              version             RSRCЪ���2TD�����extends GridContainer

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
		Children[i + self.columns ** 2].queue_free()

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
eO��RSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://screenshots/CarpetScr.gd ��������
   Texture2D    res://assets/quad.png �<��i!
^      local://PackedScene_xbohd F         PackedScene          	         names "         VPContainer    clip_contents    offset_right    offset_bottom &   theme_override_constants/h_separation &   theme_override_constants/v_separation    columns    script    GridContainer    Q1    layout_mode    texture    TextureRect    Q2    Q3    Q4    Q5    Q6    Q7    Q8    Q9    	   variants                  �C                                            node_count    
         nodes     x   ��������       ����                                                             	   ����   
                              ����   
                              ����   
                              ����   
                              ����   
                              ����   
                              ����   
                              ����   
                              ����   
                      conn_count              conns               node_paths              editable_instances              version             RSRCu������J!extends TextureRect

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
��w��j�:� RSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script    
   Texture2D    res://assets/white.png �63؍�   Script    res://sequences/CarpetSeq.gd ��������      local://PackedScene_ypqq8 E         PackedScene          	         names "         Fractal    offset_right    offset_bottom    size_flags_horizontal    size_flags_vertical    texture    script    TextureRect    	   variants           ��C    ��C                               node_count             nodes        ��������       ����                                                  conn_count              conns               node_paths              editable_instances              version             RSRC>/Y[remap]

path="res://.godot/exported/133200997/export-3637f2a73937813457cd998c80a0e7df-CarpetSelection.scn"
	o�[remap]

path="res://.godot/exported/133200997/export-376fe03041f9900d5736b881919b73f2-Screen.scn"
�vo(,���F�[remap]

path="res://.godot/exported/133200997/export-e463b95a3f7e19a41a76cf0bfe5da57a-CarpetScr.scn"
E�G�IYW[remap]

path="res://.godot/exported/133200997/export-3f450f0ff49ff11f924910beda348cb1-CarpetSeq.scn"
�?Kjk�~�PNG

   IHDR           szz�   sRGB ���   �IDATX��WI� ���7�� o�P{��\(&eN	"�	�G����@��gk Hp΁�mHO��t�0�*���&R�J� �
h0��`��0D�f���T#����ܒ5"�v(3a�U��	�-��(&�����f�s�ڽ�����    IEND�B`�1�Y��x��   z�;�L   res://assets/favicon.png�<��i!
^   res://assets/quad.png���֝+   res://assets/quad_black.png�63؍�   res://assets/white.png�����g�N   res://GUI/CarpetSelection.tscn��6�J6   res://GUI/Screen.tscn�*���U<    res://screenshots/CarpetScr.tscn�6o�dC&   res://sequences/CarpetSeq.tscn�.��)'`��ECFG	      application/config/name         Sierpinski Carpets     application/run/main_scene          res://GUI/Screen.tscn      application/config/features(   "         4.0    GL Compatibility        application/boot_splash/bg_color                    �?   application/config/icon          res://assets/favicon.png9   rendering/textures/canvas_textures/default_texture_filter          #   rendering/renderer/rendering_method         gl_compatibility*   rendering/renderer/rendering_method.mobile         gl_compatibility2   rendering/environment/defaults/default_clear_color                    �?)