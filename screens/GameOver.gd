extends Node2D

var label
var button
var gameOverSound

func _ready():
	label = get_node("Score")
	gameOverSound = get_node("gameOverSound")

	label.text = "Score: "+str(global.score)
	button = get_node("Button")
	button.connect("pressed", self, "_restart")
	gameOverSound.play(0)


func _restart():
	print("changing scene")
	get_tree().change_scene("res://UI/UI.tscn")