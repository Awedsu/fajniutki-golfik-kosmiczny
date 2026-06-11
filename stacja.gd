extends Sprite2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	# Sprawdzamy czy ciało, które w nas uderzyło, to faktycznie rakieta
	if body.name == "Rakieta":
		print("Zadokowano")
		body.w_locie = false
		body.zadokowana = true 
		body.predkosc = Vector2.ZERO
		body.global_position = global_position
