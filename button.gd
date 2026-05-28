extends Button

# Ta funkcja wbudowana w Godota odpala się automatycznie, gdy klikniesz ten przycisk
func _pressed() -> void:
	# Pobieramy główne drzewo gry i każemy mu przeładować obecną scenę od nowa
	get_tree().reload_current_scene()
