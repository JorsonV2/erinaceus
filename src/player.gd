extends KinematicBody

export var move_speed = 5
export var put_down_distance : float = 1

onready var nav : Navigation

var path = []
var path_id = 0

var picked_up_table = {}

func _ready():
	nav = get_parent().find_node("Navigation")
	Signals.connect("pick_up", self, "pick_up")

func _physics_process(delta):
	move_with_keys(delta)
#	move_with_path(delta)
	
func move_with_keys(delta):
	var x_axis = Input.get_action_strength("down") - Input.get_action_strength("up")
	var z_axis = Input.get_action_strength("left") - Input.get_action_strength("right")
	
	if x_axis < 0 or z_axis > 0:
		$Sprite3D.flip_h = false
	elif x_axis > 0 or z_axis < 0:
		$Sprite3D.flip_h = true
	
	var scale_val = 0.1
	
	var move_point = global_transform.origin + Vector3(x_axis * scale_val, 0, z_axis * scale_val)
	var move_destination = nav.get_closest_point(move_point)
	
	var move_direction = move_destination - global_transform.origin
	
	move_and_slide(move_direction.normalized() * delta * move_speed, Vector3(0, 1, 0), false, 4, PI/4, false)
	
func move_with_path(delta):
	if path_id < path.size():
			var move_direction = path[path_id] - global_transform.origin
			if move_direction.length() < 0.1:
				path_id += 1
			else:
				move_and_slide(move_direction.normalized() * delta * move_speed, Vector3(0, 1, 0), false, 4, PI/4, false)

func move_to(position):
	path = nav.get_simple_path(global_transform.origin, position)
	path_id = 0
	
func pick_up(spatial : pickable):
	if spatial.pickable_name == "rock":
		if picked_up_table.size() > 0:
			print_debug("can't pick up the rock")
			return
	var object = {name = spatial.pickable_name, object = spatial}
	var sprite = spatial.get_node("Sprite3D").duplicate()
	$pick_up_position.add_child(sprite)
	sprite.global_transform.origin = $pick_up_position.global_transform.origin
	picked_up_table[sprite.get_instance_id()] = object
	
	spatial.queue_free()
	pass
	
func put_down():
	pass
