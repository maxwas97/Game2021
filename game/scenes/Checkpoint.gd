extends Spatial

export (int) var cp_num
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Checkpoint_body_entered(body):
	print("entered checkpoint")

	if body.is_in_group("Player"):
		
		if owner.target == self:
			print("Past checkpoint")
			CheckPointManager.get_next_checkpoint()
			CheckPointManager.increase_lap_counter()
