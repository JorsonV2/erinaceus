extends pickable

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Area.transform.origin = $RigidBody.transform.origin
	$Sprite3D.transform.origin = $RigidBody.transform.origin
	$Sprite3D.rotation.z = $RigidBody.rotation.x - $RigidBody.rotation.z
