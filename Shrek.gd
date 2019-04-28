extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var VELOCITY = -200
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(false)
	pass # Replace with function body. 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += VELOCITY*delta
	if position.x <= 2000:
		queue_free()
	
	pass
