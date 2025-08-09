extends CharacterBody2D

const SPEED = 10

var direction=0
var updown=0
var path = [[10,0],[0,10],[0,10],[-10,0],[-10,0],[-10,0],[-10,0],[0,10],[-10,0],[0,-10],[0,-10],[0,-10],[10,0],[10,0],[10,0],[10,0]]
var current_path=0
var delay=0

# Called when the node enters the scene tree for the first time.

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	var continued_path = path [current_path]
	direction = continued_path [0]
	updown = continued_path [1]
	velocity.x = direction * SPEED
	#velocity.x = move_toward(velocity.x, 0, SPEED)
	velocity.y = updown * SPEED
	var collision=move_and_collide(Vector2(velocity.x,velocity.y)*delta)
	if collision: print(collision.get_collider())
	delay+=delta
	print(delay)
	if delay>0.75:
		current_path+=1
		delay=0
		if current_path >= path.size():
			current_path=0

func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
	print (body.get_name())
	if (body.get_name() == "icon_4"):
		get_tree().change_scene_to_file("res://scenes/battle.tscn")
