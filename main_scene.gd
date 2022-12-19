extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var current_texture  = get_node("picture1")


# Called when the node enters the scene tree for the first time.
func _ready():
	print(current_texture.get_texture())
	transition()
	yield(get_tree().create_timer(1.0), "timeout")
	
	transition()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func transition():
	$AnimationPlayer.play("New Anim")
