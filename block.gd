extends Node2D

var block_code = [0,0,0]
const default = [0,0,0]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func block(attack_code: Array, hit: int):
	if get_parent().has_method("damage"):
		for i in range(3):
			print(str(attack_code))
			print(str(block_code))
			if attack_code[i] > block_code[i]:
				get_parent().call("damage", hit)

func set_block(bc: Array):
	if bc.size() == 3:
		block_code = bc

func set_default():
	block_code = default

func set_full_block():
	block_code = [1,1,1]
