extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var cur_pos = Vector2()

const JUMP_VEL = 200
const GRAVITY = 100

var velocity = 0.0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	self.set_process(true)
	self.set_process_input(true)

func _process(delta):
	cur_pos =  self.get_pos()
	velocity -= GRAVITY * delta
	
	cur_pos.y -= velocity * delta
	
	self.set_pos(cur_pos)
	
	#if (cur_pos.x > self.get_viewport_rect().size.width + self.get_item_rect().size.width/2):
	#	cur_pos.x = -self.get_item_rect().size.width/2

	#self.set_pos(cur_pos)
	
func _input(event):
	# if user left clicks
	if event.type == InputEvent.MOUSE_BUTTON:
		if event.button_index == 1 and velocity <= 0.0:
			velocity = JUMP_VEL