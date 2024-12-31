extends TextureButton
@onready var Ability = $"../Label".text


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Global.temp_abilities.has("Analyzed Weakness") == true:
		%"Analyzed Weakness".disabled = false
		%"Analyzed Weakness".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Barrage") == true:
		%Barrage.disabled = false
		%Barrage.set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Beast Bond") == true:
		%Beast.disabled = false
		%Beast.set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Berserker") == true:
		%Berserker.disabled = false
		%Berserker.set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Bulwark") == true:
		%Bulwark.disabled = false
		%Bulwark.set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Command") == true:
		%command.disabled = false
		%command.set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Compelled Duel") == true:
		%compell.disabled = false
		%compell.set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Constructive Criticism") == true:
		%cosnturct.disabled = false
		%cosnturct.set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Cripple") == true:
		%cripple.disabled = false
		%cripple.set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Echo") == true:
		%echo.disabled = false
		%echo.set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Elemental Pulse") == true:
		%elepulse.disabled = false
		%elepulse.set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Elemental Weapon") == true:
		%eleweap.disabled = false
		%eleweap.set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Encourage") == true:
		%encour.disabled = false
		%encour.set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Evade") == true:
		%evade.disabled = false
		%evade.set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Execute") == true:
		%execut.disabled = false
		%execut.set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Fearful Presence") == true:
		%fearful.disabled = false
		%fearful.set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Flinch") == true:
		%flinch.disabled = false
		%flinch.set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Incognito") == true:
		%incognitro.disabled = false
		%incognitro.set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Invigorating Strike") == true:
		%invig.disabled = false
		%invig.set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Leap") == true:
		%leap.disabled = false
		%leap.set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Lethal Dilution") == true:
		%lethjal.disabled = false
		%lethjal.set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Magnetic Pull") == true:
		%magnetic.disabled = false
		%magnetic.set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Mighty Strike") == true:
		%mighty.disabled = false
		%mighty.set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Overpower") == true:
		%overpwoe.disabled = false
		%overpwoe.set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Owl Stance") == true:
		%owl.disabled = false
		%owl.set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Phantasmal Throw") == true:
		%phant.disabled = false
		%phant.set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Quick Reflex") == true:
		%quick.disabled = false
		%quick.set_pressed_no_signal(true)
	else:
		pass
	if Global.bioform == "Petroan":
		%rage.disabled = true
	if Global.temp_abilities.has("Rage") == true:
		%rage.disabled = false
		%rage.set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Rally") == true:
		%rally.disabled = false
		%rally.set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Regenerate") == true:
		%regen.disabled = false
		%regen.set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Rapid Response") == true:
		%rapid.disabled = false
		%rapid.set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Rend") == true:
		%rend.disabled = false
		%rend.set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Repelling Strike") == true:
		%repel.disabled = false
		%repel.set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Ricochet") == true:
		%rico.disabled = false
		%rico.set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Stunning Strike") == true:
		%stun.disabled = false
		%stun.set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Tank") == true:
		%tank.disabled = false
		%tank.set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Taunt") == true:
		%taunt.disabled = false
		%taunt.set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Turtle Stance") == true:
		%turtl.disabled = false
		%turtl.set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Undercover") == true:
		%under.disabled = false
		%under.set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Viper Stance") == true:
		%viper.disabled = false
		%viper.set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Void Rush") == true:
		%void.disabled = false
		%void.set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Wolf Stance") == true:
		%wolf.disabled = false
		%wolf.set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Absorb Element") == true:
		$"../../../../../EMA/GridContainer/Absorb Element/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Absorb Element/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.bioform == "Crytoan":
		$"../../../../../EMA/GridContainer/Aether Armor/Panel/TextureButton".disabled = true
	if Global.temp_abilities.has("Aether Armor") == true:
		$"../../../../../EMA/GridContainer/Aether Armor/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Aether Armor/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.bioform == "Felkin":
		$"../../../../../EMA/GridContainer/Aether Hand/Panel/TextureButton".disabled = true
	if Global.temp_abilities.has("Aether Hand") == true:
		$"../../../../../EMA/GridContainer/Aether Hand/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Aether Hand/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Aether Lock") == true:
		$"../../../../../EMA/GridContainer/Aether Lock/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Aether Lock/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Aether Missiles") == true:
		$"../../../../../EMA/GridContainer/Aether Missiles/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Aether Missiles/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Aether Pick") == true:
		$"../../../../../EMA/GridContainer/Aether Pick/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Aether Pick/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Aid") == true:
		$"../../../../../EMA/GridContainer/Aid/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Aid/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Animal Attribute") == true:
		$"../../../../../EMA/GridContainer/Animal Attribute/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Animal Attribute/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Blind") == true:
		$"../../../../../EMA/GridContainer/Blind/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Blind/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Blink") == true:
		$"../../../../../EMA/GridContainer/Blink/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Blink/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Confusion Ray") == true:
		$"../../../../../EMA/GridContainer/Confusion Ray/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Confusion Ray/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Contagion Cloud") == true:
		$"../../../../../EMA/GridContainer/Contagion Cloud/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Contagion Cloud/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Control Element") == true:
		$"../../../../../EMA/GridContainer/Control Element/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Control Element/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Counter Ability") == true:
		$"../../../../../EMA/GridContainer/Counter Ability/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Counter Ability/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Death Ward") == true:
		$"../../../../../EMA/GridContainer/Death Ward/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Death Ward/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Detect Thoughts") == true:
		$"../../../../../EMA/GridContainer/Detect Thoughts/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Detect Thoughts/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Disguise Person") == true:
		$"../../../../../EMA/GridContainer/Disguise Person/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Disguise Person/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Earth Bind") == true:
		$"../../../../../EMA/GridContainer/Earth Bind/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Earth Bind/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Elemental Beam") == true:
		$"../../../../../EMA/GridContainer/Elemental Beam/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Elemental Beam/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Elemental Cloak") == true:
		$"../../../../../EMA/GridContainer/Elemental Cloak/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Elemental Cloak/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Elemental Sigil") == true:
		$"../../../../../EMA/GridContainer/Elemental Sigil/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Elemental Sigil/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("elemental Sphere") == true:
		$"../../../../../EMA/GridContainer/Elemental Sphere/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Elemental Sphere/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Elemental Wall") == true:
		$"../../../../../EMA/GridContainer/Elemental Wall/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Elemental Wall/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Expulsion Totem") == true:
		$"../../../../../EMA/GridContainer/Expulsion Totem/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Expulsion Totem/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Feather Fall") == true:
		$"../../../../../EMA/GridContainer/Feather Fall/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Feather Fall/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Fly") == true:
		$"../../../../../EMA/GridContainer/Fly/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Fly/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Gravity Totem") == true:
		$"../../../../../EMA/GridContainer/Gravity Totem/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Gravity Totem/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Guide") == true:
		$"../../../../../EMA/GridContainer/Guide/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Guide/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Hallow Ground") == true:
		$"../../../../../EMA/GridContainer/Hallow Ground/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Hallow Ground/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Haste") == true:
		$"../../../../../EMA/GridContainer/Haste/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Haste/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Identify") == true:
		$"../../../../../EMA/GridContainer/Identify/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Identify/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Illusion") == true:
		$"../../../../../EMA/GridContainer/Illusion/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Illusion/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Infrared Vision") == true:
		$"../../../../../EMA/GridContainer/Infrared Vision/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Infrared Vision/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.bioform == "Mecha Imperium":
		$"../../../../../EMA/GridContainer/Invisibility/Panel/TextureButton".disabled = true
	if Global.temp_abilities.has("Invisibility") == true:
		$"../../../../../EMA/GridContainer/Invisibility/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Invisibility/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Light") == true:
		$"../../../../../EMA/GridContainer/Light/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Light/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Mimicry") == true:
		$"../../../../../EMA/GridContainer/Mimicry/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Mimicry/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Mind Message") == true:
		$"../../../../../EMA/GridContainer/Mind Message/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Mind Message/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Mirror Image") == true:
		$"../../../../../EMA/GridContainer/Mirror Image/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Mirror Image/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Mist Form") == true:
		$"../../../../../EMA/GridContainer/Mist Form/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Mist Form/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Otherworldly Steed") == true:
		$"../../../../../EMA/GridContainer/Otherworldly Steed/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Otherworldly Steed/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Polymorph") == true:
		$"../../../../../EMA/GridContainer/Polymorph/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Polymorph/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Power Nap") == true:
		$"../../../../../EMA/GridContainer/Power Nap/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Power Nap/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Reduce") == true:
		$"../../../../../EMA/GridContainer/Reduce/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Reduce/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Resistance") == true:
		$"../../../../../EMA/GridContainer/Resistance/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Resistance/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Scry") == true:
		$"../../../../../EMA/GridContainer/Scry/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Scry/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Selective Hearing") == true:
		$"../../../../../EMA/GridContainer/Selective Hearing/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Selective Hearing/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Slow") == true:
		$"../../../../../EMA/GridContainer/Slow/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Slow/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Spider Climb") == true:
		$"../../../../../EMA/GridContainer/Spider Climb/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Spider Climb/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Resurrect") == true:
		$"../../../../../EMA/GridContainer/Resurrect/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Resurrect/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Suggestion") == true:
		$"../../../../../EMA/GridContainer/Suggestion/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Suggestion/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Stone Skin") == true:
		$"../../../../../EMA/GridContainer/Stone Skin/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Stone Skin/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Telekinesis") == true:
		$"../../../../../EMA/GridContainer/Telekinesis/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Telekinesis/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Teleport") == true:
		$"../../../../../EMA/GridContainer/Teleport/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Teleport/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Thrall") == true:
		$"../../../../../EMA/GridContainer/Thrall/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Thrall/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Translate") == true:
		$"../../../../../EMA/GridContainer/Translate/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Translate/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_abilities.has("Vampiric Drain") == true:
		$"../../../../../EMA/GridContainer/Vampiric Drain/Panel/TextureButton".disabled = false
		$"../../../../../EMA/GridContainer/Vampiric Drain/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass


	if Global.temp_ability_points == 0 and Global.temp_perk_points == 0 and $".".button_pressed == false:
		$".".disabled = true
	elif Global.temp_ability_points > 0 or Global.temp_perk_points > 0 and $".".disabled == true:
		$".".disabled = false





func _on_toggled(_toggled_on: bool) -> void:
	Global.temp_ability = Ability

	if $".".button_pressed == true:
		Global.temp_abilities.append(Ability)
		if Global.FMA_abilities.has(Ability) == true:
			Global.abilities.append("FMA - " + Ability + ": " + Global.FMA_abilities[Ability])
		else:
			Global.abilities.append("EMA - " + Ability + ": " + Global.EMA_abilities[Ability])

		if Global.used_ability_points < Global.ability_points:
			Global.used_ability_points += 1
		elif Global.used_ability_points == Global.ability_points and Global.used_perk_points < Global.perk_points:
			Global.perk_ability_points += 1

		
		
		
	elif $".".button_pressed == false:
		Global.temp_abilities.erase(Ability)
		if Global.FMA_abilities.has(Ability) == true:
			Global.abilities.erase("FMA - " + Ability + ": " + Global.FMA_abilities[Ability])
		else:
			Global.abilities.erase("EMA - " + Ability + ": " + Global.EMA_abilities[Ability])

		if Global.used_ability_points == Global.ability_points and Global.perk_ability_points > 0:
			Global.perk_ability_points -= 1
		elif Global.used_ability_points <= Global.ability_points:
			Global.used_ability_points -= 1
