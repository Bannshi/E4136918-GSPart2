extends Area2D

var yoffset:float = 0
var xoffset:float = 0

func _on_area_entered(_area: Area2D) -> void:
	$CollisionShape2D.queue_free()
	%PlayerCharacter.attacking = true
	%PlayerCharacter/AnimatedSprite2D.play("Idle")
	%PlayerCamera.enabled = false
	$FireCamera2D.enabled = true
	while yoffset < 80:
		yoffset = yoffset + 2
		$FireCamera2D.set_offset(Vector2(0,yoffset))
		await get_tree().create_timer(0.01).timeout
	await get_tree().create_timer(0.2).timeout
	$"../IdolSpikes2".reverse()
	await get_tree().create_timer(1).timeout
	while xoffset > -80:
		yoffset = yoffset - 2
		xoffset = xoffset - 2
		$FireCamera2D.set_offset(Vector2(xoffset,yoffset))
		await get_tree().create_timer(0.01).timeout
	await get_tree().create_timer(0.2).timeout
	$"../Fire".go_time()
	await get_tree().create_timer(1).timeout
	%PlayerCamera.enabled = true
	$FireCamera2D.enabled = false
	%PlayerCharacter.attacking = false
	$"../Wisps/WispRoom5".visible = true
