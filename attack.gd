extends Node2D

var in_attack_time: bool = false
var in_attack_cooldown: bool = false
var attack_code: Array = [0,0,0]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func do_attack(target) -> void:
	if not in_attack_cooldown and not in_attack_time and target.has_method("damage"):
		in_attack_time = true
		await get_tree().create_timer(2.0).timeout
		in_attack_time = false
		has_block(target)
		
		in_attack_cooldown = true
		await get_tree().create_timer(1.0).timeout
		in_attack_cooldown = false

func has_block(target):
	for i in range(target.get_child_count()):
		if target.get_child(i).has_method("block"):
			target.get_child(i).call("block", attack_code, 10)

func set_attack(ac: Array):
	if ac.size() == 3:
		attack_code = ac
