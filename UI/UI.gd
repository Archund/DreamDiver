extends Node2D

var micros=[]

var game


func load_game():
	var gamescene =micros[randi() % micros.size()]
	game = gamescene.instance()
	add_child(game)
	game.global_position = Vector2(0,0)
	game.connect("win",self,"_win")
	game.connect("lose",self,"_lose")
	get_node("TIME").initTim()



func _ready():
	get_node("HEARTS").connect("gameOver", self, "_gameOver")
	micros = [ 
		preload("res://micro/Shark/SharkAttack.tscn"),
		preload("res://micro/Poke/Poker.tscn")
	]
	load_game()


	
func _win():
	get_node("TIME").win()
	global.score = global.score+1
	reset()

func _lose():
	get_node("TIME").lose()
	reset()


func reset():
	remove_child(game)
	game.queue_free()
	load_game()


func _gameOver():
	print("GAME OVER")
	get_tree().change_scene("res://screens/GameOver.tscn")