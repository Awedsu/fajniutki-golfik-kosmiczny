extends CharacterBody2D

var masa: float = 1.0
var predkosc: Vector2 = Vector2.ZERO
var przyspieszenie: Vector2 = Vector2.ZERO

var stala_grawitacyjna: float = 7500000.0

var w_locie: bool = false
var zadokowana: bool = false

# --- USTAWIENIA STRZAŁU ---
@export var uzywaj_procy: bool = false # <--- ZAZNACZ TO W INSPEKTORZE DLA STUDNI GRAWITACYJNEJ!
var stala_sily_wystrzalu: float = 500.0 

# --- ZMIENNE PROCY ---
var laduje_energie: bool = false
var aktualna_sila: float = 0.0
var maksymalna_sila: float = 2000.0 
var szybkosc_ladowania: float = 1500.0 

# Pobieramy pasek energii (dodaj węzeł ProgressBar do Rakiety i nazwij go "ProgressBar")
@onready var pasek_energii = $ProgressBar 

func _ready() -> void:
	# Ukrywamy pasek na starcie
	if pasek_energii:
		pasek_energii.max_value = maksymalna_sila
		pasek_energii.value = 0
		pasek_energii.hide()

func _process(delta: float) -> void:
	if w_locie or zadokowana: return
	
	look_at(get_global_mouse_position())
	rotation += deg_to_rad(90)
	
	# Ładowanie paska (działa tylko, gdy tryb procy jest włączony)
	if uzywaj_procy and laduje_energie:
		aktualna_sila += szybkosc_ladowania * delta
		if aktualna_sila > maksymalna_sila:
			aktualna_sila = maksymalna_sila
		
		if pasek_energii:
			pasek_energii.value = aktualna_sila

func _input(event: InputEvent) -> void:
	if w_locie or zadokowana: return
	
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		# --- TRYB 1: Z PROCĄ ---
		if uzywaj_procy:
			if event.pressed:
				# Wciśnięcie: Zaczynamy ładować energię
				laduje_energie = true
				aktualna_sila = 0.0
				if pasek_energii:
					pasek_energii.show()
			else:
				# Puszczenie: Wystrzał z naładowaną siłą
				laduje_energie = false
				predkosc = (get_global_mouse_position() - global_position).normalized() * aktualna_sila
				w_locie = true
				if pasek_energii:
					pasek_energii.hide()
		
		# --- TRYB 2: STANDARDOWY ---
		else:
			if not event.pressed:
				# Zwykłe kliknięcie = natychmiastowy strzał
				predkosc = (get_global_mouse_position() - global_position).normalized() * stala_sily_wystrzalu
				w_locie = true

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and event.keycode == KEY_R:
		get_tree().reload_current_scene()

func _physics_process(delta: float) -> void:
	if not w_locie or zadokowana: return
	
	# KLUCZOWY FIX: Reset przyspieszenia co klatke
	przyspieszenie = Vector2.ZERO
	
	var planety = get_tree().get_nodes_in_group("planety")
	
	for p in planety:
		var wektor_odleglosci = p.global_position - global_position
		var r_kwadrat = max(wektor_odleglosci.length_squared(), 1000.0) 
		var kierunek = wektor_odleglosci.normalized()
		var wartosc_sily = stala_grawitacyjna * (p.masa * masa) / r_kwadrat
		przyspieszenie += (kierunek * wartosc_sily) / masa

	predkosc += przyspieszenie * delta
	
	var kolizja = move_and_collide(predkosc * delta)
	
	if kolizja:
		var w_co_uderzylismy = kolizja.get_collider()
		
		if w_co_uderzylismy and w_co_uderzylismy.is_in_group("planety"):
			print("Rakieta is over party. 💥")
			get_tree().reload_current_scene()
		else:
			predkosc = predkosc.bounce(kolizja.get_normal())
			predkosc *= 0.8
	
	if predkosc != Vector2.ZERO:
		rotation = predkosc.angle() + deg_to_rad(90)
		
