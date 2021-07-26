extends Node2D

export (PackedScene) var Splatter

var mouse_left_down = false
var window_size
var ev

func _ready():
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
