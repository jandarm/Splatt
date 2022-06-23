extends Node

export (PackedScene) var Particle
export (PackedScene) var PlayerProjectile
var initial_position = Vector2(0, 0)

func _ready():
	for particle in 2066:
		var new_splat = Particle.instance()
		new_splat.position = initial_position
		add_child(new_splat)
		move_initial_position()

# warning-ignore:unused_argument
func _process(delta):
#	if Input.is_mouse_button_pressed(1):
#		var new_splat = Particle.instance()
#		new_splat.position = get_viewport().get_mouse_position()
#		#new_splat.show_behind_parent = true
#		add_child(new_splat)
	pass

func _input(event):
   # Mouse in viewport coordinates.
	if(event.is_action_pressed("LClick")):
		var hole = PlayerProjectile.instance()
		hole.position = get_viewport().get_mouse_position()
		add_child(hole)

func move_initial_position():
	if initial_position.x >= get_viewport().size.x:
		initial_position.y += 20
		initial_position.x = 0
	else:
		initial_position.x += 20
