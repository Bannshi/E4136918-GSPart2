extends Area2D


func _on_area_entered(_area: Area2D) -> void:
	$CollisionShape2D.set_deferred("disabled",true)
	$AudioStreamPlayer2D.pitch_scale = randf_range(1.0,1.2)
	$AudioStreamPlayer2D.play()
	$Sprite2D.visible = false
	await $AudioStreamPlayer2D.finished
	queue_free()
