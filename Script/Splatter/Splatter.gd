extends RigidBody2D

onready var motion = self.applied_force

func _ready():
	pass

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	pass

func change_tint(given_color):
	get_node("Sprite").material.set("shader_param/silhouette_color", given_color)
	#for rappid fire
#	randomize()
#	get_node("Sprite").material.set("shader_param/silhouette_color", Color(randf(), randf(), randf(), 1))
	pass
