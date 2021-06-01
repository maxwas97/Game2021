extends Spatial

# Node References
onready var ball = $Ball
onready var car_mesh = $"car-kart-green"
onready var ground_ray = $"car-kart-green/RayCast"

# Where to place the car mesh relative to sphere
var sphere_offset = Vector3(0, -.75, 0)
#engine powerr
var acceleration = -40

#turn amount in degrees
var steering = 21.0
#turn speed
var turn_speed = 5
# below this speed the car doesnt turn
var turn_stop_limit = .75

# variables for input values
var speed_input = 0
var rotate_input = 0

func _ready():
	ground_ray.add_exception(ball)

func _physics_process(delta):
	# keep the car mesh aligned with the sphere
	car_mesh.transform.origin = ball.transform.origin + sphere_offset
	#accelerate based on car's foward direction
	ball.add_central_force(-car_mesh.global_transform.basis.z * speed_input)
	
func _process(delta):
	#cant steer/accelerate when in the air
	if not ground_ray.is_colliding():
		return
	# get accelerate/brake input
	speed_input = 0
	speed_input += Input.get_action_strength("accelerate")
	speed_input -= Input.get_action_strength("brake")
	speed_input *= acceleration
	#get steering input
	rotate_input = 0
	rotate_input += Input.get_action_strength("steer_left")
	rotate_input -= Input.get_action_strength("steer_right")
	rotate_input *= deg2rad(steering)
	#rotate car mesh
	if ball.linear_velocity.length() > turn_stop_limit:
		var new_basis = car_mesh.global_transform.basis.rotated(car_mesh.global_transform.basis.y,
		rotate_input)
		car_mesh.global_transform.basis = car_mesh.global_transform.basis.slerp(new_basis, turn_speed * delta)
		car_mesh.global_transform = car_mesh.global_transform.orthonormalized()

#align with ground
	var n = ground_ray.get_collision_normal()
	var xform = align_with_y(car_mesh.global_transform, n.normalized())


func align_with_y(xform, new_y):
		xform.basis.y = new_y
		xform.basis.x = xform.basis.z.cross(new_y)
		xform.basis = xform.basis.orthonormalized()
		return xform






# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
