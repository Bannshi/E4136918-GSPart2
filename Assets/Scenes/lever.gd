extends StaticBody2D

@onready var interactable: Area2D = $Interact
@onready var sprite_2d: Sprite2D = $Sprite2D

func ready() -> void:
	interactable.interact = _on_interact
	
	
func _on_interact():
	if sprite_2d.frame == 0:
		sprite_2d.frame = 1
		interactable.is_interactable = false
		#open_gate()
		print("AAAAAAAAAAAAAAAAAA")
