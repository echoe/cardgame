extends Node2D

const CARD_SCENE_PATH = "res://Scenes/card.tscn"
const CARD_DRAW_SPEED = 1

var player_deck = ["Knight", "Knight", "Knight"]

func _ready() -> void:
	$RichTextLabel.text = str(player_deck.size())
	# print($Area2D.collision_mask)

func draw_card():
	var card_drawn = player_deck[0]
	player_deck.erase(card_drawn)
	
	#if the deck is out of cards, make it disappear
	if player_deck.size() == 0:
		$Area2D/CollisionShape2D.disabled = true
		$Sprite2D.visible = false
		$RichTextLabel.visible = false
	
	$RichTextLabel.text = str(player_deck.size())
	var card_scene = preload(CARD_SCENE_PATH)
	var new_card = card_scene.instantiate()
	#you have to also make it a child of cardmanager for it to work as a card
	$"../CardManager".add_child(new_card)
	new_card.name = "Card"
	$"../PlayerHand".add_card_to_hand(new_card, CARD_DRAW_SPEED)
