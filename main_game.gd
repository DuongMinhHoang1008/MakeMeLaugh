extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$RockMonster.set_enemy($Player)
	$Player.set_enemy($RockMonster)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
