extends Control

func _ready() -> void:
	$Kolumny/Tutoriale/Tutorial1.pressed.connect(odpal_poziom.bind("res://poziomy/tut1.tscn"))
	$Kolumny/Tutoriale/Tutorial2.pressed.connect(odpal_poziom.bind("res://poziomy/tut2.tscn"))
	$Kolumny/Tutoriale/Tutorial3.pressed.connect(odpal_poziom.bind("res://poziomy/tut3.tscn"))
	$Kolumny/Tutoriale/Tutorial4.pressed.connect(odpal_poziom.bind("res://poziomy/tut4.tscn"))
	
	$Kolumny/Poziomy/Poziom1.pressed.connect(odpal_poziom.bind("res://poziomy/poziom_1.tscn"))
	$Kolumny/Poziomy/Poziom2.pressed.connect(odpal_poziom.bind("res://poziomy/poziom_2.tscn"))
	$Kolumny/Poziomy/Poziom3.pressed.connect(odpal_poziom.bind("res://poziomy/poziom_3.tscn"))
	$Kolumny/Poziomy/Poziom4.pressed.connect(odpal_poziom.bind("res://poziomy/poziom_4.tscn"))
	$Kolumny/Poziomy/Poziom5.pressed.connect(odpal_poziom.bind("res://poziomy/poziom_5.tscn"))
	
	$Kolumny/Zjawiska/ManewrVoyagera.pressed.connect(odpal_poziom.bind("res://poziomy/manewr_voyagera.tscn"))
	$Kolumny/Zjawiska/PunktLangrangea.pressed.connect(odpal_poziom.bind("res://poziomy/punkt_lagrange.tscn"))
	
	$Wroc.pressed.connect(wroc_do_menu)

func odpal_poziom(sciezka: String) -> void:
	get_tree().change_scene_to_file(sciezka)

func wroc_do_menu() -> void:
	get_tree().change_scene_to_file("res://sceny/menu.tscn")
