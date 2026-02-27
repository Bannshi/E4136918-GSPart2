extends CharacterBody2D

const SPEED = 100.0

var attacking:bool = false

var gem_counter = 0
@onready var gem_label: Label = %GemLabel

@onready var sword_collision: CollisionShape2D = $Area2DSword/SwordCollisionShape2D

func _physics_process(_delta: float) -> void:
	
	if Input.is_action_pressed("MouseLeft"):
			attacking = true
			sword_collision.disabled = false
			$AnimatedSprite2D.play("SwordAttack")
			await $AnimatedSprite2D.animation_finished
			attacking = false
			sword_collision.disabled = true
	
	var Direction:Vector2 = Vector2(Input.get_axis("ui_left", "ui_right"), Input.get_axis("ui_up", "ui_down"))
	if Direction.length() > 1:
		Direction = Direction.normalized()
	
	if attacking:
		Direction = Vector2(0,0)
	
	if Direction.x:
		velocity.x = Direction.x * SPEED
		$AnimatedSprite2D.flip_h = Direction.x < 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if Direction.y:
		velocity.y = Direction.y * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	if Direction && !attacking:
		$AnimatedSprite2D.play("Run")
	if !Direction && !attacking:
		$AnimatedSprite2D.play("Idle")
	move_and_slide()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("gem"):
		set_gem_count(gem_counter + 1)

func set_gem_count(new_gem_count: int) -> void:
	gem_counter = new_gem_count
	gem_label.text = str(gem_counter)
