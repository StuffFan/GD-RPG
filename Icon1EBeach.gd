extends CharacterBody2D
var max_hp=5
var curr_hp=5
var current_move={
	"name": "tumble",
	"dmg":2,
	"cooldown": 5,
	"accuracy":90
}
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

const SPEED = 50

var direction=1
var updown=0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func _physics_process(delta):
	velocity.x = direction * SPEED
	#velocity.x = move_toward(velocity.x, 0, SPEED)
	velocity.y = updown * SPEED
