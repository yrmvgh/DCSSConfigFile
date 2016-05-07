#####################
# Table of Contents #
#####################

# 1. Dungeon Features
# 2. Failure
# 3. Bad Things
# 4. Translocations
# 5. Expiring Effects
# 6. Religion
# 7. Hell Effects
# 8. Monsters
# 9. Skills
# 10. Distortion

# Set Alias
more := force_more_message

####################
# Dungeon Features #
####################

# Abyssal Rune
more += Found .* abyssal rune of Zot

# Entrances, Exits, and Arrivals
more += Found a frozen archway
more += Found a gateway leading out of the Abyss
more += Found a labyrinth entrance
more += Found a staircase to the Ecumenical Temple
more += The mighty Pandemonium lord.*resides here

# Portal Timers
more += distant snort
more += interdimensional caravan
more += invites you to visit
more += oppressive heat
more += roar of battle
more += sound of rushing water
more += The drain falls to bits
more += There is an entrance to a bailey on this level
more += tolling of a bell
more += wave of frost

# Traps
more += (blundered into a|invokes the power of) Zot
more += A huge blade swings out and slices into you
more += An alarm trap emits a blaring wail
more += The power of Zot is invoked against you
more += You (become entangled|are caught) in (a|the) (web|net)
more += You fall through a shaft
more += You stumble into the trap

# Other
more += Another plant grows acid sacs
more += One of the plants suddenly grows acid sacs
more += The walls and floor vibrate strangely for a moment
more += You are suddenly pulled into a different region
more += You have a vision of.*gates?

###########
# Failure #
###########

more += do not work when you're silenced
more += sense of stasis
more += Something interferes with your magic
more += The rod doesn't have enough magic points
more += The spell fizzles
more += The writing blurs in front of your eyes
more += The.*is unaffected
more += This potion can/'t work under stasis
more += This wand has no charges
more += too hungry
more += You are held in a net
more += You are too injured to fight blindly
more += You can't gag anything down
more += You can't unwield
more += You cannot cast spells when silenced
more += You cannot cast spells while unable to breathe
more += You cannot teleport right now
more += You don't have any such object
more += You don't have enough magic
more += You don't.* that spell
more += You fail to use your ability
more += You have no appropriate body parts free
more += You have no means to grasp a wand firmly enough
more += You haven't enough magic at the moment
more += You miscast
more += Your amulet of stasis
more += Your attempt to break free
more += Your body armour is too heavy

#############################
# Bad and Unexpected Things #
#############################

# Bad things happening to you
more += corrodes your equipment
more += Your corrosive artefact corrodes you
more += are blown away by the wind
more += dispelling energy hits you
more += infuriates you
more += lose consciousness
more += mark forms upon you
more += MASSIVE DAMAGE
more += Ouch! That really hurt!
more += silver sears you
more += Space bends around you
more += Space warps horribly around you
more += surroundings become eerily quiet
more += Terrible wounds (open|spread) all over you
more += The acid corrodes your
more += The air around.*erupts in flames
more += The air twists around and violently strikes you in flight
more += You shudder from the earth-shattering force
more += The arrow of dispersal hits you[^r]
more += The barbed spikes become lodged in your body
more += The barbed spikes dig painfully into your body as you move
more += The blast of calcifying dust hits you[^r]
more += The poison in your body grows stronger
more += The pull of.*song draws you forwards
more += The.*engulfs you in water
more += The.*grabs you[^r]
more += You (are|feel) drained
more += You are (blasted|electrocuted)
more += You are blown backwards
more += You are burned terribly
more += You are encased in ice
more += You are engulfed in calcifying dust
more += You are engulfed in dark miasma
more += You are engulfed in mutagenic fog
more += You are knocked back
more += You are mesmerised
more += You are slowing down
more += You are trampled
more += You convulse
more += You feel a (horrible|terrible) chill
more += You feel haunted
more += You feel your flesh.*rot
more += You feel your power drain away
more += You feel your power leaking away
more += You stumble backwards
more += You.*re (confused|more confused|too confused)
more += You.*re lethally poisoned
more += Your body is wracked with pain
more += Your damage is reflected back at you
more += Your limbs are stiffening
more += Your magical defenses are stripped away
more += Your?.*suddenly stops? moving

# Monsters doing bad things
more += A tree reaches out and hits you!
more += Agitated ravens fly out from beneath the
more += begins to recite a word of recall
more += Being near the torpor snail leaves you feeling lethargic
more += cast banishment
more += cast paralyse
more += cast Torment
more += goes berserk
more += The moth of wrath goads something on
more += is duplicated
more += is no longer invulnerable
more += Its appearance distorts for a moment
more += Mara seems to draw the.*out of itself
more += Mara shimmers
more += Miasma billows from the
more += shoots a curare
more += stands defiantly in death's doorway
more += steals.*your
more += swoops through the air toward you
more += The forest starts to sway and rumble
more += The jumping spider pounces on you [^but]
more += The octopode crusher throws you
more += The shadow imp is revulsed by your support of nature
more += The water nymph flows with the water
more += The.*offers itself to Yredelemnul
more += The.*seems to speed up
more += The.*shudders
more += There is a horrible\, sudden wrenching feeling in your soul
more += Vines fly forth from the trees!
more += You are hit by a branch
more += You feel you are being watched by something
more += Your magical defenses are stripped away
more += \'s.*reflects
more += Something.*(hits|misses) you(?!r)

# Unexpected situations
more += A magical barricade bars your way
more += Done waiting
more += doors? slams? shut
more += It doesn't seem very happy
more += Mutagenic energies flood into your body
more += Some monsters swap places
more += (starving|devoid of blood)
more += (The|Your).*falls away!
more += The divine light dispels your darkness!
more += The walls disappear
more += There is a sealed passage
more += You are wearing\:
more += You can now
more += You cannot afford.*fee
more += You feel (dopey|clumsy|weak)
more += You feel a genetic drift
more += You feel monstrous
more += You feel your rage building
more += You have disarmed
more += You have finished your manual
more += You have reached level
more += You need to eat something NOW
more += You stop (a|de)scending the stairs
more += You turn into a fleshy mushroom
more += Your body shudders with the violent release of wild energies
more += Your guardian golem overheats
more += your magic stops regenerating
more += Your scales start
more += your.*devoured
more += Your?.*can no longer
more += Green shoots are pushing up through the earth

# Things getting better
stop += contamination has completely
more += You can move again
more += You slip out of the net
more += You.*and break free
more += Your fit of retching subsides
more += seems mollified

##################
# Translocations #
##################

# Teleporting
more += You blink
more += You.*teleport [^f]
more += You feel strangely (unstable|stable)
more += You feel your translocation being delayed
more += Your surroundings flicker
more += Your surroundings seem slightly different
more += Your surroundings suddenly seem different

# -Tele
more += You cannot blink right now
more += You cannot teleport right now
more += You feel.*firmly anchored in space
more += You are no longer firmly anchored in space

####################
# Expiring Effects #
####################

# God Abilities
# Divine Shield (The Shining One)
Your divine shield starts to fade.
Your divine shield fades away.
# Jelly Prayer (Jiyva)
Your prayer is over.
# Mirror Damage (Yredelemnul)
more += dark mirror aura disappears

# Player Spells
# Aura of Abjuration
stop += Your aura of abjuration expires
# Death's Door
more += time is quickly running out
more += life is in your own
# Enslavement
more += is no longer charmed
# Flight
more += You are starting to lose your buoyancy
stop += You lose control over your flight
# Haste
more += Your extra speed is starting to run out
more += You feel yourself slow down
# Invisibility
more += You feel more conspicuous
more += You flicker for a moment
more += You flicker back
# Ozocubu's Armour and Condensation Shield
more += Your icy (shield|armour) evaporates
more += Your.*(shield|armour) melts away
# Phase Shift
more += You feel closer to the material plane
more += You are firmly grounded in the material plane once more
# Repel/Deflect
stop += missiles spell is about to expire
more += You feel less protected from missiles
# Shroud of Golubria
stop += shroud begins to fray
stop += shroud unravels
more += Your shroud falls apart
# Silence
more += Your hearing returns
# Swiftness
stop += start to feel a little slower
more += You feel sluggish
# Transmutations
more += Your transformation is almost over
more += You have a feeling this form
more += Your skin feels tender
more += You feel yourself come back to life

# Other
# Potion of Resistance
more += You start to feel less resistant.
more += Your resistance to elements expires

############
# Religion #
############

# Gifts or abilities are ready
# Dithmenos
more += You are shrouded in an aura of darkness
more += You now sometimes bleed smoke
more += You.*no longer.*bleed smoke
more += Your shadow no longer tangibly mimics your actions
more += Your shadow now sometimes tangibly mimics your actions
# Gozag
more += will now duplicate a non-artefact item
# Jiyva
more += will now unseal the treasures of the Slime Pits
# Kikubaaqudgha
more += Kikubaaqudgha will now enhance your necromancy
# Lugonu
more += Lugonu will now corrupt your weapon
# Qazlal
more += resistances upon receiving elemental damage
more += You are surrounded by a storm which can block enemy attacks
# Ru
more += you are ready to make a new sacrifice
# Sif Muna
more += Sif Muna is protecting you from the effects of miscast magic
# The Shining One
more += The Shining One will now bless
# Zin
more += will now cure all your mutations
# You Screwed Up
more += is no longer ready

# Poor Decisions
more += You really shouldn't be using

# Wrath
more += Nemelex gives you another card to finish dealing
more += Fedhas invokes the elements against you
more += Lugonu sends minions to punish you
more += Okawaru sends forces against you
more += wrath finds you

# Xom Effects
more += staircase.*moves
more += is too large for the net to hold

# Other
more += Jiyva alters your body
: if you.god() == "Xom" then
    more += god:
: end

: if not string.find(you.god(), "Jiyva") then
  more += splits in two
:end

################
# Hell Effects #
################

more += A gut-wrenching scream fills the air
more += Brimstone rains from above
more += Die\, mortal
more += Leave now\, before it is too late
more += Something frightening happens
more += Trespassers are not welcome here
more += We do not forgive those who trespass against us
more += We have you now
more += You do not belong in this place
more += You feel a terrible foreboding
more += You feel lost and a long\, long way from home
more += You hear diabolical laughter
more += You hear words spoken in a strange and terrible language
more += You sense a hostile presence
more += You sense an ancient evil watching you
more += You shiver with fear
more += You smell brimstone
more += You suddenly feel all small and vulnerable
more += You will not leave this place

############
# Monsters #
############

# Arriving Unexpectedly
more += appears in a shower of sparks
more += appears out of thin air
more += comes (up|down) the stairs
more += Something appears in a flash of light
more += The.*is a mimic
more += You sense the presence of something unfriendly
more += The.*answers the.*call
more += Wisps of shadow swirl around
more += Shadows whirl around

# Item Use
more += drinks a potion
more += evokes.*(amulet|ring)
more += reads a scroll
more += zaps a (wand|rod)

# Uniques
more += 27-headed.*(comes? into view|opens the)
more += Agnes.*(comes? into view|opens the)
more += Aizul.*(comes? into view|opens the)
more += Antaeus.*(comes? into view|opens the)
more += Arachne.*(comes? into view|opens the)
more += Asmodeus.*(comes? into view|opens the)
more += Asterion.*(comes? into view|opens the)
more += Azrael.*(comes? into view|opens the)
more += Blork the orc.*(comes? into view|opens the)
more += Boris.*(comes? into view|opens the)
more += Cerebov.*(comes? into view|opens the)
more += Crazy Yiuf.*(comes? into view|opens the)
more += Dispater.*(comes? into view|opens the)
more += Dissolution.*(comes? into view|opens the)
more += Donald.*(comes? into view|opens the)
more += Dowan.*(comes? into view|opens the)
more += Duvessa.*(comes? into view|opens the)
more += Edmund.*(comes? into view|opens the)
more += Enchantress.*(comes? into view|opens the)
more += Ereshkigal.*(comes? into view|opens the)
more += Erica.*(comes? into view|opens the)
more += Erolcha.*(comes? into view|opens the)
more += Eustachio.*(comes? into view|opens the)
more += Fannar.*(comes? into view|opens the)
more += Frances.*(comes? into view|opens the)
more += Francis.*(comes? into view|opens the)
more += Frederick.*(comes? into view|opens the)
more += Gastronok.*(comes? into view|opens the)
more += Geryon.*(comes? into view|opens the)
more += Gloorx Vloq.*(comes? into view|opens the)
more += Grinder.*(comes? into view|opens the)
more += Grum.*(comes? into view|opens the)
more += Harold.*(comes? into view|opens the)
more += Ignacio.*(comes? into view|opens the)
more += Ijyb.*(comes? into view|opens the)
more += Ilsuiw.*(comes? into view|opens the)
more += Jorgrun.*(comes? into view|opens the)
more += Jory.*(comes? into view|opens the)
more += Jessica.*(comes? into view|opens the)
more += Joseph.*(comes? into view|opens the)
more += Josephine.*(comes? into view|opens the)
more += Jozef.*(comes? into view|opens the)
more += Khufu.*(comes? into view|opens the)
more += Kirke.*(comes? into view|opens the)
more += Lamia.*(comes? into view|opens the)
more += Lom Lobon.*(comes? into view|opens the)
more += Louise.*(comes? into view|opens the)
more += Mara.*(comes? into view|opens the)
more += Margery.*(comes? into view|opens the)
more += Maud.*(comes? into view|opens the)
more += Maurice.*(comes? into view|opens the)
more += Menkaure.*(comes? into view|opens the)
more += Mennas.*(comes? into view|opens the)
more += Mnoleg.*(comes? into view|opens the)
more += Murray.*(comes? into view|opens the)
more += Natasha.*(comes? into view|opens the)
more += Nergalle.*(comes? into view|opens the)
more += Nessos.*(comes? into view|opens the)
more += Nikola.*(comes? into view|opens the)
more += Norris.*(comes? into view|opens the)
more += Pikel.*(comes? into view|opens the)
more += Polyphemus.*(comes? into view|opens the)
more += Prince Ribbit.*(comes? into view|opens the)
more += Psyche.*(comes? into view|opens the)
more += Purgy.*(comes? into view|opens the)
more += Robin.*(comes? into view|opens the)
more += Roxanne.*(comes? into view|opens the)
more += Rupert.*(comes? into view|opens the)
more += Saint Roka.*(comes? into view|opens the)
more += Sigmund.*(comes? into view|opens the)
more += Snorg.*(comes? into view|opens the)
more += Sojobo.*(comes? into view|opens the)
more += Sonja.*(comes? into view|opens the)
more += Terence.*(comes? into view|opens the)
more += The Lernaean hydra.*(comes? into view|opens the)
more += The royal jelly.*(comes? into view|opens the)
more += The Serpent of Hell.*(comes? into view|opens the)
more += Tiamat.*(comes? into view|opens the)
more += Urug.*(comes? into view|opens the)
more += Vashnia.*(comes? into view|opens the)
more += Wiglaf.*(comes? into view|opens the)
more += Xtahua.*(comes? into view|opens the)

# Malmutate enemies
more += .*Shining Eye.*(comes? into view|opens the)
more += .*Neqoxec.*(comes? into view|opens the)
more += .*Cacodemon.*(comes? into view|opens the)
more += .*wretched star.*comes? into view
more += .*Orbs? of Fire.*(comes? into view|opens the)

# Misc dangerous enemies
more += .*player ghost.* comes? into view
more += .*Hellion.*(comes? into view|opens the)
more += .*Hell Sentinel.*(comes? into view|opens the)
more += .*shrikes? (?!zombie|skeleton).*(comes? into view|opens the)
more += .*spark wasps? (?!zombie|skeleton).*(comes? into view|opens the)
more += .*juggernaut.*(comes? into view|opens the)
more += .*Executioner.*(comes? into view|opens the)
more += .*('s|s') ghost.*(comes? into view|opens the)
more += .*Deep elf demonologist.*(comes? into view|opens the)

# Torment enemies
more += .*Fiend.*(comes? into view|opens the)
more += .*lurking horror.*comes? into view
more += .*Tormentor.*(comes? into view|opens the)
more += .*Greater Mumm.*(comes? into view|opens the)
more += .*Mummy Priest.*(comes? into view|opens the)
more += .*Curse Toe.*(comes? into view|opens the)
more += .*Curse Skull.*(comes? into view|opens the)

# Paralysis enemies
more += .*Ancient Lich.*(comes? into view|opens the)
more += .*Lich.*(comes? into view|opens the)
more += .*Giant Eyeball.*(comes? into view|opens the)
more += .*Ogre Mage.*(comes? into view|opens the)
more += .*a Wizard.*(comes? into view|opens the)
more += .*orc sorcerer.*(comes? into view|opens the)
more += .*sphinx.*(comes? into view|opens the)
more += .*Great orbs? of eyes.*(comes? into view|opens the)
more += .*Vampire knight.*(comes? into view|opens the)

# Low level baddies
: if you.xl() <= 10 then
more += .*Orc wizard.*(comes? into view|opens the)
more += .*Orc priest.*(comes? into view|opens the)
more += .*Orc warrior.*(comes? into view|opens the)
more += .*Wyvern.*(comes? into view|opens the)
more += .*Killer bees? (?!zombie|skeleton).*(comes? into view|opens the)
more += .*Ogre.*(comes? into view|opens the)
more += .*centaurs? (?!zombie|skeleton).*(comes? into view|opens the)
more += .*is wielding.*of (electrocution|draining)
: end

##########
# Skills #
##########

more += Your Shields skill increases to level (4|6|9|15|21|25)
more += Your Short Blades skill increases to level (10|12|14)
more += Your Long Blades skill increases to level (14|16|18|24)
more += Your Maces & Flails skill increases to level (12|16|20|22)
more += Your Axes skill increases to level (16|18|20|26)
more += Your Polearms skill increases to level (14|16|20|26)
more += Your Staves skill increases to level (12|14)
more += Your Evocations skill increases to level (6|10|15)
more += Your Invocations skill increases to level (6|10)

##############
# Distortion #
##############

more += hits you.*(distortion|chaos)
more += warns you.*of (distortion|chaos)
more += is wielding.*of (distortion|chaos)
