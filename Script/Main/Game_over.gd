extends Node

var win_button
var winner

func _ready():
	win_button = get_node("Button")
	winner = Manager.win_background.modulate_color
	#win_button.get_stylebox("Hover", "" ).modulate_color = Color.azure
	#win_button.modulate = Manager.Winner_color
	match(winner):
		Manager.Colours.Red : win_button.text = "Красные победили!"
		Manager.Colours.Orange : win_button.text = "Оранжевые победили!"
		Manager.Colours.Yellow : win_button.text = "Жёлтые победили!"
		Manager.Colours.Green : win_button.text = "Зелёные победили!"
		Manager.Colours.Blue : win_button.text = "Голубые победили!"
		Manager.Colours.Indigo : win_button.text = "Синие победили!"
		Manager.Colours.Purple : win_button.text = "Фиолетовые победили!"
		_: win_button.text = "Победила дружба!"
	pass

func _on_Button_pressed():
	SceneChanger.go_to("Main/Main")
	pass
