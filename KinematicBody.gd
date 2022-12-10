extends KinematicBody

export var Sensitivity_X = 0.01
export var Sensitivity_Y = 0.01 # this seems to expoer the variable to the camera
export var Invert_Y_Axis = false
export var Exit_On_Escape = true
export var Maximum_Y_Look = 45
export var Accelaration = 5
export var Maximum_Walk_Speed = 5
export var Jump_Speed = 2
var shaking = false
signal start_peeing(pee_status)

export var new_pos =  Vector3(0,0,0)

const GRAVITY = 0.098
var velocity = Vector3(0,0,0)
var velocity_2 = Vector3(0,0,0)
var velocity_3 = Vector3(-5,3,0)

onready var timer = get_node("shake_timer")


var forward_velocity = 0
var Walk_Speed = 0
var pee = false

# variable for gradual_one 
var end_num = 0
var gradual_one = 0

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	forward_velocity = Walk_Speed
	set_process(true)
	timer.wait_time = 1
	

func _process(delta):
	if Exit_On_Escape:
		if Input.is_key_pressed(KEY_ESCAPE):
			get_tree().quit()
			
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		pee = true
	else:
		pee = false
	var player_pos = global_transform.origin.x
	#print(player_pos)
	var marker_pos = get_node("../../marker")
	#var final_boss_position = marker_pos.global_transform.origin
	#print(final_boss_position)
	# begin player override at end of level 
	if player_pos > 95:
		var test = analog_one()
		#print("turn")
		
		var wtransform = global_transform.looking_at(marker_pos.translation,Vector3(0,1,0))
		var wrotation = Quat(global_transform.basis).slerp(Quat(wtransform.basis), test)
		global_transform = Transform(Basis(wrotation), global_transform.origin)
	# end player override at end of level 
	
	
func _physics_process(delta):
	velocity_2.x = -global_transform.basis.z.x * 2
	velocity_2.z = -global_transform.basis.z.z * 2
	velocity.y -= GRAVITY
	
	var player_pos = global_transform.origin.x
	
	if player_pos <= 95:
		if Input.is_mouse_button_pressed(BUTTON_LEFT):
			pee = true
			
		
		if Input.is_key_pressed(KEY_W) or Input.is_key_pressed(KEY_UP):
			Walk_Speed += Accelaration
			if Walk_Speed > Maximum_Walk_Speed:
				Walk_Speed = Maximum_Walk_Speed
			velocity.x = -global_transform.basis.z.x * Walk_Speed
			velocity.z = -global_transform.basis.z.z * Walk_Speed
		if Input.is_key_pressed(KEY_S) or Input.is_key_pressed(KEY_DOWN):
			Walk_Speed += Accelaration
			if Walk_Speed > Maximum_Walk_Speed:
				Walk_Speed = Maximum_Walk_Speed
			velocity.x = global_transform.basis.z.x * Walk_Speed
			velocity.z = global_transform.basis.z.z * Walk_Speed


			

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
		velocity = move_and_slide(velocity, Vector3(0,1,0)) #movement overal 
		velocity_2 = move_and_slide(velocity_2, Vector3(0,1,0)) # constant movement forward
	
	new_pos = self.transform.origin
	emit_signal("start_peeing", pee)

	if shaking:
		move_and_slide(velocity_3, Vector3(0,1,0))


func _on_Control_give_lil_shake(shake):
	timer.start()
	shaking = true
	#print(shake)


func _on_shake_timer_timeout():
	shaking = false
	
	
func analog_one():
	var end_num = 0
	var gradual_one = 0
	end_num += .1
	gradual_one = lerp(0,1, end_num)
	
	if gradual_one > 1:
		return 1.0
	else:
		return gradual_one

