extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var velocidade = Vector2()
var speed = 500
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += velocidade*speed*delta
	
	pass


func _on_Area2D_body_entered(body):
	if body == player:
		velocidade = Vector2(1,0)
	pass # Replace with function body.