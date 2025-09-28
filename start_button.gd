extends Button
func _on_start_button_pressed():
	get_tree().change_scene("res://main.tscn") # Replace with your actual game scene path



func _on_pressed() -> void:
	get_tree().change_scene_to_file("main.tscn")
	
