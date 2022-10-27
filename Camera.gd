extends Camera

var SENSITIVITY_Y = 1 # not sure why needed . 
var INVERSION_MULT = 1
var MAX_Y = 89

func initializeComponents():
	SENSITIVITY_Y = self.get_parent().Sensitivity_Y
	MAX_Y = self.get_parent().Maximum_Y_Look
	if self.get_parent().Invert_Y_Axis:
		INVERSION_MULT = 1
	else:
		INVERSION_MULT = -1

func _ready():
	self.initializeComponents()
	print("test ",SENSITIVITY_Y)
	pass
	
