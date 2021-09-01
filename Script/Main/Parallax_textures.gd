extends Node

export(String, DIR) var BackgroundTextures
onready var rng = RandomNumberGenerator.new()
var PTextures : Array

func _ready():
	var dir = Directory.new()
	if (dir.open(BackgroundTextures) == OK):
		dir.list_dir_begin(true,true)
		var file_name = dir.get_next()
		while (file_name != ""):
			if (dir.current_is_dir()):
				file_name = dir.get_next()
			else:
				if(file_name.get_extension() == "png"):
					#print("Found file: " + file_name)
					PTextures.append(BackgroundTextures + "/" + file_name)
					file_name = dir.get_next()
				else:
					file_name = dir.get_next()
		dir.list_dir_end()
	else:
		print("An error occurred when trying to access the Parallax texture dirrectory path.")
	print(PTextures)
	change_background()
	pass 


func change_background():
	rng.randomize()
	var rnd = rng.randi_range(0, PTextures.size()-1)
	$Sprite.texture = load(PTextures[rnd])
	pass
