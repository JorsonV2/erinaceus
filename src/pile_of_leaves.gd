extends Spatial

var leafes_count = 0
var leafes_collected = 0
var pile_of_leafes_sprites_count = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func count_pile_of_leafes_sprites():
	var dir = Directory.new()
	dir.open("res://gfx/pile_of_leafes")
	dir.list_dir_begin()
	
	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with("."):
			pile_of_leafes_sprites_count += 1
	
	dir.list_dir_end()

func set_pile_sprite():
	var pile = pile_of_leafes_sprites_count * leafes_collected / leafes_count
	$Sprite3D.texture = load("res://gfx/pile_of_leafes/pile_of_leafes_" + String(pile) + ".png")

func _on_Area_body_entered(body):
	$Sprite3D.opacity = 0.5


func _on_Area_body_exited(body):
	$Sprite3D.opacity = 1
