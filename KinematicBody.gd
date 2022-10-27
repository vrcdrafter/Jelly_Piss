extends KinematicBody

export var Sensitivity_X = 0.01
export var Sensitivity_Y = 0.01 # this seems to expoer the variable to the camera
export var Invert_Y_Axis = false
export var Exit_On_Escape = true
export var Maximum_Y_Look = 45
export var Accelaration = 5
export var Maximum_Walk_Speed = 5
export var Jump_Speed = 2

signal start_peeing(pee_status)

export var new_pos =  Vector3(0,0,0)

const GRAVITY = 0.098
var velocity = Vector3(0,0,0)
var velocity_2 = Vector3(1,0,0)
var forward_velocity = 0
var Walk_Speed = 0
var pee = false
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	forward_velocity = Walk_Speed
	set_process(true)
	
	

func _process(delta):
	if Exit_On_Escape:
		if Input.is_key_pressed(KEY_ESCAPE):
			get_tree().quit()
			
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		pee = true
	else:
		pee = false
	
	
func _physics_process(delta):
	velocity.y -= GRAVITY
	
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		pee = true
		
	
	


		

	if Input.is_key_pressed(KEY_LEFT) or Input.is_key_pressed(KEY_A):
		Walk_Speed += Accelaration
		if Walk_Speed > Maximum_Walk_Speed:
			Walk_Speed = Maximum_Walk_Speed
		velocity.x = -global_transform.basis.x.x * Walk_Speed
		velocity.z = -global_transform.basis.x.z * Walk_Speed
		
	if Input.is_key_pressed(KEY_RIGHT) or Input.is_key_pressed(KEY_D):
		Walk_Speed += Accelaration
		if Walk_Speed > Maximum_Walk_Speed:
			Walk_Speed = Maximum_Walk_Speed
		velocity.x = global_transform.basis.x.x * Walk_Speed
		velocity.z = global_transform.basis.x.z * Walk_Speed
		
	if not(Input.is_key_pressed(KEY_W) or Input.is_key_pressed(KEY_A) or Input.is_key_pressed(KEY_S) or Input.is_key_pressed(KEY_D) or Input.is_key_pressed(KEY_UP) or Input.is_key_pressed(KEY_DOWN) or Input.is_key_pressed(KEY_LEFT) or Input.is_key_pressed(KEY_RIGHT) ):
		velocity.x = 0
		velocity.z = 0
		
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = Jump_Speed
	velocity = move_and_slide(velocity, Vector3(0,1,0))
	velocity_2 = move_and_slide(velocity_2, Vector3(0,1,0))
	#emit_signal(test_var)  # well darn , that doesnt work .
	new_pos = self.transform.origin
	emit_signal("start_peeing", pee)

