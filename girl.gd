extends Sprite3D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var complain = get_node("AudioStreamPlayer")
	#
onready var angry_text = preload("res://black_girl_angry.png")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area_area_exited(area):
	complain.play()
	print("drink is gone ")


func _on_Area_area_entered(area):
	print(area)
	if(area.is_in_group("pee")):
		print("Ive been peed on! ")
		self.set_texture(angry_text)
