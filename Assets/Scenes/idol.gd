extends StaticBody2D


@onready var interaction_area = $InteractionArea

func _ready():
	interaction_area.interact = Callable(self, "_pickup_idol")

func _pickup_idol():
	%PlayerCharacter.attacking = true
	%PlayerCharacter/AnimatedSprite2D.play("Idle")
	%PlayerCamera.enabled = false
	$Camera2D.enabled = true
	$"../IdolSpikes".go_time()
	$"../IdolSpikes2".go_time()
	$InteractionArea.queue_free()
	$Sprite2D2/AnimationPlayer.current_animation = "Idol_Pickup"
	await $Sprite2D2/AnimationPlayer.animation_finished
	$Sprite2D2.queue_free()
	await get_tree().create_timer(0.5).timeout
	%PlayerCamera.enabled = true
	$Camera2D.enabled = false
	%PlayerCharacter.attacking = false
	$"../Wisps/WispRoom4".visible = true
	$"../Wisps/WispRoom4".collision_layer = 1
