extends Node2D
var LAUNCH_SPEED = 250

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	print (body.name)
	var launch_vector = Vector2(1.5, -2)
	if position.x > body.position.x:
		launch_vector.x *=-1
	print (launch_vector * LAUNCH_SPEED)
	body.velocity = launch_vector * LAUNCH_SPEED
	SoundManager.play_sound("getout")
func _on_area_2d_body_exited(body):
	pass # Replace with function body.
	print ("joe metri desh")
	body.take_damage(1)
	print(body.curr_hp)
	# Replace with function body.
"res://GET OUT Meme Sound Effect.mp3"
