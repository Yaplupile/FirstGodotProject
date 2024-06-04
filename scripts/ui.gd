extends CanvasLayer
class_name UI

@onready var score_coins = %ScoreCoins

var score = 0:
	set(new_score):
		score=new_score;
		_update_label();

func _update_label():
	score_coins.text= str(score) + "x" 
	
func _ready():
	_update_label();

func _on_collected()->void:
	score+=1

