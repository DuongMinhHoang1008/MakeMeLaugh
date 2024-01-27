class_name Monster
extends CharacterBody2D

@export var tickle: Array[TicklePoint]

signal attack
var in_attack_time: bool = true
var enemy
var direction: String
const moveset_attack = [[1,1,0], [0,1,1]]
const moveset_block = [[1,1,0], [0,1,1]]
var health = 100
var tickle_meter: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	direction = rand_attack()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Attack.do_attack(enemy)
	
	if $Attack.in_attack_time:
		$AnimationPlayer.play("attack_" + direction)
	elif $Attack.in_attack_cooldown:
		$Block.set_full_block()
		$AnimationPlayer.play("idle")
		direction = rand_attack()

func damage(hit: int):
	health -= hit
	if health <= 0:
		queue_free()

func set_enemy(entity):
	enemy = entity

func rand_attack() -> String:
	var rand = randi_range(0, 1)
	var dir: String = "right"
	if rand == 0:
		dir = "left"
	$Attack.set_attack(moveset_attack[rand])
	$Block.set_block(moveset_block[rand])
	for t in tickle:
		t.hide()
	tickle[rand].show()
	return dir

func be_tickled():
	tickle_meter += 10
	if tickle_meter > 100:
		queue_free()

func is_in_attack_time() -> bool:
	return $Attack.in_attack_time
