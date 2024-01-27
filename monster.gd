class_name Monster
extends CharacterBody2D

@export var tickle: Array[TicklePoint]

signal attack
var in_attack_time: bool = true
var enemy
var direction: String
var attack_range
var health = 100
var tickle_meter: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	direction = rand_attack()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Attack.do_attack(enemy)
	
	if $Attack.in_attack_time:
		enemy.hitted = false
		$AnimationPlayer.play("attack_" + direction)
		if direction == "left": attack_range = [position.x, position.x + 106]
		else: attack_range = [position.x + 106 * 2, position.x + 106 * 3]
	elif $Attack.in_attack_cooldown:
		$Block.set_full_block()
		$AnimationPlayer.play("idle")
		direction = rand_attack()

func _physics_process(delta):
	if direction == "left":
		velocity.x = 30
	elif direction == "right":
		velocity.x = -30
	move_and_slide()

func damage(hit: int):
	health -= hit
	if health <= 0:
		queue_free()

func set_enemy(entity):
	enemy = entity

func rand_attack() -> String:
	var rand = randi_range(0, 10000) % 2
	var dir: String = "right"
	if rand == 0:
		dir = "left"
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
