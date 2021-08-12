extends Node2D

export (PackedScene) var Splatter

#for rappid fire
#var mouse_left_down = false

var window_size
var ev

var puddle_piss
var puddle_cum

var game_stage = 0

var music
var sound

func _ready():
	puddle_piss = get_node("Piss")
	puddle_cum = get_node("Cum")
	
	puddle_piss.water_polygon.set_color(Manager.Color_left_team)
	puddle_cum.water_polygon.set_color(Manager.Color_right_team)
	
	puddle_piss.position.y = get_viewport().size.y - 20
	puddle_cum.position.y = get_viewport().size.y - 20
	
	puddle_piss.connect("hit", self, "hit_piss")
	puddle_cum.connect("hit", self, "hit_cum")
	
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
	if(puddle_piss.position.y < 0):
		get_tree().quit()
	elif(puddle_cum.position.y < 0):
		get_tree().quit()
	pass

func hit_piss():
	puddle_piss.position.y -= 40
	pass

func hit_cum():
	puddle_cum.position.y -= 40	
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
			new_splat.change_tint(Manager.Color_left_team)
			add_child(new_splat)
			sound.play()
			#take care of scaling!!!!!!!!
			#new_splat.get_node("Sprite").scale = Vector2((OS.get_window_size().x / 10) * 0.003, (OS.get_window_size().y / 10) * 0.003)
		elif(ev.position >= window_size/2):
			var new_splat = Splatter.instance()
			new_splat.position = get_viewport().get_mouse_position()
			new_splat.change_tint(Manager.Color_right_team)
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
	if(puddle_piss.position.y < get_viewport().size.y/1.8):
		if(game_stage == 0):
			game_stage += 1
			music.set_stream(Manager.music_med)
			music.play()
	elif(puddle_cum.position.y < get_viewport().size.y/1.8):
		if(game_stage == 0):
			game_stage += 1
			music.set_stream(Manager.music_med)
			music.play()
			
	if(puddle_piss.position.y < get_viewport().size.y/4):
		if(game_stage == 1):
			game_stage += 1
			music.set_stream(Manager.music_high)
			music.play()
	elif(puddle_cum.position.y < get_viewport().size.y/4):
		if(game_stage == 1):
			game_stage += 1
			music.set_stream(Manager.music_high)
			music.play()
	pass
