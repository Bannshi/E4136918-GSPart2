extends StaticBody2D


func go_time():
	$Sprite2D.visible = false
	$Sprite2D2.visible = false
	$Sprite2D3.visible = false
	$Sprite2D4.visible = false
	$CollisionShape2D.disabled = true

func reverse():
	$Sprite2D.visible = true
	$Sprite2D2.visible = true
	$Sprite2D3.visible = true
	$Sprite2D4.visible = true
	$CollisionShape2D.disabled = false
