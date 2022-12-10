extends CSGMesh


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var test = get_node(".")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(test.get_transform())
	test.set_transform(1,0,0,0,1,0,0,0,1-0,0,0)
	
