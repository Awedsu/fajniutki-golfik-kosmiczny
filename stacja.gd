extends Node2D 

@export var nastepny_poziom: PackedScene
var rakiety_w_grze: int = 0

func _ready() -> void:
	rakiety_w_grze = get_tree().get_nodes_in_group("rakiety").size()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("rakiety") and body.w_locie == true:
		print("Rakieta zadokowana, we love a safe landing.")
		body.w_locie = false
		body.zadokowana = true 
		body.predkosc = Vector2.ZERO
		body.global_position = global_position
		
		rakiety_w_grze -= 1
		
		if rakiety_w_grze <= 0:
			_odpal_sekwencje_wygranej()

func _odpal_sekwencje_wygranej() -> void:
	print("Cała flota w bazie, udało się, udało!")
	
	if has_node("Confetti"):
		$Confetti.global_rotation = 0.0
		$Confetti.emitting = true
		
	if has_node("CanvasLayer/Ramka"):
		$"CanvasLayer/Ramka".show()
