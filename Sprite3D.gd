extends Sprite3D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var jellu_alive = true
var attacking = false
var attack_anim_finished = false
signal attack_finisued
var one_shot = true
onready var collission_shape1 = get_node("../Area")
onready var collission_shape2 = get_node("../attack_box")
onready var collission_shape3 = get_node("../enemy_detection")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	attack_anim_finished = false
	if jellu_alive && !attacking:
		#print("jelly is alive")
		$AnimationPlayer.play("idle")
	elif jellu_alive && attacking:
		$AnimationPlayer.play("zap")
	else:
		# disable collission shape ., all of them
		collission_shape1.monitorable = false
		collission_shape2.monitorable = false
		collission_shape3.monitorable = false
		var death_audio = get_node("../AudioStreamPlayer")
		var idle_audio = get_node("../AudioStreamPlayer")
		$AnimationPlayer.play("die")
		idle_audio.stop()
		if one_shot:
			death_audio.play()
			one_shot = false
		
		
		
func _on_Area_area_entered(area):
	jellu_alive = false
	
	print("Explode")
	


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "die":
		var source_jelly = get_node("..")
		source_jelly.queue_free()
	if anim_name == "zap":
		$AnimationPlayer.stop()
		attack_anim_finished = true # this is a bad idea how do I reset
		#emit_signal(attack_anim_finished)
	


func _on_attack_box_area_entered(area):
	if(area.is_in_group("player")):
		attacking = true
