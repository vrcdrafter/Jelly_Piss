extends CollisionShape

onready var player_status = get_node("../../")
var presented = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	presented = player_status.ready_for_boss
	if presented == 3:
		self.scale.z = 100
