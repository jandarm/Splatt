extends Node

var tree
onready var animation = get_node("Control/AnimationPlayer")
var scene

func _ready():
	tree = get_tree()
	pass


func connector(destination: String):
	scene = destination
	animation.play("Transition")
	pass

func go_to():
	match scene:
		"VS": tree.change_scene_to(Manager.VS_scene)
		"Coop": tree.change_scene_to(Manager.Coop_scene)
		"Settings": tree.change_scene_to(Manager.Settings_scene)
		"End": tree.change_scene_to(Manager.Game_over_scene)
		
		_: tree.change_scene_to(Manager.Main_scene)
	pass
