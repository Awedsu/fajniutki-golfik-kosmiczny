extends Control

func _ready() -> void:
	# Podpinamy przyciski poziomów i przekazujemy im w locie ścieżkę do sceny 
	$VBoxContainer/Tutorial1.pressed.connect(odpal_poziom.bind("res://poziomy/tut1.tscn"))
	$VBoxContainer/Tutorial2.pressed.connect(odpal_poziom.bind("res://poziomy/tut2.tscn"))
	$VBoxContainer/Tutorial3.pressed.connect(odpal_poziom.bind("res://poziomy/tut3.tscn"))
	$VBoxContainer/Poziom1.pressed.connect(odpal_poziom.bind("res://poziomy/poziom_1.tscn"))
	$VBoxContainer/Poziom2.pressed.connect(odpal_poziom.bind("res://poziomy/poziom_2.tscn"))
	$VBoxContainer/Poziom3.pressed.connect(odpal_poziom.bind("res://poziomy/poziom_3.tscn"))
	$VBoxContainer/ManewrVoyagera.pressed.connect(odpal_poziom.bind("res://poziomy/manewr_voyagera.tscn"))
	$VBoxContainer/PunktLangrangea.pressed.connect(odpal_poziom.bind("res://poziomy/punkt_lagrange.tscn"))
	
	# Przycisk ewakuacji do głównego menu
	$VBoxContainer/Wroc.pressed.connect(wroc_do_menu)

func odpal_poziom(sciezka: String) -> void:
	get_tree().change_scene_to_file(sciezka)

func wroc_do_menu() -> void:
	# Podmień na dokładną nazwę swojej sceny głównego menu, jeśli to nie menu.tscn
	get_tree().change_scene_to_file("res://sceny/menu.tscn")
