extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var player = get_node("../../FirstPersonController/Player")
var player_moment_pos = Vector3(0,0,0)
onready var bullet_pos = self.global_transform.origin
var t = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	print("your_a_bullet")
	player_moment_pos = player.global_transform.origin

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	t += delta/3
	
	
	print("bullet_pos",bullet_pos,"player_moment_pos",player_moment_pos,"t",t)
	self.global_transform.origin = lerp(bullet_pos,player_moment_pos,t)
	yield(get_tree().create_timer(3.0), "timeout")
	self.queue_free()



