extends Node2D 

@export var nastepny_poziom: PackedScene

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Rakieta":
		print("Zadokowano, the end of an era.")
		body.w_locie = false
		body.zadokowana = true 
		body.predkosc = Vector2.ZERO
		body.global_position = global_position
		
		# Odpalamy confetti
		if has_node("Confetti"):
			$Confetti.emitting = true
			
	# Pokazujemy cala ramke z tekstem
		if has_node("CanvasLayer/Ramka"):
			$"CanvasLayer/Ramka".show()
			
		# Zatrzymujemy kod na 2 sekundy, zeby podziwiac ten show
		await get_tree().create_timer(2.0).timeout
		
		# Dopiero po czasie zmieniamy poziom
		if nastepny_poziom:
			get_tree().change_scene_to_packed(nastepny_poziom)
