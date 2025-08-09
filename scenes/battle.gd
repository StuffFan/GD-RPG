extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var player = find_child("Superfighter")
	var enemy = find_children("Icon?E")
	print (player.name)
	print (enemy)
	var player_turn = true
	pass # Replace with function body.
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
