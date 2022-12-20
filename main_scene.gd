extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var current_texture  = get_node("picture1")
onready var image = load("res://grey_fox.jpg")
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
	
	# change scene. 
	current_scene.queue_free()
	current_scene = new_scene.instance()
	get_tree().get_root().add_child(current_scene)
	#get_tree().change_scene("res://Spatial.tscn")
	#get_tree().change_scene_to(load('res://Spatial.tscn'))
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func transition():
	$AnimationPlayer.play("New Anim")
func transition_2():
	$AnimationPlayer.play("fade_out")
