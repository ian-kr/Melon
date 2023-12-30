extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$CharmGabriel.hide()
	$CharmMichael.hide()
	$CharmRaphael.hide()
	pass # Replace with function body.

func showTalismans():
	for talisman in Talisman.talismans:
		if talisman == "Gabriel":
			$CharmGabriel.show()
		if talisman == "Michael":
			$CharmMichael.show()
		if talisman == "Raphael":
			$CharmRaphael.show()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
