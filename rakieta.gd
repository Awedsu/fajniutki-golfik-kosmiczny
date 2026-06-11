extends CharacterBody2D

var masa: float = 1.0
var predkosc: Vector2 = Vector2.ZERO
var przyspieszenie: Vector2 = Vector2.ZERO

var stala_grawitacyjna: float = 7500000.0

var w_locie: bool = false
var zadokowana: bool = false
var stala_sily_wystrzalu: float = 1000.0 

func _process(_delta: float) -> void:
	if w_locie or zadokowana: return
	look_at(get_global_mouse_position())
	rotation += deg_to_rad(90)

func _input(event: InputEvent) -> void:
	if w_locie or zadokowana: return
	
	if event is InputEventMouseButton and not event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		predkosc = (get_global_mouse_position() - global_position).normalized() * stala_sily_wystrzalu
		w_locie = true

func _physics_process(delta: float) -> void:
	if not w_locie or zadokowana: return
	
# Pobieramy wszystkie planety na mapie z naszej grupy
	var planety = get_tree().get_nodes_in_group("planety")
	
	# Liczymy grawitację dla KAŻDEJ planety z osobna i dodajemy do siebie
	for p in planety:
		var wektor_odleglosci = p.global_position - global_position
		var r_kwadrat = max(wektor_odleglosci.length_squared(), 1000.0) 
		var kierunek = wektor_odleglosci.normalized()
		var wartosc_sily = stala_grawitacyjna * (p.masa * masa) / r_kwadrat
		przyspieszenie += (kierunek * wartosc_sily) / masa

	predkosc += przyspieszenie * delta
	
# Ruch z fizycznym sprawdzaniem kolizji
	var kolizja = move_and_collide(predkosc * delta)
	
	if kolizja:
		var w_co_uderzylismy = kolizja.get_collider()
		
		# Sprawdzamy, czy przeszkoda należy do grupy "planety"
		if w_co_uderzylismy and w_co_uderzylismy.is_in_group("planety"):
			print("Rakieta is over party. 💥")
			# Rakieta wybuchła, więc robimy instant restart poziomu
			get_tree().reload_current_scene()
		else:
			# Jeśli to zwykła bariera, odbijamy się jak wcześniej
			predkosc = predkosc.bounce(kolizja.get_normal())
			predkosc *= 0.8
	
	# Obrót w kierunku ruchu
	if predkosc != Vector2.ZERO:
		rotation = predkosc.angle() + deg_to_rad(90)
