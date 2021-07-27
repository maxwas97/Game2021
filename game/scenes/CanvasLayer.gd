extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var kart = owner.get_node("Go_Kart").get_node("Ball")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	$Control/Label.text = str( round(kart.get_linear_velocity().length() * 15))
