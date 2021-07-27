extends Node

var checkpoint = []
var passed_checkpoints = []
var target = null
var current_lap = 0
var max_laps = 3

func get_next_checkpoint():
	var cp = checkpoint[0]
	passed_checkpoints.append(checkpoint.pop_front())
	print(len(checkpoint))
	if len(checkpoint) == 0:
		checkpoint = passed_checkpoints
		passed_checkpoints = []
		#increase_lap_counter()
	return cp
	
	
func get_all_checkpoints():
	checkpoint = get_tree().get_nodes_in_group("CheckPoint")
	print("Getting nodes")
	
	
func increase_lap_counter():
	current_lap += 1
	print("Lap :" ,current_lap ,"of" , max_laps) 
	#if lapp counter > max laps, 
	# end round and proceed to end scene or next level etc
func end_race():
	if current_lap > max_laps:
		print("game over")
	else:
		pass
	
	 
	
	
	
	
func _ready():
	pass

func _process(delta):
	pass


	
