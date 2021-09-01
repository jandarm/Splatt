extends Node

export(String, DIR) var Pictures
var left_team
var right_team

func _ready():
	#Displaying current settings
	$GridContainer/VolumeSlider.value = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master"))
	$GridContainer/MusicSlider.value = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Music"))
	$GridContainer/EffectsSlider.value = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("SF"))
	if(OS.window_fullscreen):
		$FullScreen.pressed = true
	#/Displaying current settings
	
	left_team = get_node("LeftTeamIcons")
	right_team = get_node("RightTeamIcons")
	
	#Reading files from Background dirrectory
	var dir = Directory.new()
	if (dir.open(Pictures) == OK):
		dir.list_dir_begin(true,true)
		var file_name = dir.get_next()
		while (file_name != ""):
			if (dir.current_is_dir()):
				file_name = dir.get_next()
			else:
				#adding icons to a lists
				if(file_name.get_extension() == "png"):
					#print("Found file: " + file_name)
					left_team.add_icon_item(load(Pictures + "/" + file_name))
					right_team.add_icon_item(load(Pictures + "/" + file_name))
					file_name = dir.get_next()
				else:
					file_name = dir.get_next()
		dir.list_dir_end()
	else:
		print("An error occurred when trying to access the Parallax texture dirrectory path.")
	pass

func _on_LeftTeamIcons_item_selected(index):
	Manager.Left_team_background = left_team.get_item_icon(index)
	pass

func _on_RightTeamIcons_item_selected(index):
	Manager.Right_team_background = right_team.get_item_icon(index)
	pass

func _on_FullScreen_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
	pass

func _on_VolumeSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)
	pass

func _on_MusicSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), value)
	pass

func _on_EffectsSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SF"), value)
	pass
