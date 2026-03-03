extends StaticBody2D

var yoffset:int = 0
var inside:bool = false

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		inside = true
		while yoffset > -50 && inside:
			yoffset = yoffset - 1
			%PlayerCamera.set_offset(Vector2(0,yoffset))
			await get_tree().create_timer(0.005).timeout

func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.is_in_group("player"):
		inside = false
		while yoffset < 0 && !inside:
			yoffset = yoffset + 1
			%PlayerCamera.set_offset(Vector2(0,yoffset))
			await get_tree().create_timer(0.005).timeout
