extends Node

export var music_low = preload("res://Sound/IG2 Low.wav")
export var music_med = preload("res://Sound/IG2 Med.wav")
export var music_high = preload("res://Sound/IG2 HIGh.wav")

var Color_left_team : Color
var Color_right_team : Color


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
	print(settt(Colours.Blue))
	
	Color_left_team = Colours.Orange
	Color_right_team = Colours.Blue
	pass

func settt(e : Color):
	return e
