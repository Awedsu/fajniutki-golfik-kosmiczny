@tool
extends StaticBody2D

func _ready() -> void:
	_ogarnij_kolizje()

func _process(_delta: float) -> void:
	if Engine.is_editor_hint():
		_ogarnij_kolizje()

func _ogarnij_kolizje() -> void:
	var rect = $ColorRect
	var kolizja = $CollisionShape2D
	
	if rect and kolizja and kolizja.shape is RectangleShape2D:
		# Mnożymy przez scale, na wypadek gdybyś jednak bawił się narzędziem skalowania
		kolizja.shape.size = rect.size * rect.scale
		kolizja.position = rect.position + (kolizja.shape.size / 2.0)
