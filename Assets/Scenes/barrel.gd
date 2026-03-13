extends StaticBody2D



func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("weapon"):
		$CollisionShape2D.disabled = true
		$AudioStreamPlayer2D.pitch_scale = randf_range(1,1.2)
		$AudioStreamPlayer2D.play()
		$Sprite2D.visible = false
		await $AudioStreamPlayer2D.finished
		queue_free()
