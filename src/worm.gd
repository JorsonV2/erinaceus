extends Spatial

# Called when the node enters the scene tree for the first time.
func _ready():
	$animation.play("float")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func pick_up():
	$animation.play("collect")
	yield($animation, "animation_finished")
	queue_free()

func _on_Area_body_entered(body):
	if body.is_in_group("player"):
		pick_up()
