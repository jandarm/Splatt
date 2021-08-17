extends Node


func _ready():
	get_node("Button").theme.get_stylebox("Hover", "" ).modulate_color = Color("#25afa9")
	pass 


func _on_Button_pressed():
	get_tree().quit()
	pass
