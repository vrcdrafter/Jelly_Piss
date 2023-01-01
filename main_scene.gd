extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var current_texture  = get_node("picture1")
onready var image = load("res://end_screen.png")
onready var image_2 = load("res://beach couple.png")
var current_scene = null
# Called when the node enters the scene tree for the first time.
func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)
	var new_scene = ResourceLoader.load("res://Spatial.tscn")
	var simultaneous_scene = load("res://Spatial.tscn").instance()
	# sequence 1 
	current_texture.set_texture(image)
	transition()
	yield(get_tree().create_timer(3.0), "timeout")
	transition_2()
	yield(get_tree().create_timer(3.0), "timeout")
	#sequence 2
	current_texture.set_texture(image_2)
	transition()
	yield(get_tree().create_timer(3.0), "timeout")
	transition_2()
	
func _process(delta):
	if Input.is_key_pressed(KEY_ESCAPE):
			get_tree().quit()

func transition():
	$AnimationPlayer.play("New Anim")
func transition_2():
	$AnimationPlayer.play("fade_out")
