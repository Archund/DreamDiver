extends Label

var timer
var upTime = 1

func _ready():
	timer = Timer.new()
	timer.connect("timeout", self, "_timeout")
	timer.wait_time = upTime
	timer.one_shot = true

func reset():
	pass

func _timeout():
	self.text = " "
	self.visible = false
	print("text timeout")

func sset(info):
	self.text = str(info)
	self.visible = true
	timer.start()
	print("timer start")


#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
