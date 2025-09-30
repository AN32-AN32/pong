extends CharacterBody2D

@onready var screen_size = get_viewport_rect().size
const SPEED = 500.0


func _physics_process(_delta: float) -> void:
	velocity.y = 0
	var direction := Input.get_axis("up", "down")
	if direction:
		velocity.y = direction * SPEED
	elif direction == -1:
		velocity.y = direction * SPEED
	move_and_slide()
	
	position = position.clamp(Vector2(0, 50), screen_size - Vector2(0, 50))
