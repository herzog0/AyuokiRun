extends CanvasLayer

var tempo = 0
var time_to_dark = 5;
var ratio = tempo/time_to_dark
signal multiplier(mult)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	tempo += delta
	ratio = tempo/time_to_dark
	if ratio > 1:
		print("maior que")
		$Sprite2.show()
	else:
		$Sprite2.hide()
		$Sprite.set_modulate(Color(ratio/10,0,0,ratio))
	emit_signal("multiplier", ratio)
	$Label.text = str(tempo)
	pass
