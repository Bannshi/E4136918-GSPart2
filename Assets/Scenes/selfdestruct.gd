extends Area2D


func _on_area_entered(_area: Area2D) -> void:
	$AudioStreamPlayer2D.play()
	queue_free()
