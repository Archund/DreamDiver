extends Node2D

var button
var song

func _ready():
	button = get_node("StartButton")
	button.connect("pressed", self, "_start")

	song = get_node("song")
	song.connect("finished", self, "_songLoop")
	song.play(0)


func _start():
	print("changing scene")
	get_tree().change_scene("res://UI/UI.tscn")

func _songLoop():
	song.play(0)
