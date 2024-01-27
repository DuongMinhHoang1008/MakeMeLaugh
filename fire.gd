extends RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.has_method("damage") and not body.has_method("be_tickled"):
		print("ok")
		queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
