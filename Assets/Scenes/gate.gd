extends StaticBody2D

#func _ready():
#	open_gate()

func open_gate():
	$CollisionShape2D.disabled = true
	$GateTop.set_frame(72)
	$GateBottom.set_frame(87)
