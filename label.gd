extends Sprite2D

#  parametry początkowe rakiety
var masa: float = 1.0

# wektor prędkości (x, y)

var predkosc: Vector2 = Vector2(200, -300) 

# wektor przyspieszenia
var przyspieszenie: Vector2 = Vector2(0, 0)

func _physics_process(delta: float) -> void:
	
	# aktualizacja prędkości na podstawie przyspieszenia
	#v_nowe=v_stare+a*delta*t
	predkosc += przyspieszenie * delta
	
	# aktualizacja pozycji na podstawie nowej prędkości
	#p_nowe=p_stare+v_nowe * delta*t
	position += predkosc * delta
	
	# zerowanie przyspieszenia po każdej klatce zeby w następnej policzyć je na nowo 
	przyspieszenie = Vector2(0, 0)
