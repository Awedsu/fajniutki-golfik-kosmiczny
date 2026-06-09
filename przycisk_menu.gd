extends Button

# Ta funkcja odpala się automatycznie po kliknięciu przycisku
func _pressed() -> void:
	# Nakazujemy silnikowi płynną zmianę obecnej sceny na plik z menu
	# (Upewnij się, że nazwa pliku to dokładnie menu.tscn)
	get_tree().change_scene_to_file("res://menu.tscn")
