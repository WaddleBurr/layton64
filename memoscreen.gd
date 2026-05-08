extends Sprite2D

#These variables are not mine
@export var paint_color : Color = Color.BLACK
@export var img_size:= Vector2i(271,271)
@export var brush_size := 3
@export var colorselected : Color = Color.BLACK
var img : Image
#except for this one
var eraseron = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#This code is still not mine
	img = Image.create_empty(img_size.x, img_size.y, false, Image.FORMAT_RGBA8)
	texture = ImageTexture.create_from_image(img)


func _paint_tex(pos) -> void:
	img.fill_rect(Rect2i(pos, Vector2i(1,1)).grow(brush_size), paint_color)
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.pressed and event.is_echo() == false and event.button_index == MOUSE_BUTTON_LEFT:
			var lpos = to_local(event.position)
			var impos = lpos-offset+get_rect().size/2.0
			if eraseron == false:
				paint_color = colorselected
			else:
				paint_color=img.get_pixelv(impos)
			_paint_tex(impos)
			texture.update(img)

	if event is InputEventMouseMotion:
		if event.button_mask == MOUSE_BUTTON_LEFT:
			var lpos = to_local(event.position)
			var impos = lpos-offset+get_rect().size/2.0
			
			if event.relative.length_squared() > 0:
				var num := ceili(event.relative.length())
				var target_pos = impos - (event.relative)
				for i in num:
					impos = impos.move_toward(target_pos, 1.0)
					_paint_tex(impos)
			texture.update(img)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#everything related to eraseron was coded by me
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("test"):
		if eraseron == true:
			eraseron=false
		else:
			eraseron=true

#all code from here on out is written by me
func _on_erase_all_pressed() -> void:
	img = Image.create_empty(img_size.x, img_size.y, false, Image.FORMAT_RGBA8)
	texture = ImageTexture.create_from_image(img)


func _on_erasersmall_toggled(toggled_on: bool) -> void:
	if toggled_on:
		eraseron=true
		brush_size = 2
		$"/root/Puzzle/CanvasLayer/Memo/Eraserbig".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Pencilsmall".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Pencilbig".button_pressed=false


func _on_eraserbig_toggled(toggled_on: bool) -> void:
	if toggled_on:
		eraseron=true
		brush_size = 3
		$"/root/Puzzle/CanvasLayer/Memo/Erasersmall".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Pencilsmall".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Pencilbig".button_pressed=false


func _on_pencilsmall_toggled(toggled_on: bool) -> void:
	if toggled_on:
		eraseron=false
		brush_size = 2
		$"/root/Puzzle/CanvasLayer/Memo/Erasersmall".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Eraserbig".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Pencilbig".button_pressed=false


func _on_pencilbig_toggled(toggled_on: bool) -> void:
	if toggled_on:
		eraseron=false
		brush_size = 3
		$"/root/Puzzle/CanvasLayer/Memo/Erasersmall".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Eraserbig".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Pencilsmall".button_pressed=false


func _on_black_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$"/root/Puzzle/CanvasLayer/Memo/White".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Red".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Blue".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Green".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Orange".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Tan".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Brown".button_pressed=false
		colorselected = Color.BLACK


func _on_white_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$"/root/Puzzle/CanvasLayer/Memo/Black".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Red".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Blue".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Green".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Orange".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Tan".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Brown".button_pressed=false
		colorselected = Color.WHITE
func _on_red_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$"/root/Puzzle/CanvasLayer/Memo/Black".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/White".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Blue".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Green".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Orange".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Tan".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Brown".button_pressed=false
		colorselected = Color.RED
func _on_blue_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$"/root/Puzzle/CanvasLayer/Memo/Black".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/White".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Red".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Green".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Orange".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Tan".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Brown".button_pressed=false
		colorselected = Color.BLUE
func _on_green_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$"/root/Puzzle/CanvasLayer/Memo/Black".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/White".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Red".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Blue".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Orange".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Tan".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Brown".button_pressed=false
		colorselected = Color.GREEN
func _on_orange_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$"/root/Puzzle/CanvasLayer/Memo/Black".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/White".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Red".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Blue".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Green".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Tan".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Brown".button_pressed=false
		colorselected = Color.DARK_ORANGE
func _on_tan_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$"/root/Puzzle/CanvasLayer/Memo/Black".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/White".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Red".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Blue".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Green".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Orange".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Brown".button_pressed=false
		colorselected = Color.PEACH_PUFF
func _on_brown_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$"/root/Puzzle/CanvasLayer/Memo/Black".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/White".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Red".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Blue".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Green".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Orange".button_pressed=false
		$"/root/Puzzle/CanvasLayer/Memo/Tan".button_pressed=false
		colorselected = Color.SADDLE_BROWN
