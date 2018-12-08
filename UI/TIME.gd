extends CanvasLayer

signal minus


export var time = 1

var TA
var Tim
var activeSegments
var uptime

var helpText




func initTim():
	uptime = true
	activeSegments = TA.size()+1

	Tim.wait_time = time
	Tim.start()
	get_node("CAT").frame=0

func win():
	Tim.stop()
	#get success signal

func lose():
	Tim.stop()
	get_node("CAT").frame = 1
	uptime = false
	emit_signal("minus")

func timeOver():
	lose()
	get_parent().reset()

func _timeout():
	activeSegments = activeSegments - 1


func start(game):
	helpText.set(game.MESSAGE)
	initTim()





func _ready():
	
	#Timer segment array
	TA = get_node("Tstart").get_children()
	helpText = get_node("INFO")

	#create the timer
	Tim = Timer.new()
	self.add_child(Tim)
	Tim.connect("timeout", self, "_timeout")
	initTim()




func _process(delta):
	
	#display timer segments
	for t in TA :
		var i = t.get_index()+1

		if( i == TA.size()):
			if(i == activeSegments-1): t.frame = 3
			elif(i == activeSegments): t.frame = 4
			else: t.frame = 0
		else:
			if( i < activeSegments ):
				t.frame  = 2
			elif( i == activeSegments):
				t.frame = 4
			elif( i > activeSegments):
				t.frame = 0

	if(activeSegments == 0 && uptime): 
		get_node("Tstart").frame = 0
		timeOver()
	else:
		get_node("Tstart").frame = 1
