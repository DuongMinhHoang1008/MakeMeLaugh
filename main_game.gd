extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Monster.set_enemy($Player)
	$Player.set_enemy($Monster)
	$AudioStreamPlayer2D.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
