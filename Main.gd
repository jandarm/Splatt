extends Node2D

export (PackedScene) var Splatter

var mouse_left_down = false
var window_size
var ev

var puddle_piss
var puddle_cum

func _ready():
	puddle_piss = get_node("Piss")
	puddle_cum = get_node("Cum")
	
	puddle_piss.position.y = get_viewport().size.y - 20
	puddle_cum.position.y = get_viewport().size.y - 20
	
	puddle_piss.connect("hit", self, "hit_piss")
	puddle_cum.connect("hit", self, "hit_cum")
	pass 

# warning-ignore:unused_argument
func _process(delta):
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
			new_splat.change_tint("yellow")
			add_child(new_splat)
			#take care of scaling!!!!!!!!
			#new_splat.get_node("Sprite").scale = Vector2((OS.get_window_size().x / 10) * 0.003, (OS.get_window_size().y / 10) * 0.003)
		elif(ev.position >= window_size/2):
			var new_splat = Splatter.instance()
			new_splat.position = get_viewport().get_mouse_position()
			new_splat.change_tint("purple")
			add_child(new_splat)
	
	#for rappid fire
#	if event is InputEventMouseButton:
#		if event.button_index == 1 and event.is_pressed():
#			mouse_left_down = true
#		elif event.button_index == 1 and not event.is_pressed():
#			mouse_left_down = false
	pass
