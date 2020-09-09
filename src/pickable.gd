extends Spatial

class_name pickable

var pickable_name = "name"

var player_in_range = false
var picked_up = false

# Called when the node enters the scene tree for the first time.
func _ready():
	find_node("Area").add_to_group("pickable")
	$Area.connect("body_entered", self, "body_entered")
	$Area.connect("body_exited", self, "body_exited")
	
func pick_up():
	Signals.emit_signal("pick_up", self)
	pass
	
func _process(delta):
	if player_in_range and not picked_up and Input.is_action_just_pressed("pick_up"):
		pick_up()
	
func body_entered(body):
	player_in_range = true
	
func body_exited(body):
	player_in_range = false
	

