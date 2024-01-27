extends Button
class_name TicklePoint

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	pressed.connect(tickle)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func tickle():
	if get_parent().has_method("be_tickled"):
		get_parent().call("be_tickled")
