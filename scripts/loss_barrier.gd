extends Area2D

enum enu {RIGHT, LEFT}

@onready var game = $".."
@export var dir : enu

func _on_body_entered(body: Node2D) -> void:
	if body.name == "ball":
		match dir:
			enu.RIGHT:
				game.add_point_p2()
			enu.LEFT:
				game.add_point_p1()
	
