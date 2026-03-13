extends CharacterBody2D

const SPEED = 80

var Direction:Vector2 = Vector2(0,0)

var bsword:bool = false
var bswordleft:bool = true
var bswordright:bool = false
var attacking:bool = false


var gem_counter = 0
@onready var gem_label: Label = %GemLabel
@onready var sword_collision: CollisionShape2D = $Area2DSword/SwordCollisionShape2D
@onready var walk_audio: AudioStreamPlayer2D = $WalkAudio
@onready var sword_audio: AudioStreamPlayer2D = $SwordAudio
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _physics_process(_delta: float) -> void:
	
	if Input.is_action_pressed("MouseLeft") && bsword && !attacking:
			attacking = true
			sword_collision.disabled = false
			animation_player.play("SwordAttack")
			await animation_player.animation_finished
			attacking = false
			sword_collision.disabled = true
	
	Direction = Vector2(Input.get_axis("ui_left", "ui_right"), Input.get_axis("ui_up", "ui_down"))
	if Direction.length() > 1:
		Direction = Direction.normalized()
	
	if !attacking:
		
		if Direction.x < -0.5:
			move_sword_left()
		if Direction.x > 0.5:
			move_sword_right()
		
		if Direction.x:
			velocity.x = Direction.x * SPEED
			$Sprite2D.flip_h = Direction.x < 0
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		
		if Direction.y:
			velocity.y = Direction.y * SPEED
		else:
			velocity.y = move_toward(velocity.y, 0, SPEED)
		
		if Direction && !attacking:
			animation_player.play("Run")
		if !Direction && !attacking:
			animation_player.play("Idle")
		
		move_and_slide()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("gem"):
		set_gem_count(gem_counter + 1)


func set_gem_count(new_gem_count: int) -> void:
	gem_counter = new_gem_count
	gem_label.text = str(gem_counter)

func move_sword_left():
	if bswordleft:
		sword_collision.translate(Vector2(-17,0))
		bswordleft = false
		bswordright = true

func move_sword_right():
	if bswordright:
		sword_collision.translate(Vector2(17,0))
		bswordleft = true
		bswordright = false

func play_walk_sound():
	walk_audio.play()

func play_sword_sound():
	sword_audio.play()
