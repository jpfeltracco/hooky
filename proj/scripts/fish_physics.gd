extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	self.set_process(true)

func _process(delta):
	var cur_pos =  self.get_pos()
	cur_pos.x += 100 * delta
	
	if (cur_pos.x > self.get_viewport_rect().size.width + self.get_item_rect().size.width/2):
		cur_pos.x = -self.get_item_rect().size.width/2
		
	self.set_pos(cur_pos)