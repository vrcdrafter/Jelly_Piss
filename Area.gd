extends Area


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var test = load("res://jelly.tscn")
	
	#get_node_and_resource()
	#print(test.get_rid().get_id())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_Player_start_peeing(pee_status):
	monitorable = pee_status
