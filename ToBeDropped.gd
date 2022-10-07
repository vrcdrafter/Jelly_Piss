extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var current_pos = Vector3(0,0,0)
export var jelly_strike = "id_null" 
# Called when the node enters the scene tree for the first time.
func _ready():
	null

func _process(delta):
	var update_pos = get_node("Player")
	
	current_pos = self.transform.origin - update_pos.new_pos
	
	



