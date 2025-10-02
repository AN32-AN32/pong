extends RigidBody2D

const SPEED : int = 500

signal player_score
signal ai_score

func _get_random_direction() -> Vector2:
	var dir = Vector2.ZERO
	while abs(dir.x) < 0.4: # avoid too vertical
		dir = Vector2(randf_range(-1, 1), randf_range(-0.7, 0.7)).normalized()
	return dir

func _finish_reset(pos: Vector2, vel: Vector2) -> void:
	global_position = pos
	linear_velocity = vel
	queue_redraw()

func reset() -> void:
	var screen_center : Vector2i = get_viewport_rect().size * 0.5
	var direction = _get_random_direction()
	call_deferred("_finish_reset", screen_center, direction * SPEED)

func _physics_process(_delta: float) -> void:
	if global_position.x < 0: 
		reset()
		player_score.emit()
	if global_position.x > get_viewport_rect().size.x:
		reset()
		ai_score.emit()

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	var direction = state.linear_velocity.normalized()
	if state.linear_velocity.length() < SPEED * 0.9:
		# if body does not have a direction
		if direction.length() < 0.1:
			direction = _get_random_direction()
		state.linear_velocity = direction * SPEED
	else:
		state.linear_velocity = direction * SPEED

func _draw() -> void:
	draw_circle(Vector2.ZERO, 10, Color('#e6e6e6'))
