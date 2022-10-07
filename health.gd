extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var current_health = 100
var current_pee = 100

var peeing_status = false
# Called when the node enters the scene tree for the first time.
func _ready():
	# initialize pee
	pass
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#var decrement_health = get_node("/root/Spatial/jelly") 
	#var decrement_health = get_tree().get_nodes_in_group("enemy") # more robust , gets from all enemies
	#var decrement_health = get_node("/root/Spatial/").get_nodes_in_group("Enemy")
	var target_pee_bar = get_node("pee_progress_bar")
	target_pee_bar.value = current_pee
	
	#print(current_health)
	var target_health_bar = get_node("health")
	target_health_bar.value = current_health
	
	# initialize pee 

	
	if (current_health <= 0 ):
		get_tree().change_scene("res://game_over.tscn")
		
	
	







func _on_Area2_area_entered(area):
	print("Jelly Sensually touched you")
	current_health = current_health - 20


func _on_Timer_timeout():
	if peeing_status:
		current_pee = current_pee - 5
	

func _on_Player_start_peeing(pee_status):
	peeing_status = pee_status # peeing status goes true when peeing
	
