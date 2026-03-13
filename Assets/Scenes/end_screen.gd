extends Node2D


func _on_es_area_2d_area_entered(_area: Area2D) -> void:
	%CanvasLayer.visible = false
	$ColorRect.color = Color(0.0, 0.0, 0.0, 0.196)
	await get_tree().create_timer(0.05).timeout
	$ColorRect.color = Color(0.0, 0.0, 0.0, 0.392)
	await get_tree().create_timer(0.05).timeout
	%PlayerCharacter.attacking = true
	$ColorRect.color = Color(0.0, 0.0, 0.0, 0.588)
	await get_tree().create_timer(0.05).timeout
	$ColorRect.color = Color(0.0, 0.0, 0.0, 0.784)
	await get_tree().create_timer(0.05).timeout
	$ColorRect.color = Color(0.0, 0.0, 0.0, 1.0)
	await get_tree().create_timer(0.5).timeout
	%PlayerCamera.enabled = false
	$ESCamera2D.enabled = true
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
