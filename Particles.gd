extends Particles


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var presented = 0
var have_pee_left = true
var infinite_pee = false
onready var player_status = get_node("../../")
# Called when the node enters the scene tree for the first time.
func _ready():
	emitting = false
	
	process_material.set("initial_velocity", 10)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	presented = player_status.ready_for_boss
	if presented == 3:
		infinite_pee = true
		process_material.set("initial_velocity", 50)

func _on_Player_start_peeing(pee_status):
	#print("have_pee_left", have_pee_left )
	if(have_pee_left == true || infinite_pee):
		emitting = pee_status
	else:
		emitting = false



func _on_Control_out_of_pee(no_piss):
	#print("no_piss", no_piss)
	have_pee_left = no_piss
