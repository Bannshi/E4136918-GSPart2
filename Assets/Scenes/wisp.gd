extends AnimatableBody2D

@onready var rtl: RichTextLabel = $RichTextLabel


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		rtl.visible = true


func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.is_in_group("player"):
		rtl.visible = false
