extends Node

var can_delete = false
var trying_to_delete = false

func _process(delta):
	if $Particles2D.emitting == true:
		can_delete = false
	else:
		can_delete = true
	if trying_to_delete:
		if can_delete:
			queue_free()

func _on_ColorRect_gui_input(event):
	if event.is_action_pressed("LClick"):
		self_destruct()

func self_destruct():
	$ColorRect.visible = false
	$Particles2D.emitting = true
	trying_to_delete = true
