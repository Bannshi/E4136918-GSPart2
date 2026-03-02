extends Area2D

@onready var interaction_area = $InteractionArea

func _ready():
	interaction_area.interact = Callable(self, "_pickup_sword")

func _pickup_sword():
	%PlayerCharacter.bsword = true
	queue_free()
