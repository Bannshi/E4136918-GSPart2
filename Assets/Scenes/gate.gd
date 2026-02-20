extends StaticBody2D

func _ready() -> void:
	Open()

func Open():
	$CollisionShape2D.disabled = true
	$GateTop.set_frame(72)
	$GateBottom.set_frame(87)
