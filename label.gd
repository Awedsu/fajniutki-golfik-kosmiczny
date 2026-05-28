extends Sprite2D

# Nasze parametry początkowe rakiety
var masa: float = 1.0

# Wektor prędkości (x, y). Ustawiamy wartość początkową, 
# żeby rakieta "wystrzeliła" w prawo i w górę (w Godocie oś Y rośnie w dół!)
var predkosc: Vector2 = Vector2(200, -300) 

# Wektor przyspieszenia. Na starcie wynosi zero.
var przyspieszenie: Vector2 = Vector2(0, 0)

# Ta funkcja wykonuje się w każdej pojedynczej klatce fizycznej silnika (np. 60 razy na sekundę)
func _physics_process(delta: float) -> void:
	
	# 1. Aktualizacja prędkości na podstawie przyspieszenia
	#v_nowe=v_stare+a*delta*t
	predkosc += przyspieszenie * delta
	
	# 2. Aktualizacja pozycji na podstawie nowej prędkości
	#p_nowe=p_stare+v_nowe * delta*t
	position += predkosc * delta
	
	# Zerujemy przyspieszenie po każdej klatce, żeby w następnej policzyć je na nowo 
	# (gdy dodamy planety)
	przyspieszenie = Vector2(0, 0)
