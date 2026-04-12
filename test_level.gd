extends Node3D

var lista_zrzutów : Array
var current_zrzut = 0


func _ready() -> void:
	for child in get_children():
		if "Zrzut" in child.name:
			lista_zrzutów.append(child)
	lista_zrzutów[0].zrzut()
	
	
		

func lose():
	var lose_screen = load("res://lose_pop_up.tscn")
	var lose_inst = lose_screen.instantiate()
	add_child(lose_inst)
	get_tree().paused = true

func _process(_delta: float) -> void:
	if len(lista_zrzutów) == 0:
		print('win')
	elif lista_zrzutów[0].to_deliver == 0:
		print(lista_zrzutów)
		lista_zrzutów.pop_front()
		if len(lista_zrzutów) == 0:
			print('win')
			get_tree().quit()
		else:
			lista_zrzutów[0].zrzut()
	
