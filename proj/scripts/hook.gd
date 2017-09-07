extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export var MOV_VEL = 600

var cur_pos = Vector2()
var velocity = 0.0
var isLeavingScreen = false

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	self.set_process(true)
	randomize()
	MOV_VEL += rand_range(-50, 100)
	MOV_VEL *= sign(rand_range(-1, 1)) # why no bools


func _process(delta):
	cur_pos = self.get_pos()
	isLeavingScreen = cur_pos.y > self.get_viewport_rect().size.height || cur_pos.y < 0
	MOV_VEL = -MOV_VEL if isLeavingScreen else MOV_VEL
	velocity = MOV_VEL * delta
	cur_pos.y += velocity * delta 
	self.set_pos(cur_pos)
	
