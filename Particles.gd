extends Particles


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var have_pee_left = true

# Called when the node enters the scene tree for the first time.
func _ready():
	emitting = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_Player_start_peeing(pee_status):
	#print("have_pee_left", have_pee_left )
	if(have_pee_left == true):
		emitting = pee_status
	else:
		emitting = false



func _on_Control_out_of_pee(no_piss):
	#print("no_piss", no_piss)
	have_pee_left = no_piss
