extends StaticBody2D

func open_gate():
	$CollisionShape2D.disabled = true
	$GateTop.set_frame(72)
	$GateBottom.set_frame(87)
