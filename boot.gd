extends Control

#var splashScreen
var startScreen
var button
var song

func _ready():
	startScreen = get_node("StartScreen")
	button = startScreen.get_node("StartButton")
	button.connect("pressed", self, "_start")

	song = startScreen.get_node("loop")
	song.connect("finished", self, "_songLoop")
	song.play(0)


func _start():
	print("changing scene")
	get_tree().change_scene("res://UI/UI.tscn")

func _songLoop():
	song.play(0)