-- Rests up to 100% hp and 100% mp
-- Eats chunks automatically, handled by auto_eat_chunks interface option
-- Travels to the nearest corpse if we have no chunks and are at Very Hungry or Hungry or using Gourmand and at Full
-- Automatically chops valid corpses if we are standing on them and we have no chunks
-- Will stop autotravel at Near Starving
-- Channels MP if you have staff of energy or worship Sif when you have extra chunks
-- Casts regen out of combat if you have spare chunks and are missing hp
-- TODO: better detection of non-edible corpses before standing on them
-- TODO: Fix up for Vampire, Ghoul, and possibly Spriggan/Mummy
-- NOTE: If you don't have rP you will still chop poisonous corpses, but not pick up their chunks
local previous_god = you.god()

function HDAtravel()
    local mp, max_mp = you.mp()
    local hp, max_hp = you.hp()
    local first_monster = next(getMonsterList())
    local already_checked = (no_results() or dont_know_how_to_get_there())
    local you_are_barbed = (have_barbs() and not removed_barbs())
    local is_safe = (first_monster == nil)
    local missing_mp = (mp < max_mp)
    local missing_hp = (hp < max_hp)
    local need_to_recover = should_rest(hp, mp, max_hp, max_mp)
    local have_no_chunks = have_no_chunks()
    local you_are_sif = string.find(you.god(), "Sif")
    local you_are_yred = string.find(you.god(), "Yred")
    local you_are_zin = string.find(you.god(), "Zin")
    local you_are_good = string.find(you.god(), "Shining") or string.find(you.god(), "Elyvilon") or you_are_zin
    local sacrifice_god = you_worship_sacrifice_god()
    local you_are_mummy = string.find(you.race(), "Mummy")
    local you_are_vampire = string.find(you.race(), "Vampire")
    local you_are_bloodless = you.hunger_name() == "bloodless"
    local you_are_ghoul = string.find(you.race(), "Ghoul")
    local you_are_bloodless = you.hunger_name() == "bloodless"
    local you_do_not_eat = string.find(you.race(), "Spriggan") or you_are_mummy
    local lichform = string.find(you.transform(), "lich")
    local bladehands = string.find(you.transform(), "blade")
    local dragonform = string.find(you.transform(), "dragon")
    local melded_weapon = (bladehands or dragonform)
    local you_are_regen = you.regenerating()
    local you_know_sublimation = known_spells["Sublimation of Blood"] and (spells.fail("Sublimation of Blood") < 20) and (mp>3)
    local you_know_animate_skeleton = known_spells["Animate Skeleton"] and (spells.fail("Animate Skeleton") < 20) and (mp>1)
    local you_know_animate_dead = known_spells["Animate Dead"] and (spells.fail("Animate Dead") < 20) and (mp>4)
    local chunks_are_equipped = is_weapon("chunk")
    local distort_weapon = is_weapon("distort")
    local vamp_weapon = is_weapon("vamp") and not chunks_are_equipped
    local have_a_weapon = weapon_in_inventory()
    local gourmand_and_hungry = you_are_gourmand() and not (you_are_very_full() or you_are_engorged() or you_are_ghoul)
    local ghoul_missing_hp = you_are_ghoul and ((hp < (max_hp - 5)) or you.rot() > 0)
    local want_to_eat = (you_are_hungry() or gourmand_and_hungry or ghoul_missing_hp) and not you_do_not_eat
    local have_spare_chunks = not have_no_chunks and not you_are_hungry()
    local you_have_staff_of_energy = is_in_inventory("staff of energy")
    local have_potion_of_blood = is_in_inventory("potion of blood") or is_in_inventory("potions of blood")
    local staff_of_energy_is_equipped = is_weapon("staff of energy")
    local staff_of_power_is_equipped = is_weapon("staff of power")
    local staff_of_energy_letter = find_item_letter("staff of energy")
    local chunks_letter = find_item_letter("chunk")
    local you_are_hungerless = you_are_mummy or lichform
    local no_food_issues = (you_are_hungerless or have_spare_chunks)
    local should_channel_mp = ((max_mp - mp) > 5) and no_food_issues
    local can_cast_regen = known_spells["Regeneration"] and (mp>3) and (spells.fail("Regeneration") < 20)
    local can_cast_repel_missiles = known_spells["Repel Missiles"] and (mp>2) and (spells.fail("Repel Missiles") < 30)
    local can_cast_deflect_missiles = known_spells["Deflect Missiles"] and (mp>6) and (spells.fail("Deflect Missiles") < 30)
    local you_have_regen_ring = is_in_inventory("regeneration")
    local regen_ring_letter = find_item_letter("regeneration")
    local regen_ring_is_equipped = is_ring("regeneration")
    local should_regen_hp = (not (you_are_good or you_are_regen or lichform)) and ((hp/max_hp) < 0.80) and (you_have_regen_ring or can_cast_regen) and not you_are_bloodless
    local should_sublimate = (not (you_are_good or lichform)) and ((mp/max_mp) < 0.60) and you_know_sublimation and mp>2 and ((hp/max_hp) > 0.95)
    local should_animate_skeleton = (not you_are_good) and you_know_animate_skeleton and mp>1 and (not can_not_animate())
    local should_animate_dead = (not you_are_good) and you_know_animate_dead and mp>4 and (not can_not_animate())
    local you_want_spare_chunks = (not (have_spare_chunks or you_do_not_eat)) and (can_cast_regen or you_have_staff_of_energy or you_are_sif)
    local you_want_chunks = (not you_are_hungerless and (number_of_chunks() == 0) and (want_to_eat or you_want_spare_chunks)) or you_are_vampire or (you_are_ghoul and number_of_chunks() < 4)
    --crawl.mpr(string.format("you.piety_rank() is: %s", you.piety_rank()))
    --crawl.mpr(string.format("you_want_chunks is: %s", you_want_chunks and "True" or "False"))
    --crawl.mpr(string.format("want_to_eat is: %s", want_to_eat and "True" or "False"))
    --crawl.mpr(string.format("number_of_chunks is: %s", number_of_chunks()))
    --crawl.mpr(string.format("ghoul_missing_hp is: %s", ghoul_missing_hp and "True" or "False"))
    --crawl.mpr(string.format("you.hunger_name() is: %s", you.hunger_name()))
    --crawl.mpr(string.format("have_spare_chunks is: %s", have_spare_chunks and "True" or "False"))
    --crawl.mpr(string.format("can_cast_regen is: %s", can_cast_regen and "True" or "False"))
    --crawl.mpr(string.format("you_are_not_ghoul is: %s", you_are_not_ghoul and "True" or "False"))
    --crawl.mpr(string.format("you_want_spare_chunks is: %s", you_want_spare_chunks and "True" or "False"))
    --crawl.mpr(string.format("you_are_hungerless is: %s", you_are_hungerless and "True" or "False"))
    --crawl.mpr(string.format("have_no_chunks is: %s", have_no_chunks and "True" or "False"))
    --crawl.mpr(string.format("you.status(): %s", you.status()))
    --crawl.mpr(string.format("known_spells[\"Repel Missiles\"]: %s", known_spells["Repel Missiles"] and "True" or "False"))
    --crawl.mpr(string.format("mp: %s", mp))
    --crawl.mpr(string.format("spells.fail(\"Repel Missiles\"): %s", spells.fail("Repel Missiles")))
    --crawl.mpr(string.format("can_cast_repel_missiles is: %s", can_cast_repel_missiles and "True" or "False"))
    --crawl.mpr(string.format("already_protected_from_missiles() is: %s", already_protected_from_missiles() and "True" or "False"))
    if you.god() == "Fedhas" and previous_god ~= you.god() then
        for item in inventory() do
            if item.subtype() == "fruit" then
                if not string.find(item.name(), "!e") then
                    crawl.mpr("<cyan>Autoinscribing fruits.</cyan>")
                    sendkeys("{" .. items.index_to_letter(item.slot) .. "!e\r")
                end
            end
        end
        previous_god = you.god()
    end
    if (is_safe) then
        if you_are_barbed then
            rest()
        elseif should_sublimate and not (you_are_vampire or lichform) then
            crawl.mpr("<lightcyan>Autocasting Sublimation of Blood.</lightcyan>")
            sendkeys('zm')
        elseif should_channel_mp and you_are_sif and (you.piety_rank() > 0) then
            crawl.mpr("<lightcyan>Autochanneling using Sif.</lightcyan>")
            sendkeys('aa')
        elseif should_regen_hp and can_cast_regen then
            crawl.mpr("<green>Autocasting Regen.</green>")
            --This assumes casting regen is bound to zr
            sendkeys('zr')
        elseif (not melded_weapon) and (should_channel_mp and you_have_staff_of_energy and no_food_issues) and (not (distort_weapon or vamp_weapon)) and you_are_not_felid() then
            if not staff_of_energy_is_equipped then
                crawl.mpr("<cyan>Switching to staff of energy.</cyan>")
                sendkeys('w1')
            end
            crawl.mpr("<lightcyan>Autochanneling using staff of energy.</lightcyan>")
            sendkeys('v')
        elseif (weapon_in_slot_a() or uses_unarmed()) and (no_weapon() and have_a_weapon) or (staff_of_energy_is_equipped and (not (staff_of_energy_letter == 'a')) or (chunks_are_equipped and (not (chunks_letter == 'a')))) then
            if uses_unarmed() then
                crawl.mpr("<cyan>Switching to unarmed.</cyan>")
                sendkeys('w-')
            else
                crawl.mpr("<cyan>Switching to main weapon.</cyan>")
                sendkeys('wa')
            end
        elseif want_to_eat and number_of_chunks() > 0 then
            crawl.mpr("<cyan>Autoeating chunks.</cyan>")
            sendkeys('e')
        elseif you_want_chunks and on_corpses() and not on_chunks() and (not can_not_butcher()) then
            if should_animate_skeleton then
                crawl.mpr("<cyan>Autocasting Animate Skeleton for chunks.</cyan>")
                sendkeys('zA')
            else
                crawl.mpr("<cyan>Autochopping corpse.</cyan>")
                sendkeys('c')
            end
        elseif you_want_chunks and (not (you_are_zin or need_to_recover or on_chunks() or on_corpses() or already_checked)) then
            crawl.mpr("<yellow>You may need something to eat soon, looking for food.</yellow>")
            find_corpses()
        elseif you_are_starving_or_near() and (number_of_chunks() == 0) and (not (on_chunks() or on_corpses())) then
            local have_bread = is_in_inventory("bread ration")
            local have_meat = is_in_inventory("meat ration")
            if have_bread or have_meat then
                local result = crawl.yesnoquit("<cyan>Eat a ration?</cyan>", true, 'e')
                if result == 1 and have_bread then
                    sendkeys('e1')
                elseif result == 1 then
                    sendkeys('e2')
                elseif result == 0 then
                    autoexplore()
                end
                if not (is_in_inventory("bread ration") or is_in_inventory("meat ration")) then
                    crawl.mpr("<lightred>That was your last ration! You should go get more.</lightred>")
                end
            else
                crawl.mpr("<red>No rations left! You should look for food.</red>")
            end
        elseif need_to_recover and not you_are_starving() then
            if you_are_bloodless and have_potion_of_blood then
                crawl.mpr("<cyan>Autoquaffing potion of blood.</cyan>")
                sendkeys('q1')
            else
                rest()
            end
        elseif you_are_yred and (you.piety_rank() >= 3) and (item_in_view("corpse") or item_in_view("skeleton") or on_corpses()) and not recently_mass_animated() then
            crawl.mpr("<cyan>Autocasting Mass Animate Remains.</cyan>")
            sendkeys('aa')
        elseif (not sacrifice_god) and (item_in_view("corpse") or item_in_view("skeleton") or on_corpses()) and should_animate_dead and not already_animated() then
            crawl.mpr("<cyan>Autocasting Animate Dead.</cyan>")
            sendkeys('zA')
        elseif (not sacrifice_god) and on_corpses() and should_animate_skeleton then
            crawl.mpr("<cyan>Autocasting Animate Skeleton.</cyan>")
            sendkeys('zA')
        elseif you_are_yred and (you.piety_rank() >= 1) and on_corpses() then
            crawl.mpr("<cyan>Autocasting Animate Remains.</cyan>")
            sendkeys('aa')
        elseif can_cast_deflect_missiles and not already_protected_from_missiles() then
            crawl.mpr("<cyan>Autocasting Deflect Missiles.</cyan>")
            sendkeys('zd')
        elseif can_cast_repel_missiles and not already_protected_from_missiles() then
            crawl.mpr("<cyan>Autocasting Repel Missiles.</cyan>")
            sendkeys('zd')
        else
            --This does the general travelling
            autoexplore()
        end
    else
        --This will provide the "foo is nearby" message
        autoexplore()
    end
end
