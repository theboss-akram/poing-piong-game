extends Control

func _on_local_pressed() -> void:
	GameManager.type = GameManager.gamemode.PLAYER
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	

func _on_ai_bot_pressed() -> void:
	GameManager.type = GameManager.gamemode.AI
	get_tree().change_scene_to_file("res://scenes/game.tscn")
