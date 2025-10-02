extends StaticBody2D

@export var AI : bool = false

@onready var screen_size = get_viewport_rect().size
@export var SPEED : int = 500
const DEAD_ZONE = 10.0

func _physics_process(delta: float) -> void:
	var move = 0
	if AI:
		var ball_y = $"../Ball".position.y
		var diff = ball_y - position.y
		
		if abs(diff) > DEAD_ZONE:
			move = sign(diff)
		else:
			move = 0
		position.y += move * SPEED * delta
	else:
		if Input.is_action_pressed("up"): move -= 1
		if Input.is_action_pressed("down"): move += 1
		position.y += move * SPEED * delta
	position = position.clamp(Vector2(0, 50), screen_size - Vector2(0, 50))
