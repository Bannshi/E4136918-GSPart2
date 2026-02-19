extends CharacterBody2D

const SPEED = 100.0


func _physics_process(_delta: float) -> void:
	
	var Direction:Vector2 = Vector2(Input.get_axis("ui_left", "ui_right"), Input.get_axis("ui_up", "ui_down"))
	if Direction.length() > 1:
		Direction = Direction.normalized()
	
	if Direction.x:
		velocity.x = Direction.x * SPEED
		$AnimatedSprite2D.flip_h = Direction.x < 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if Direction.y:
		velocity.y = Direction.y * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	if Direction:
		$AnimatedSprite2D.play("Run")
	else:
		$AnimatedSprite2D.play("Idle")



	move_and_slide()
	
	
