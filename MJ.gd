extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var mj_multiplier = 1
var VELOCITY = 120

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func set_multiplicador(mult):
	mj_multiplier = 1+mult

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += VELOCITY*delta*mj_multiplier
#	pass
