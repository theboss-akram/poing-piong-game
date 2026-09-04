extends Control


func _on_local_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")



func _on_ai_bot_pressed() -> void:
	$HBoxContainer/AI_Bot.text = "nope"
	await get_tree().create_timer(1).timeout
	get_tree().quit()
