extends Node

@export var WIN_SCORE : int = 10

@onready var player_score_text: Label = $"../UI/PlayerScore"
@onready var ai_score_text: Label = $"../UI/AIScore"

var player_score : int = 0
var ai_score : int = 0

func _process(_delta: float) -> void:
	if player_score >= WIN_SCORE:
		pass
	elif ai_score >= WIN_SCORE:
		pass

func _on_ball_ai_score() -> void:
	ai_score += 1
	ai_score_text.text = str(ai_score)

func _on_ball_player_score() -> void:
	player_score += 1
	player_score_text.text = str(player_score)
