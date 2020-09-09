extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	for sprite in get_tree().get_nodes_in_group("sprite"):
		sprite.rotation_degrees = Vector3(-45, 45, 0)
#		sprite.look_at($Camera.global_transform.origin, Vector3.UP)
		pass
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass
