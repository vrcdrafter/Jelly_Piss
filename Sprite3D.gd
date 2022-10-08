extends Sprite3D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var jellu_alive = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if jellu_alive:
		#print("jelly is alive")
		$AnimationPlayer.play("idle")
	else:
		$AnimationPlayer.play("die")
		
func _on_Area_area_entered(area):
	jellu_alive = false
	
	print("Explode")
	


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "die":
		var source_jelly = get_node("..")
		source_jelly.queue_free()
