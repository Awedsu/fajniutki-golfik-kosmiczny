extends StaticBody2D # Zostaw typ, jaki masz

var predkosc_obrotu: float = 0.0
@export var masa: float = 10.0

func _ready() -> void:
	# Losujemy prędkość obrotu od 0.5 do 2.5
	predkosc_obrotu = randf_range(0.5, 2.5)
	
	# Losujemy kierunek (w lewo lub w prawo)
	if randf() > 0.5:
		predkosc_obrotu *= -1.0

func _physics_process(delta: float) -> void:
	# Kręcimy planetą wokół własnej osi
	rotation += predkosc_obrotu * delta
