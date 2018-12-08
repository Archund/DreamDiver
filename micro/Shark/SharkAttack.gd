extends Node2D

signal win
signal lose

const MESSAGE = "SHARK!"

var shark
var shSp 		= 400
var shV 		= 50

var shMAX		= 320
var shMIN		= 65

var diver
var dvSp 		= 160
var grav		= 3
var dvMove		=Vector2()

var uptime 		= true

var collision


func _ready():
	shark = get_node("Shark")
	shSp = rand_range(shSp-shV, shSp+shV)
	diver = get_node("Diver")

	shark.position.x = get_viewport().size.x + 65
	shark.position.y = rand_range(shMIN, shMAX-65)



func input_check():
   # Mouse in viewport coordinates
	if Input.is_action_just_released("mA"):
		dvMove = Vector2(0, -dvSp)
	elif Input.is_action_just_released("mB"):
		dvMove = Vector2(0, dvSp)
	else:
		dvMove += Vector2(0,grav)

func _physics_process(delta):
	input_check()

	if(shark.position.x<=0 && uptime):
		uptime = false
		print("Won shark game")
		emit_signal("win")

	diver.move_and_collide(dvMove*delta)
	if(diver.position.y > 300): diver.position.y = 300
	if(diver.position.y < 20): diver.position.y = 20


	collision = shark.move_and_collide(Vector2(position.x-shSp,0)*delta)
	if(collision):
		if( collision.collider == diver):
			uptime = false
			print("Lost shark game")
			emit_signal("lose")

