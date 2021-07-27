extends Spatial

var target = null


# Called when the node enters the scene tree for the first time.
func _ready():
	CheckPointManager.get_all_checkpoints()
	target = CheckPointManager.get_next_checkpoint()

