extends Node2D

signal dodge
var in_dodge_time: bool = false
var enemy
var pos: Vector2
const moveset_attack = [[1,0,0], [0,0,1]]
const moveset_block = [[0,1,1], [1,1,0]]

# Called when the node enters the scene tree for the first time.
func _ready():
	pos = $Icon.position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Input.get_axis("dodge_left", "dodge_right")
	if direction and not in_dodge_time:
		dodge.emit()
		$Icon.position = Vector2(584 + direction * 184, 512)
		if direction < 0:
			direction = 0
		$Block.set_block(moveset_block[direction])
		in_dodge_time = true
		await get_tree().create_timer(1.0).timeout
		in_dodge_time = false
		$Block.set_default()
		$Icon.position = Vector2(584, 512)



func is_in_attack_time() -> bool:
	return $Attack.in_attack_time

func damage(hit: int):
	print("player hit")

func set_enemy(entity):
	enemy = entity
