extends CharacterBody2D
const SPEED = 275
const JUMP_VELOCITY = -550
const MAX_FALL_SPEED =500
const coyote_time_max = 3

var coyote_time = coyote_time_max
var GRAVITY = ProjectSettings.get_setting("physics/2d/default_gravity")
var max_hp=10
var curr_hp=10
var current_move={
	"name": "punch",
	"dmg": 1,
	"energy": 0,
	"accuracy":75
}
@onready var Particle = preload("res://Particle.tscn")
func _ready():
 #(;. _.) ඞ 𰻞 ('-') D>  -> (XoX)


	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
			pass
func _physics_process(delta):
	#$Node2D.scale = Vector2(1, 1)
	if Input.is_action_pressed("Right"):
		velocity.x = move_toward(velocity.x, SPEED, 50)
	elif Input.is_action_pressed("Left"):
		velocity.x = move_toward(velocity.x, -SPEED, 50)
	else:
		velocity.x = move_toward(velocity.x, 0, 50)
	
	if is_on_floor():
		if Input.is_action_pressed("Down"):
			scale.y = 0.2
		else: 
			scale.y = 0.4
	else:
		velocity.y +=GRAVITY * delta
		velocity.y =min(MAX_FALL_SPEED, velocity.y)
	if Input.is_action_pressed("Up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	elif Input.is_action_pressed("Down"):
		if velocity.y>0:
			velocity.y = 500
		
		
	move_and_slide()
	if global_position.y>1500:
		global_position.x=100
		global_position.y=450
		velocity.x=0
		velocity.y=0
func attack(target):
	pass
func take_damage(dmg):
	curr_hp-=dmg
	if curr_hp <= 0:
		unalive()
func unalive():
	for x in 16:
		var part = Particle.instantiate()
		part.get_transform().origin = position
		add_child(part)
	$Node2D/Sprite2D.call_deferred("hide")
	
