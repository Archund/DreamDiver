extends Node2D

var label
var button

func _ready():
	label = get_node("Score")
	label.text = "Score: "+str(global.score)
	button = get_node("Button")
	button.connect("pressed", self, "_restart")


func _restart():
	print("changing scene")
	get_tree().change_scene("res://UI/UI.tscn")