extends CSGBox


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var time = 1.1
var velocity
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# start sin motion 
	time += delta
	var freq = 1
	var amplitude = .003
	var v = Vector3(0, 0, 0)
	v.y = sin(time * freq) * amplitude
	velocity = v
	#print(velocity)
	var move = self.translate(velocity)
	# end sin motion 
