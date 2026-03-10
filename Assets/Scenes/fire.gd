extends Area2D

var xoffset:float = 0

func go_time():
	$CollisionShape2D/Sprite2D.visible = true
	await get_tree().create_timer(0.5).timeout
	while xoffset < 1584:
		xoffset += 24
		$CollisionShape2D.position = Vector2(xoffset,0)
		await get_tree().create_timer(0.39).timeout


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		go_again()

func go_again() -> void:
	%PlayerCharacter.attacking = true
	$ColorRect.color = Color(0.0, 0.0, 0.0, 0.196)
	await get_tree().create_timer(0.05).timeout
	$ColorRect.color = Color(0.0, 0.0, 0.0, 0.392)
	await get_tree().create_timer(0.05).timeout
	$ColorRect.color = Color(0.0, 0.0, 0.0, 0.588)
	await get_tree().create_timer(0.05).timeout
	$ColorRect.color = Color(0.0, 0.0, 0.0, 0.784)
	await get_tree().create_timer(0.05).timeout
	$ColorRect.color = Color(0.0, 0.0, 0.0, 1.0)
	await get_tree().create_timer(1.6).timeout
	%PlayerCharacter.global_position = Vector2(888,242)
	xoffset = -48
	%PlayerCharacter.attacking = false
	await get_tree().create_timer(0.4).timeout
	$ColorRect.color = Color(0.0, 0.0, 0.0, 1.0)
	await get_tree().create_timer(0.05).timeout
	$ColorRect.color = Color(0.0, 0.0, 0.0, 0.784)
	await get_tree().create_timer(0.05).timeout
	$ColorRect.color = Color(0.0, 0.0, 0.0, 0.588)
	await get_tree().create_timer(0.05).timeout
	$ColorRect.color = Color(0.0, 0.0, 0.0, 0.392)
	await get_tree().create_timer(0.05).timeout
	$ColorRect.color = Color(0.0, 0.0, 0.0, 0.0)
