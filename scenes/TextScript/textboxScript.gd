extends CanvasLayer

#Setup references
@onready var textPanel = $TextPanel
@onready var startTag = $TextPanel/Start
@onready var endTag = $TextPanel/End
@onready var textBox = $TextPanel/Text
@onready var tween = create_tween()

#Set up variables
const readRate = 0.1
var textqueue = []

enum state {
	READY,
	READING,
	PAUSE,
	FINISHED
}
var currentState = state.READY
# Called when the node enters the scene tree for the first time.
func _ready():
	hideTextbox() #Hides the box at the start of game

func queue(text): #Queues up the next piece of text
	textqueue.push_back(text)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match currentState: #Checks current state
		state.READY:
			#Ready state
			if !textqueue.is_empty(): #If the queue is not empty, add the next text
				addText()
		state.READING:
			#Text box is Reading state
			if (Input.is_action_just_pressed("ui_accept")): #Can skip the animation of text
				textBox.visible_ratio = 1
				endTag.text = "V"
				tween.stop()
				changeState(state.FINISHED)
		state.FINISHED:
			#Text box is finished Reading
			if (Input.is_action_just_pressed("ui_accept")): #Sets up next text by hiding the textbox
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
	if (text == "pause"): #Skips a pause
		return
	
	textBox.visible_ratio = 0.0
	textBox.text = text
	changeState(state.READING)
	showTextBox()
	tween = create_tween() #Creates a NEW tween
	tween.tween_property(textBox,"visible_ratio",1.0,len(text) * readRate) #Plays the tween
	
	
	

func changeState(newstate):
	currentState = newstate
	
func _on_timer_timeout():
	changeState(state.FINISHED)
	endTag.text = "V"
