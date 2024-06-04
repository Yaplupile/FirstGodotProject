extends Area2D

@onready var ui = %UI
@onready var animation_player = $AnimationPlayer

func _on_body_entered(_body):
	ui._on_collected()
	animation_player.play("pickup")
	
	

