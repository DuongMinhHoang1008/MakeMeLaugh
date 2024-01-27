extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$RedDevil.set_enemy($Player)
	$Player.set_enemy($RedDevil)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
