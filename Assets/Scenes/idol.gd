extends StaticBody2D


@onready var interaction_area = $InteractionArea

func _ready():
	interaction_area.interact = Callable(self, "_pickup_idol")

func _pickup_idol():
	$"../IdolSpikes".go_time()
	$"../IdolSpikes2".go_time()
	$Sprite2D2.queue_free()
	$InteractionArea.queue_free()
