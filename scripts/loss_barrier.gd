extends Area2D

@onready var game = $".."
@export var dir : int

func _on_body_entered(body: Node2D) -> void:
	if body.name == "ball":
		if dir == 1:
			game.add_point_p2()
		elif dir == 2:
			game.add_point_p1()
		
	
