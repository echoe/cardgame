extends Node2D

const CARD_SCENE_PATH = "res://Scenes/card.tscn"
const CARD_DRAW_SPEED = 1

var player_deck = ["Knight", "Archer", "Demon", "Knight"]
var card_database_reference


func _ready() -> void:
	$RichTextLabel.text = str(player_deck.size())
	# print($Area2D.collision_mask)
	card_database_reference = preload("res://Scripts/card_database.gd")


func draw_card():
	player_deck.shuffle()
	var card_drawn_name = player_deck[0]
	player_deck.erase(card_drawn_name)
	
	#if the deck is out of cards, make it disappear
	if player_deck.size() == 0:
		$Area2D/CollisionShape2D.disabled = true
		$Sprite2D.visible = false
		$RichTextLabel.visible = false
	
	$RichTextLabel.text = str(player_deck.size())
	var card_scene = preload(CARD_SCENE_PATH)
	var new_card = card_scene.instantiate()
	var card_image_path = str("res://Images/" + card_drawn_name + "Card.png")
	new_card.get_node("CardImage").texture = load(card_image_path)
	new_card.get_node("Attack").text = str(card_database_reference.CARDS[card_drawn_name][0])
	new_card.get_node("Health").text = str(card_database_reference.CARDS[card_drawn_name][1])
	#you have to also make it a child of cardmanager for it to work as a card
	$"../CardManager".add_child(new_card)
	new_card.name = "Card"
	$"../PlayerHand".add_card_to_hand(new_card, CARD_DRAW_SPEED)
	new_card.get_node("AnimationPlayer").play("card_flip")
