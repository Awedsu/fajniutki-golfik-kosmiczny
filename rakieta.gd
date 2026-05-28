extends Sprite2D

var masa: float = 1.0
var predkosc: Vector2 = Vector2(0, 0)
var przyspieszenie: Vector2 = Vector2(0, 0)

# --- Parametry Grawitacji ---
var stala_grawitacyjna: float = 50000000.0 # Pamiętaj o swojej wartości!
var masa_planety: float = 5.0

@export var planeta: Node2D

var w_locie: bool = false
var stala_sily_wystrzalu: float = 1500.0 

func _process(_delta: float) -> void:
	# Jeśli rakieta leci, przestaje śledzić myszkę
	if w_locie:
		return
		
	var pozycja_myszy = get_global_mouse_position()
	
	# Obracamy rakietę w stronę myszy
	look_at(pozycja_myszy)
	rotation += deg_to_rad(90)

func _input(event: InputEvent) -> void:
	if w_locie:
		return
		
	if event is InputEventMouseButton and not event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var pozycja_myszy = get_global_mouse_position()
		var kierunek_wystrzalu = (pozycja_myszy - position).normalized()
		
		predkosc = kierunek_wystrzalu * stala_sily_wystrzalu
		w_locie = true

func _physics_process(delta: float) -> void:
	if not w_locie:
		return
	
	# 1. PRAWO POWSZECHNEGO CIĄŻENIA NEWTONA
	if planeta:
		var wektor_odleglosci = planeta.position - position
		var r_kwadrat = wektor_odleglosci.length_squared()
		
		if r_kwadrat > 10:
			var kierunek = wektor_odleglosci.normalized()
			var wartosc_sily = stala_grawitacyjna * (masa_planety * masa) / r_kwadrat
			var wektor_sily = kierunek * wartosc_sily
			przyspieszenie += wektor_sily / masa

	# 2. CAŁKOWANIE NUMERYCZNE (RUCH)
	predkosc += przyspieszenie * delta
	position += predkosc * delta
	
	przyspieszenie = Vector2(0, 0)
