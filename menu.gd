extends Control

const UFO_IMG = preload("res://media/ufo.png")
const RAKIETA_IMG = preload("res://media/rakieta.png")

func _ready() -> void:
	$VBoxContainer/Tutorial.pressed.connect(kliknieto_tutorial)
	$VBoxContainer/Poziomy.pressed.connect(kliknieto_poziomy)
	$VBoxContainer/Zjawiska.pressed.connect(kliknieto_zjawiska)
	$VBoxContainer/ListaPoziomow.pressed.connect(kliknieto_lista)
	$VBoxContainer/Wyjdz.pressed.connect(kliknieto_wyjdz)

func kliknieto_tutorial() -> void:
	get_tree().change_scene_to_file("res://poziomy/tut1.tscn")

func kliknieto_poziomy() -> void:
	get_tree().change_scene_to_file("res://poziomy/poziom_1.tscn")

func kliknieto_zjawiska() -> void:
	get_tree().change_scene_to_file("res://poziomy/manewr_voyagera.tscn")
	
func kliknieto_lista() -> void:
	get_tree().change_scene_to_file("res://sceny/menu_poziomow.tscn")

func kliknieto_wyjdz() -> void:
	get_tree().quit()

func _on_ufo_timer_timeout() -> void:
	if randf() <= 0.067:
		spawn_flying_object()

func spawn_flying_object() -> void:
	var flyingObj = Sprite2D.new()
	if randf() <= 0.2:
		flyingObj.texture = UFO_IMG
	else:
		flyingObj.texture = RAKIETA_IMG
	flyingObj.scale = Vector2(0.5,0.5)
	
	flyingObj.z_index=100
	add_child(flyingObj)
	
	var screen_size = get_viewport_rect().size
	
	var leci_z_lewej = randi() % 2 == 0
	
	# X w zależności od wylosowanej strony
	var start_x = -200 if leci_z_lewej else screen_size.x + 200
	var end_x = screen_size.x + 200 if leci_z_lewej else -200
	
	# Y niezależnie dla startu i mety
	var start_y = randf_range(100, screen_size.y - 100)
	var end_y = randf_range(100, screen_size.y - 100)
	
	if flyingObj.texture == RAKIETA_IMG:
		var start_pos = Vector2(start_x, start_y)
		var end_pos = Vector2(end_x, end_y)
		var wektor_kierunku = end_pos - start_pos
		flyingObj.rotation = wektor_kierunku.angle() + deg_to_rad(90)
	
	flyingObj.global_position = Vector2(start_x, start_y)
	

	var tween = create_tween()
	tween.tween_property(flyingObj, "global_position", Vector2(end_x, end_y), 4.0)
	tween.tween_callback(flyingObj.queue_free)
