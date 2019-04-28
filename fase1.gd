extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var theme_music
var entered_shrek = false
var initial_position

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	for coin in $Moedas.get_children():
		coin.connect("body_entered", self, "_on_coin_meu_entrou", [coin])
	$CanvasLayer.connect("multiplier", $MJ, "set_multiplicador")
	$chapeu.player = $jogador
	var song_vector = [$sounds/Themes/v1, $sounds/Themes/v2, $sounds/Themes/v3, $sounds/Themes/v4, $sounds/Themes/v5]
	song_vector.shuffle()
	theme_music = song_vector[0]
	theme_music.set_volume_db(-10)
	theme_music.play()
	
	check_checkpoint()
	
		
	pass # Replace with function body.


func check_checkpoint():
	if !global.checkpoint:
		$jogador.position = $pos_init.position
	else:
		$jogador.position = $pos_checkpoint.position
		$MJ.position.y = 295.054
		$MJ.position.x = $jogador.position.x - 500
		$checkpoint.queue_free()
		$Shrek.queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass


func _on_MJ_body_entered(body):
	if body == $jogador:
		_player_died("mj")
	pass # Replace with function body.




func _player_died(cause):
	if theme_music != null:
		theme_music.stop()
	if cause == "hat" and not ($sounds/rusbe.playing or $sounds/shrek.playing):
		$sounds/hat.play()
		$CanvasLayer2/back2.show()
	elif cause == "mj" and not ($sounds/hat.playing or $sounds/shrek.playing):
		$sounds/rusbe.play()
		$CanvasLayer2/back2.show()
	elif cause == "shrek" and not ($sounds/hat.playing or $sounds/rusbe.playing):
		$sounds/shrek.play()
		$CanvasLayerShrek/shrekinho.show()
		
	$Timer.start()
	pass

func _on_Timer_timeout():
	get_tree().change_scene("res://fase1.tscn")
	pass # Replace with function body.


func _on_coin_meu_entrou(body, coin):
	if body == $jogador:
		$CanvasLayer.tempo = 0
		$Moedas/coin_collected.play()
		coin.queue_free()
		print("moeda coeltada")
	pass # Replace with function body.


func _on_TimerChapeu_timeout():
	print("chapeu")
	$chapeu.position = ($MJ.position + $MJ/Chapeu.position)
	$chapeu.velocidade = ($jogador.position - ($MJ.position + $MJ/Chapeu.position)).normalized()
	print($chapeu.velocidade)
	pass # Replace with function body.


func _on_Chao_body_entered(body):
	if body == $jogador:
		_player_died("fell")
	pass # Replace with function body.


func _on_chapeu_body_entered(body):
	if body == $jogador:
		_player_died("hat")
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	if body == $jogador:
		if entered_shrek == false:
			$Shrek.set_process(true)
			$Shrek/AudioStreamPlayer2D.play()
			entered_shrek = true
	pass # Replace with function body.


func _on_Shrek_body_entered(body):
	if body == $jogador:
		_player_died("shrek")
	pass # Replace with function body.


func _on_checkpoint_body_entered(body):
	if body == $jogador:
		$checkpoint.hide()
		global.checkpoint = true
	pass # Replace with function body.


func _on_fim_body_entered(body):
	if body == $jogador:
		get_tree().quit()
	pass # Replace with function body.
