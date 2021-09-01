extends Node2D

export (PackedScene) var Splatter

#for rappid fire
#var mouse_left_down = false

var window_size
var ev

var puddle_left
var puddle_right

var left_bg
var right_bg

var game_stage = 0

var music
var sound

func _ready():
	puddle_left = get_node("PuddleLeft")
	puddle_right = get_node("PuddleRight")
	
	left_bg = get_node("Background/LeftTeamBG")
	right_bg = get_node("Background/RightTeamBG")
	
	left_bg.texture = Manager.Left_team_background
	right_bg.texture = Manager.Right_team_background
	
	puddle_left.water_polygon.set_color(Manager.Left_team_color)
	puddle_right.water_polygon.set_color(Manager.Right_team_color)
	
	puddle_left.position.y = get_viewport().size.y - 20
	puddle_right.position.y = get_viewport().size.y - 20
	
	puddle_left.connect("hit", self, "hit_left")
	puddle_right.connect("hit", self, "hit_right")
	
	music = get_node("MusicPlayer")
	sound = get_node("SFPlayer")
	
	music.set_stream(Manager.music_low)
	music.play()
	pass 

# warning-ignore:unused_argument
func _process(delta):
	maestro_music()
	#rappid fire
#	if mouse_left_down:
#		if(ev.position < window_size/2):
#			var new_splat = Splatter.instance()
#			new_splat.position = get_viewport().get_mouse_position()
#			new_splat.change_tint("yellow")
#			add_child(new_splat)
#		elif(ev.position >= window_size/2):
#			var new_splat = Splatter.instance()
#			new_splat.position = get_viewport().get_mouse_position()
#			new_splat.change_tint("purple")
#			add_child(new_splat)
	if(puddle_left.position.y < 0):
		music.stop()
		Manager.win_background.modulate_color = Manager.Left_team_color
		SceneChanger.go_to("End")
	elif(puddle_right.position.y < 0):
		music.stop()
		Manager.win_background.modulate_color = Manager.Right_team_color
		SceneChanger.go_to("End")
	pass

func hit_left():
	puddle_left.position.y -= 40
	pass

func hit_right():
	puddle_right.position.y -= 40
	pass

func _input(event):
	# size of the viewport.
	window_size = get_viewport_rect().size
	ev = event
   # Mouse in viewport coordinates.
	if(event.is_action_pressed("LClick")):
		#print("Mouse Click: ", event.position)
		if(ev.position < window_size/2):
			var new_splat = Splatter.instance()
			new_splat.position = get_viewport().get_mouse_position()
			new_splat.change_tint(Manager.Left_team_color)
			#new_splat.show_behind_parent = true
			add_child(new_splat)
			sound.play()
			#take care of scaling!!!!!!!!
			#new_splat.get_node("Sprite").scale = Vector2((OS.get_window_size().x / 10) * 0.003, (OS.get_window_size().y / 10) * 0.003)
		elif(ev.position >= window_size/2):
			var new_splat = Splatter.instance()
			new_splat.position = get_viewport().get_mouse_position()
			new_splat.change_tint(Manager.Right_team_color)
			#new_splat.show_behind_parent = true
			add_child(new_splat)
			sound.play()
	
	#for rappid fire
#	if event is InputEventMouseButton:
#		if event.button_index == 1 and event.is_pressed():
#			mouse_left_down = true
#		elif event.button_index == 1 and not event.is_pressed():
#			mouse_left_down = false
	pass


func maestro_music():
	if(puddle_left.position.y < get_viewport().size.y/1.8):
		if(game_stage == 0):
			game_stage += 1
			music.set_stream(Manager.music_med)
			music.play()
	elif(puddle_right.position.y < get_viewport().size.y/1.8):
		if(game_stage == 0):
			game_stage += 1
			music.set_stream(Manager.music_med)
			music.play()
			
	if(puddle_left.position.y < get_viewport().size.y/4):
		if(game_stage == 1):
			game_stage += 1
			music.set_stream(Manager.music_high)
			music.play()
	elif(puddle_right.position.y < get_viewport().size.y/4):
		if(game_stage == 1):
			game_stage += 1
			music.set_stream(Manager.music_high)
			music.play()
	pass
