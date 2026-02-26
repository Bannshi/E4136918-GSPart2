extends StaticBody2D

@onready var interaction_area = $InteractionArea
@onready var sprite_2d = $Sprite2D

func _ready():
	interaction_area.interact = Callable(self, "_open_gate")

func _open_gate():
	sprite_2d.frame = 1
	$"../Gate".open_gate()
	interaction_area.collision_mask = 0
