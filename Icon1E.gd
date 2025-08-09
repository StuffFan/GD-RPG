extends CharacterBody2D
const JUMP_VELOCITY = -450
const MAX_FALL_SPEED =750
var GRAVITY = ProjectSettings.get_setting("physics/2d/default_gravity")
var superfighter
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
	superfighter = get_parent().get_node("Superfighter") 

const SPEED = 150

var direction=1
var updown=0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _jump():
	if is_on_floor():
		
		velocity.y = JUMP_VELOCITY
func _process(delta):
	#if global_position.distance_to(superfighter.global_position)>100:
	if is_on_floor():
		if superfighter.global_position.x>global_position.x:
			velocity.x = move_toward(velocity.x, SPEED, 50)
		else:
			velocity.x = move_toward(velocity.x, -SPEED, 50) 
#else:
	#velocity.x = clamp(velocity.x,-SPEED,SPEED)
	#velocity.y = clamp(velocity.y,-MAX_FALL_SPEED,MAX_FALL_SPEED)
	if superfighter.global_position.y<global_position.y-30:
			_jump()
	move_and_slide()
	
func _physics_process(delta):
	#velocity.x = direction * SPEED
	#velocity.x = move_toward(velocity.x, 0, SPEED)
	if is_on_floor():
		pass
	else:
		velocity.y +=GRAVITY * delta
		velocity.y =min(MAX_FALL_SPEED, velocity.y)
	
	if global_position.y>1500:
		global_position.x=1100
		global_position.y=500
		velocity.x=0
		velocity.y=0
func take_damage(dmg):
	curr_hp-=dmg
