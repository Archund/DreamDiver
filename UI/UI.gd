extends Node2D

var dreams=[]

var game
var winSound
var loseSound
var song


func load_game():
	var gamescene =dreams[randi() % dreams.size()]
	game = gamescene.instance()
	add_child(game)
	game.global_position = Vector2(0,0)
	game.connect("win",self,"_win")
	game.connect("lose",self,"_lose")
	get_node("TIME").start(game)



func _ready():
	get_node("HEARTS").connect("gameOver", self, "_gameOver")
	dreams = [ 
		preload("res://dreams/Shark/SharkAttack.tscn"),
		preload("res://dreams/Poke/Poker.tscn")
	]

	winSound = get_node("winSound")
	loseSound = get_node("loseSound")
	song = get_node("song")
	song.connect("finished", self, "_songLoop")
	song.play(0)

	load_game()


	
func _win():
	get_node("TIME").win()
	global.score = global.score+1
	winSound.play(0)
	reset()

func _lose():
	get_node("TIME").lose()
	loseSound.play(0)
	reset()


func reset():
	remove_child(game)
	game.queue_free()
	load_game()


func _gameOver():
	print("GAME OVER")
	get_tree().change_scene("res://global/GameOver.tscn")


func _songLoop():
	song.play(0)