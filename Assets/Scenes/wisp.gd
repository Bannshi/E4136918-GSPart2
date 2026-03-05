extends AnimatableBody2D

@onready var rtl: RichTextLabel = $RichTextLabel

var running:bool = false

func _on_area_2d_area_entered(area: Area2D) -> void:
	running = true
	if area.is_in_group("player"):
		while rtl.visible_characters < 500 && running:
			rtl.visible_characters += 1
			await get_tree().create_timer(0.01).timeout


func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.is_in_group("player"):
		running = false
		rtl.visible_characters = 0
