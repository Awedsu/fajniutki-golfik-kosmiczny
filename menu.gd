extends Control

func _ready() -> void:
	# Kiedy menu się załaduje, podpinamy akcje pod kliknięcia (pressed)
	$VBoxContainer/Start.pressed.connect(kliknieto_start)
	$VBoxContainer/Poziomy.pressed.connect(kliknieto_poziomy)
	$VBoxContainer/Wyjdz.pressed.connect(kliknieto_wyjdz)

func kliknieto_start() -> void:
	# Odpalamy Twój główny poziom (zmień nazwę pliku, jeśli zapisałeś go inaczej!)
	get_tree().change_scene_to_file("res://label.tscn")

func kliknieto_poziomy() -> void:
	# Na razie wyświetlamy tylko tekst w konsoli na dole ekranu
	print("Ekran poziomów jest jeszcze w budowie!")

func kliknieto_wyjdz() -> void:
	# Bezpiecznie zamykamy całą grę
	get_tree().quit()
