extends Control

var count:int = 0

func _gem_pickup():
	count = count + 1
	$Label.text(count)
