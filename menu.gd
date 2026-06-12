extends Control

const UFO_IMG = preload("res://media/ufo.png")

func _ready() -> void:
	# Kiedy menu się załaduje, podpinamy akcje pod kliknięcia (pressed)
	$VBoxContainer/Start.pressed.connect(kliknieto_start)
	$VBoxContainer/Poziomy.pressed.connect(kliknieto_poziomy)
	$VBoxContainer/Wyjdz.pressed.connect(kliknieto_wyjdz)

func kliknieto_start() -> void:
	# Odpalamy Twój główny poziom (zmień nazwę pliku, jeśli zapisałeś go inaczej!)
	get_tree().change_scene_to_file("res://poziomy/poziom_1.tscn")

func kliknieto_poziomy() -> void:
	# Na razie wyświetlamy tylko tekst w konsoli na dole ekranu
	print("Ekran poziomów jest jeszcze w budowie!")

func kliknieto_wyjdz() -> void:
	# Bezpiecznie zamykamy całą grę
	get_tree().quit()

func _on_ufo_timer_timeout() -> void:
	if randf() <= 0.067:
		spawn_ufo()

func spawn_ufo() -> void:
	print("UFO is sashaying across the screen!")
	var ufo = Sprite2D.new()
	ufo.texture = UFO_IMG
	ufo.scale = Vector2(0.5,0.5)
	
	ufo.z_index=100
	add_child(ufo)
	
	var screen_size = get_viewport_rect().size
	
	# Losujemy stronę: true = lewa, false = prawa
	var leci_z_lewej = randi() % 2 == 0
	
	# Ustawiamy X w zależności od wylosowanej strony
	var start_x = -200 if leci_z_lewej else screen_size.x + 200
	var end_x = screen_size.x + 200 if leci_z_lewej else -200
	
	# Losujemy wysokość Y totalnie niezależnie dla startu i mety
	var start_y = randf_range(100, screen_size.y - 100)
	var end_y = randf_range(100, screen_size.y - 100)
	
	ufo.global_position = Vector2(start_x, start_y)
	
	# Płynny lot do nowej pozycji
	var tween = create_tween()
	tween.tween_property(ufo, "global_position", Vector2(end_x, end_y), 4.0)
	tween.tween_callback(ufo.queue_free)
