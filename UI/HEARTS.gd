extends CanvasLayer

signal gameOver

const HEART_COUNT = 3
const HEART_OFFSET = 48

var HA
var fill

func _ready():
	
	HA = self.get_children()
	fill = HA.size()
	get_parent().get_node("TIME").connect("minus",self,"_loseLife")

func _loseLife():
	fill = fill-1
	if( fill == 0 ):
		emit_signal("gameOver")


func _process(delta):

	for h in HA:
		var i = h.get_index()+1

		if( i <= fill): h.frame = 0
		else: h.frame = 1


