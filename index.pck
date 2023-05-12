GDPC                 �                                                                         \   res://.godot/exported/133200997/export-57df539449ce00b26c552c896b7245ef-CarpetSelection.scn 0      {      ��� �~���jr�g.�    T   res://.godot/exported/133200997/export-b11f4fac9e48f616a4529405a2d5cf4c-Screen.scn  �      A	      ��ɲ���<��T�c    T   res://.godot/exported/133200997/export-d047d3d8f3682d93597fe7b81369b63a-Carpet.scn         �      +%��룠I�Pr��O�    ,   res://.godot/global_script_class_cache.cfg                 ��Р�8���8~$}P�    H   res://.godot/imported/favicon.png-c964f8f49dee2757ab431bd2d7896c74.ctex         �       ��@�1�3�(�E�+    D   res://.godot/imported/quad.png-2643de9bfadf66c7f76437e17c6f1f58.ctex�      ^       S�.b:LVWmF�<�E�    L   res://.godot/imported/quad_black.png-43729c195ecdb1de441f713234423f23.ctex  �      Z       !4�30�--�96�       res://.godot/uid_cache.bin  �&      �       ��NA�&��>��Mx��       res://assets/favicon.png�%      �       ʒ��I#G�Co�� H�        res://assets/favicon.png.import �       �       ȗ�^�K@���I��Q       res://assets/quad.png.import       �       ��_6۠�?8e��yi��    $   res://assets/quad_black.png.import  0      �       �s#R���;X#��6��        res://carpets/Carpet.tscn.remap `$      c       #�j ��h� �V���        res://carpets/CarpetSelection.gd�	      w      Q������`2��w�m    (   res://carpets/CarpetSelection.tscn.remap�$      l        h�[���M��|��\_h       res://carpets/GUICarpets.gd �      �      s?�y����Q�$w�        res://carpets/Screen.tscn.remap @%      c       Z��"���h������       res://carpets/VPContainer.gd�      |      %<T����=��3���       res://project.binary�'      s      ����2&+���q�#<    ��
Olist=Array[Dictionary]([])
�Pmv0GST2              ����                          n   RIFFf   WEBPVP8LZ   /� 0ҳ<��x`�V������� -q�	| �KIU������mۆI�r���!��jL~$�1�&�_h�|O5�a$�1�O��	}L ^�������M[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://ckxt4k3awryfi"
path="res://.godot/imported/favicon.png-c964f8f49dee2757ab431bd2d7896c74.ctex"
metadata={
"vram_texture": false
}
 �=:G���)lGST2   �   �      ����               � �        &   RIFF   WEBPVP8L   /� P�.w�����  �&[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://c3sqdnrru6ovi"
path="res://.godot/imported/quad.png-2643de9bfadf66c7f76437e17c6f1f58.ctex"
metadata={
"vram_texture": false
}
 � (K�R�����3GST2   �   �      ����               � �        "   RIFF   WEBPVP8L   /� �DD���tc�p[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://bk1pf2pq6p1im"
path="res://.godot/imported/quad_black.png-43729c195ecdb1de441f713234423f23.ctex"
metadata={
"vram_texture": false
}
 &C}ǻ���TRSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://carpets/VPContainer.gd ��������
   Texture2D    res://assets/quad.png �<��i!
^      local://PackedScene_wiofk D         PackedScene          	         names "         VPContainer    clip_contents    offset_right    offset_bottom &   theme_override_constants/h_separation &   theme_override_constants/v_separation    columns    script    GridContainer    Q1    layout_mode    texture    TextureRect    Q2    Q3    Q4    Q5    Q6    Q7    Q8    Q9    	   variants                  �C                                            node_count    
         nodes     x   ��������       ����                                                             	   ����   
                              ����   
                              ����   
                              ����   
                              ����   
                              ����   
                              ����   
                              ����   
                              ����   
                      conn_count              conns               node_paths              editable_instances              version             RSRC7��Ü���textends GridContainer

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
߱-� x�RSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script !   res://carpets/CarpetSelection.gd ��������      local://PackedScene_84j7w          PackedScene          	         names "         CurrentCarpet    size_flags_horizontal    columns    script    GridContainer    Q1    layout_mode    CheckButton    Q2    Q3    Q4    Q5    Q6    Q7    Q8    Q9    	   variants                                         node_count    
         nodes     ^   ��������       ����                                        ����                           ����                        	   ����                        
   ����                           ����                           ����                           ����                           ����                           ����                   conn_count              conns               node_paths              editable_instances              version             RSRC�L�>extends HBoxContainer

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
o���RSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://carpets/GUICarpets.gd ��������   PackedScene    res://carpets/Carpet.tscn �R�Q�d~5   PackedScene #   res://carpets/CarpetSelection.tscn �����g�N      local://PackedScene_wiqah �         PackedScene          	         names "   #      Screen    offset_right    offset_bottom    MarginContainer    GUI    custom_minimum_size    layout_mode $   theme_override_constants/separation    script    HBoxContainer    Carpet    Options    size_flags_horizontal    VBoxContainer    Panel    size_flags_vertical    text    horizontal_alignment    vertical_alignment    Label    AccuracyButton    Button    AddLineButton    DelLineButton    CarpetSelection    ResetButton    BoxDimLabel    BoxDim    _on_button_pressed    pressed    _new_line_pressed    _del_line_pressed     _on_carpet_selection_new_carpet    new_carpet    _on_reset_pressed    	   variants             B
     HD             d                                        Sierpinski Carpets             improve accuracy    	   add line       delete line       current carpet:                reset    
         current Box dimension:             ln3/ln2       node_count             nodes     �   ��������       ����                             	      ����                                      ���
                                ����                                ����                        	      	                    ����            
                    ����                                ����                                ����                  	              ���                                ����                                ����                        	                    ����                        	      	             conn_count             conns     #                                                                        	      !                  
         "                    node_paths              editable_instances              version             RSRC��5 :ϳ�=�8��extends GridContainer

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
���c[remap]

path="res://.godot/exported/133200997/export-d047d3d8f3682d93597fe7b81369b63a-Carpet.scn"
3�[`�<���l��[remap]

path="res://.godot/exported/133200997/export-57df539449ce00b26c552c896b7245ef-CarpetSelection.scn"
`�{I[remap]

path="res://.godot/exported/133200997/export-b11f4fac9e48f616a4529405a2d5cf4c-Screen.scn"
�؟?��m���PNG

   IHDR           szz�   sRGB ���   �IDATX��WI� ���7�� o�P{��\(&eN	"�	�G����@��gk Hp΁�mHO��t�0�*���&R�J� �
h0��`��0D�f���T#����ܒ5"�v(3a�U��	�-��(&�����f�s�ڽ�����    IEND�B`�\^5.+��/+   z�;�L   res://assets/favicon.png�<��i!
^   res://assets/quad.png���֝+   res://assets/quad_black.png�R�Q�d~5   res://carpets/Carpet.tscn�����g�N"   res://carpets/CarpetSelection.tscn�U���P"   res://carpets/Screen.tscno;Jo�5�ECFG	      application/config/name         Sierpinski Carpets     application/run/main_scene$         res://carpets/Screen.tscn      application/config/features(   "         4.0    GL Compatibility        application/boot_splash/bg_color                    �?   application/config/icon          res://assets/favicon.png9   rendering/textures/canvas_textures/default_texture_filter          #   rendering/renderer/rendering_method         gl_compatibility*   rendering/renderer/rendering_method.mobile         gl_compatibility2   rendering/environment/defaults/default_clear_color                    �?l��8Y_�d81̐�