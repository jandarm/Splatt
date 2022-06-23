extends Node

func _ready():
	pass

func _on_Area2D_body_entered(body):
	if body.has_method('self_destruct'):
		body.self_destruct()
		queue_free()
