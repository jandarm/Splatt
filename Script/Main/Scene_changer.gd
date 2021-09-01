extends Node

onready var animation = get_node("Control/AnimationPlayer")
onready var ink = get_node("Control/Ink/Body")
var scene
var tree

func _ready():
	tree = get_tree()
	pass


func go_to(destination: String):
	scene = destination
	ink.modulate = Manager.win_background.modulate_color
	animation.play("Transition")
	pass

func connector():
	if(scene == "Exit"):
		get_tree().quit()
	tree.change_scene("res://Scenes/" + scene +".tscn")
#	match scene:
#		"VS": tree.change_scene_to(Manager.VS_scene)
#		"Coop": tree.change_scene_to(Manager.Coop_scene)
#		"Settings": tree.change_scene_to(Manager.Settings_scene)
#		"End": tree.change_scene_to(Manager.Game_over_scene)
#		"Exit": get_tree().quit()
#		_: tree.change_scene_to(Manager.Main_scene)
	Parallax.change_background()
	pass
