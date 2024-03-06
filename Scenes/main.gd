extends Node

@export var player_scene : PackedScene

# game variables
var score: int
var game_started: bool = false

# grid variables
var cells: int = 20
var cell_size: int = 50

# snake variables
var old_data: Array
var snake_data: Array
var snake: Array

# movement variables
var start_pos = Vector2(9, 9)
var move_direction : Vector2
var can_move: bool

var Player

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()

#func _input(event):
	#print(event.as_text())

#func _input(event):
   ## Mouse in viewport coordinates.
	#if event is InputEventMouseButton:
		#print("Mouse Click/Unclick at: ", event.position)
	#elif event is InputEventMouseMotion:
		#print("Mouse Motion at: ", event.position)

   # Print the size of the viewport.
	#print("Viewport Resolution is: ", get_viewport().get_visible_rect().size)

func new_game():
	# the SnakeSegments is part of the group segments
	spawn_player()
	#get_tree().call_group("segments", "queue_free")

func spawn_player():
	Player = player_scene.instantiate()
	Player.position = (start_pos * cell_size) + Vector2(0, cell_size)
	add_child(Player)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_player()
	
func move_player():
	if Input.is_action_just_pressed("click"):
		var mouse_position: Vector2 = get_viewport().get_mouse_position()
		print(mouse_position)
		
		var player_x: float = floor(mouse_position.x / cell_size)
		var player_y: float = floor(mouse_position.y / cell_size)
		
		print("Cell x: ", player_x, " y: ", player_y)
		var new_position: Vector2 = Vector2(player_x, player_y) * cell_size 
		Player.position = new_position
		
		


#func check_out_of_bounds():
	#if snake_data[0].x < 0 or snake_data[0].x > cells - 1 or snake_data[0].y < 0 or snake_data[0].y > cells - 1:
		#end_game()
#
