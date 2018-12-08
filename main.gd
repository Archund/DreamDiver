extends Node2D

var button

func _ready():
	button = get_node("StartButton")
	button.connect("pressed", self, "_start")


func _start():
	print("changing scene")
	get_tree().change_scene("res://UI/UI.tscn")

#func _process(delta):

#	pass
