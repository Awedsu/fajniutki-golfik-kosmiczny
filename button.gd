extends Button

# Ta funkcja odpala się, gdy klikniesz przycisk myszką
func _pressed() -> void:
	resetuj_lot()

# Ta funkcja słucha klawiatury w tle w dowolnym momencie gry
func _unhandled_input(event: InputEvent) -> void:
	# Sprawdzamy, czy event to wciśnięcie klawisza (event.pressed) 
	# oraz czy tym klawiszem jest dokładnie SPACJA (KEY_SPACE)
	if event is InputEventKey and event.pressed and event.keycode == KEY_SPACE:
		resetuj_lot()

# Wydzieliliśmy reset do osobnej funkcji, żeby nie dublować kodu
func resetuj_lot() -> void:
	get_tree().reload_current_scene()
