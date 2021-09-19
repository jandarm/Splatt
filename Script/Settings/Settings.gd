extends Node

export(String, DIR) var Pictures
#var new_path = Directory.new().get_current_dir() + "Assets/Background"


var right_team_dropbox
var right_team_style = StyleBoxFlat.new()
var right_team_bg
var right_team_bg_icon
var right_team_call_btn

var left_team_dropbox
var left_team_style = StyleBoxFlat.new()
var left_team_bg
var left_team_bg_icon
var left_team_call_btn

func _ready():
	#Displaying current settings
	right_team_style.set_bg_color(Manager.Right_team_color)
	left_team_style.set_bg_color(Manager.Left_team_color)
	$GridContainer/VolumeSlider.value = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master"))
	$GridContainer/MusicSlider.value = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Music"))
	$GridContainer/EffectsSlider.value = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("SF"))
	if(OS.window_fullscreen):
		$FullScreen.pressed = true
	if(Manager.Right_team_background != null):
		$RightTeamBtnBg/RightTeamIcon.texture = Manager.Right_team_background
	$RightTeamBtnBg.set('custom_styles/normal', right_team_style)
	$RightTeamList.set('custom_styles/normal', right_team_style)
	if(Manager.Left_team_background != null):
		$LeftTeamBtnBg/LeftTeamIcon.texture = Manager.Left_team_background
	$LeftTeamBtnBg.set('custom_styles/normal', left_team_style)
	$LeftTeamList.set('custom_styles/normal', left_team_style)
	
	#Initializing objects
	right_team_dropbox = get_node("RightTeamList")
	right_team_bg = get_node("RightTeamChoose")
	right_team_bg_icon = get_node("RightTeamBtnBg/RightTeamIcon")
	right_team_call_btn = get_node("RightTeamBtnBg")
	
	left_team_dropbox = get_node("LeftTeamList")
	left_team_bg = get_node("LeftTeamChoose")
	left_team_bg_icon = get_node("LeftTeamBtnBg/LeftTeamIcon")
	left_team_call_btn = get_node("LeftTeamBtnBg")


	#Filling team colors icons in drop box
	for i in Manager.Colours:
		var preview = GradientTexture.new()
		preview.width = 150
		var gr = Gradient.new()
		#gr.remove_point(1)
		gr.set_color(0, Manager.Colours.get(i))
		preview.gradient = gr
		right_team_dropbox.get_popup().add_icon_item(preview, i)
		left_team_dropbox.get_popup().add_icon_item(preview, i)
	
	#Reading files from Background dirrectory and loading them to a ItemList
	#Outdated, but i want to keep it
	"""
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
	"""
	pass


func _on_RightTeamList_item_selected(index):
	var color = Manager.Colours.get(right_team_dropbox.get_item_text(index))
	Manager.Right_team_color = color
	
	#Changing displayed color for OptionButton
	right_team_style.set_bg_color(color)
	right_team_dropbox.set('custom_styles/normal', right_team_style)
	#Changing displayed color for background button
	right_team_call_btn.set('custom_styles/normal', right_team_style)
	pass

func _on_RightTeamBtnBg_pressed():
	right_team_bg.popup()
	pass

func _on_RightTeamChoose_file_selected(path):
	#Loading an image and converting to texture
	var image = Image.new()
	image.load(path)
	var texture = ImageTexture.new()
	texture.create_from_image(image, 0)
	
	Manager.Right_team_background = texture
	right_team_bg_icon.texture = texture
	pass


func _on_LeftTeamList_item_selected(index):
	var color = Manager.Colours.get(left_team_dropbox.get_item_text(index))
	Manager.Left_team_color = color
	
	#Changing displayed color for OptionButton
	left_team_style.set_bg_color(color)
	left_team_dropbox.set('custom_styles/normal', left_team_style)
	#Changing displayed color for background button
	left_team_call_btn.set('custom_styles/normal', left_team_style)
	pass

func _on_LeftTeamBtnBg_pressed():
	left_team_bg.popup()
	pass

func _on_LeftTeamChoose_file_selected(path):
	#Loading an image and converting to texture
	var image = Image.new()
	image.load(path)
	var texture = ImageTexture.new()
	texture.create_from_image(image, 0)
	
	Manager.Left_team_background = texture
	left_team_bg_icon.texture = texture
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
