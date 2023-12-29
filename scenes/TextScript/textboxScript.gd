extends CanvasLayer


@onready var textPanel = $TextPanel
@onready var startTag = $TextPanel/Start
@onready var endTag = $TextPanel/End
@onready var textBox = $TextPanel/Text
@onready var timer = $TextPanel/Timer
@onready var tween = create_tween()

const readRate = 0.1
var line = 0
var textqueue = []
enum state {
	READY,
	READING,
	FINISHED
}
var currentState = state.READY
# Called when the node enters the scene tree for the first time.
func _ready():
	hideTextbox() # Replace with function body.
	queue("First text")
	queue("Second text")
	queue("Third text")
	queue("Forth text")
	#for thing in text:
		#if 
		#addText(thing)

func queue(text):
	textqueue.push_back(text)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match currentState:
		state.READY:
			if !textqueue.is_empty():
				addText()
		state.READING:
			if (Input.is_action_just_pressed("ui_accept")):
				timer.stop()
				textBox.visible_ratio = 1
				endTag.text = "V"
				tween.stop()
				changeState(state.FINISHED)
		state.FINISHED:
			if (Input.is_action_just_pressed("ui_accept")):
				changeState(state.READY)
				hideTextbox()
func hideTextbox():
	textPanel.hide()
	startTag.text = ""
	endTag.text = ""
	textBox.text = ""

func showTextBox():
	textPanel.show()
	startTag.text = "*"
	
func addText():
	var text = textqueue.pop_front()
	
	textBox.visible_ratio = 0.0
	textBox.text = text
	changeState(state.READING)
	showTextBox()
	tween = create_tween()
	tween.tween_property(textBox,"visible_ratio",1.0,len(text) * readRate)
	timer.start(len(text) * readRate)
	
	
	

func changeState(newstate):
	currentState = newstate
	
func _on_timer_timeout():
	changeState(state.FINISHED)
	endTag.text = "V"
	
	
	pass # Replace with function body.
