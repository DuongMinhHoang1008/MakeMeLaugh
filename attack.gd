extends Node2D

var in_attack_time: bool = false
var in_attack_cooldown: bool = false
signal attackEnemy

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
		
		attackEnemy.emit()
		
		in_attack_cooldown = true
		await get_tree().create_timer(3.0).timeout
		in_attack_cooldown = false
