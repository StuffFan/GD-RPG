extends Area2D
var numcoins=0
# Called when the node enters the scene tree for the first time.
func _ready():
	var sprite = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.play(sprite[0])
	
	pass # Replace with function body.

signal coin_obtained
@onready var margin_container = $"../icon_4/MarginContainer"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	for body in self.get_overlapping_bodies():
		if body.is_in_group("player"):
			print('get coin')
			margin_container._coincollected()
			print('body entered')
			queue_free()
			coin_obtained.emit()
		
#func _on_body_entered(body):
	
