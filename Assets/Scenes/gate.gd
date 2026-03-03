extends StaticBody2D


func open_gate():
	%PlayerCamera.enabled = false
	$Camera2D.enabled = true
	await get_tree().create_timer(1.0).timeout
	$CollisionShape2D.disabled = true
	$GateTop.set_frame(72)
	$GateBottom.set_frame(87)
	await get_tree().create_timer(1.0).timeout
	$Camera2D.enabled = false
	%PlayerCamera.enabled = true
