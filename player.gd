extends CharacterBody2D

signal dodge
var in_dodge_time: bool = false
var enemy
var pos: Vector2
const SPEED = 400
var hp = 100
var hitted = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pos = $Icon.position

func _process(delta):
	if enemy == null:
		return
	if hp == 0:
		queue_free()
	if !hitted and position.x > enemy.attack_range[0] and position.x < enemy.attack_range[1] and !enemy.is_in_attack_time():
		hitted = true
		hp -= 10
		print(hp)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var direction = Input.get_axis("dodge_left", "dodge_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	look_at(get_global_mouse_position())
	move_and_slide()

func is_in_attack_time() -> bool:
	return $Attack.in_attack_time

func damage(hit: int):
	print("player hit")

func set_enemy(entity):
	enemy = entity
