extends KinematicBody


var target = Vector2()
var velocity = Vector2()
var vector_to_player = Vector3(1,1,1)  
var player_pos = Vector3(0,0,0)
var enemy_pos = Vector3(0,0,0)
var speed = .05
var jelly_data = "null"
export var strike = 0
var test = [0,0]

func _ready():
# note I have to go up a directory first .
	jelly_data = "null"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	strike = 0 
	
	var method_a = get_node("../FirstPersonController")
	#print(method_a.test)
	player_pos = method_a.current_pos
	enemy_pos = self.transform.origin
	#print("player pos is ",player_pos, " enemy pos ", self.transform.origin)
	#get_node("/root").print_tree_pretty()
	vector_to_player = player_pos - enemy_pos
	vector_to_player = vector_to_player.normalized() # normalize the vector
	#translate(vector_to_player*speed)   #if speed = 0 then the object is stopped
	var collision_info = move_and_collide(vector_to_player*speed)
	#print (Position3D)  # how do I get absolute position in work World coordinates
	if collision_info:
		var collision_point = collision_info.position
		#print(collision_point)
	# you can do this with importing and exporting variables . 
	#jelly_health = jelly_health - method_a.jelly_strike
	jelly_data = method_a.jelly_strike

		



func _on_Area_area_entered(area):
	print("Jelly hit")
	
	self.queue_free()


func _on_attack_box_area_entered(area):
	print("Jelly_attacked you")
