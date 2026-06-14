extends StaticBody2D

var predkosc_obrotu: float = 0.0
@export var masa: float = 10.0

func _ready() -> void:
	# los prędkość obrotu od 0.5 do 2.5
	predkosc_obrotu = randf_range(0.5, 2.5)
	
	# los kierunek (w lewo lub w prawo)
	if randf() > 0.5:
		predkosc_obrotu *= -1.0

func _physics_process(delta: float) -> void:
	# krecenie planetyy ;p
	rotation += predkosc_obrotu * delta
