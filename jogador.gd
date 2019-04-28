extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(int) var SPEED = 300
export(int) var GRAVITY = 900
export(int) var JUMP = 600
var velocidade = Vector2()
var escorregar = false


# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)
	add_to_group("jogador")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocidade.y += GRAVITY*delta
	
	if not escorregar:
		velocidade.x = 0
	else:
		velocidade.x *= 0.7
		
	
	if Input.is_action_pressed("ui_right"):
		velocidade.x = SPEED
		$sprite.flip_h = false
	if Input.is_action_pressed("ui_left"):
		$sprite.flip_h = true
		velocidade.x = -SPEED
	
	if escorregar:
		velocidade.x *= 1.4
	
	if is_on_floor():
		velocidade.y = 0
		if Input.is_action_pressed("ui_up"):
			velocidade.y -= JUMP
			$jump.play()
		
		if $sprite.animation == "pulando":
			$fall.play()
		if velocidade.x == 0:
			if $sprite.animation != "parado":
				$sprite.play("parado")
		elif $sprite.animation != "andando":
			$sprite.play("andando")
	else:
		$sprite.play("pulando")
		
	move_and_slide_with_snap(velocidade, Vector2(0,5), Vector2(0,-1))
