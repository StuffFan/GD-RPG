extends MarginContainer
var numcoins = 0
@onready var label = $Label


func _coincollected():
	numcoins+=1
	label.text = "Coins: " +str(numcoins)  
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
