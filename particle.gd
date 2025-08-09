extends RigidBody2D
var LAUNCH_SPEED = 100
func _ready():
	var launch_vector = Vector2(randf_range(-1, 1), randf_range(-2.5, -0.5)) * LAUNCH_SPEED
	transform = transform.looking_at(launch_vector)
	linear_velocity += launch_vector
	var lifetime = get_tree().create_timer(randf_range(1,3))
	await lifetime.timeout
	queue_free()
