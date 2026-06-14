extends Button

# ta funkcja odpala się, gdy klikniesz przycisk myszką
func _pressed() -> void:
	resetuj_lot()

# ta funkcja przyciski z klawiatury odczytuje
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and event.keycode == KEY_SPACE:
		resetuj_lot()

# reset
func resetuj_lot() -> void:
	get_tree().reload_current_scene()
