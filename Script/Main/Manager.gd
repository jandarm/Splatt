extends Node

export(AudioStreamSample) var music_low
export(AudioStreamSample) var music_med
export(AudioStreamSample) var music_high

#export (PackedScene) var Game_over_scene
#export (PackedScene) var Main_scene
#export (PackedScene) var Settings_scene
#export (PackedScene) var VS_scene
#export (PackedScene) var Coop_scene

var Left_team_color : Color
var Right_team_color : Color

#export(Texture) var Left_team_background
#export(Texture) var Right_team_background

#Type texture
var Left_team_background
var Right_team_background

#win_background.modulate_color is responsible for last winner color 
export (StyleBoxTexture) var win_background

"""
пример ограниченного выбора
export(String, "White", "Yellow", "Orange") var my_color
Или
enum NamedEnum {THING_1, THING_2, ANOTHER_THING = -1}
export (NamedEnum) var x
со вложенностью
export(Array, Array, float) var arr := []
"""

export var Colours = {
	"Red" : Color("#eb4236"),
	"Orange" : Color("#ff8e2b"),
	"Yellow" : Color("#fcba03"),
	"Green" : Color("#8db600"),
	"Blue" : Color("#bbfcf4"), #голубой
	"Indigo" : Color("#425fd4"), #синий
	"Purple" : Color("#890ce8"),
}


func _ready():
	Left_team_color = Colours.Yellow
	Right_team_color = Colours.Purple
	pass

# warning-ignore:unused_argument
func _process(delta):
	if Input.is_action_pressed("Exit_to_menu"):
		SceneChanger.go_to("Main/Main")
