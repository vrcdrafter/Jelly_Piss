extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var current_health = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#var decrement_health = get_node("/root/Spatial/jelly") 
	#var decrement_health = get_tree().get_nodes_in_group("enemy") # more robust , gets from all enemies
	#var decrement_health = get_node("/root/Spatial/").get_nodes_in_group("Enemy")

	#print(current_health)
	var target_health_bar = get_node("health")
	target_health_bar.value = current_health
	
	if (current_health <= 0 ):
		get_tree().change_scene("res://game_over.tscn")
		
	
	







func _on_Area2_area_entered(area):
	print("Jelly Sensually touched you")
	current_health = current_health - 20
