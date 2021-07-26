extends RigidBody2D

onready var motion = self.applied_force

func _ready():
	self.scale = Vector2((OS.get_window_size().x / 10) * 0.001, (OS.get_window_size().y / 10) * 0.001)
	pass

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	pass

func change_tint(color):
	#for rappid fire
#	randomize()
#	get_node("Sprite").material.set("shader_param/silhouette_color", Color(randf(), randf(), randf(), 1))
	match color:
		"yellow": get_node("Sprite").material.set("shader_param/silhouette_color", Color("#fcba03"))
		"purple": get_node("Sprite").material.set("shader_param/silhouette_color", Color("#890ce8"))
		_: get_node("Sprite").material.set("shader_param/silhouette_color", Color(0, 0, 0, 1))
	pass
