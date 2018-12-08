extends Node2D

signal win
signal lose

const MESSAGE = "POKE!"

var finger
var eye

var speed = 20

var movement = Vector2()

func _ready():
	finger = get_node("Finger")
	eye = get_node("Eye")

func checkInput():
	var mouse = get_viewport().get_mouse_position()
	movement.x = mouse.x - finger.position.x
	movement.y = mouse.y - finger.position.y


func _physics_process(delta):
	checkInput()
	var collision = finger.move_and_collide(movement*delta*speed)
	if collision :
		if(collision.collider == eye):
			emit_signal("win")
