--Escapes the special characters in a string for pattern matching
function escape(str)
    --Escapes parens and dash "()-"
    local escaped = str:gsub('[%(%)%-]','\\%1')
    --Removes any coloration parts of the string
    return (escaped:gsub('<[^<]*>',''))
end

function sendkeys(command)
    crawl.flush_input()
    crawl.sendkeys(command)
    coroutine.yield(true)
    crawl.flush_input()
end

function should_rest(hp, mp, max_hp, max_mp)
    local you_are_mummy = string.find(you.race(), "Mummy")
    local you_are_deep_dwarf = string.find(you.race(), "Deep Dwarf")
    --return (mp < (max_mp*0.50) or ((max_mp-mp) > 20)
        --or ((hp < (max_hp*0.80)) or ((max_hp-hp) > 30)
    return (mp < max_mp
        or (hp < max_hp
        and not you_are_deep_dwarf)
        or you.slowed()
        or you.poisoned()
        or you.confused()
        or you.exhausted()
        or (((hp < max_hp) or (mp < max_mp)) and you_are_mummy))
end

-- Hungry, Very Hungry, Near Starving, Starving
function you_are_hungry()
    return not you_are_not_hungry() and ((string.find(you.hunger_name(), "hungry")) or you_are_starving_or_near())
end

-- Normal Satiation
function you_are_not_hungry()
    return (string.find(you.hunger_name(), "not hungry"))
end

-- Engorged
function you_are_engorged()
    return (string.find(you.hunger_name(), "completely stuffed"))
end

-- Very full
function you_are_very_full()
    return (string.find(you.hunger_name(), "very full"))
end

-- Near Starving
function you_are_near_starving()
    return (string.find(you.hunger_name(), "near starving"))
end

-- Near Starving, Starving
function you_are_starving_or_near()
    return (string.find(you.hunger_name(), "starving"))
end

-- Starving
function you_are_starving()
    return you_are_starving_or_near() and not you_are_near_starving()
end

function autoexplore()
    sendkeys('o')
end

function have_barbs()
    return string.find(crawl.messages(10), escape("The barbed spikes become lodged in your body"))
        or string.find(crawl.messages(10), escape("The barbed spikes dig painfully into your body as you move"))
end

function already_animated()
    return string.find(crawl.messages(20), escape("Autocasting Animate Dead"))
end

function removed_barbs()
    return string.find(crawl.messages(10), escape("You carefully extract the manticore spikes from your body"))
        or string.find(crawl.messages(10), escape("The manticore spikes snap loose"))
end

function no_results()
    return string.find(crawl.messages(10), escape("Can't find anything matching that"))
        or string.find(crawl.messages(10), escape("You may need something to eat soon"))
end

function dont_know_how_to_get_there()
    return string.find(crawl.messages(10), escape("know how to get there"))
        or string.find(crawl.messages(10), escape("Have to go through"))
end

function can_not_animate()
    return string.find(crawl.messages(10), escape("There is nothing here that can be animated"))
end

function can_not_bottle()
    return string.find(crawl.messages(10), escape("There isn't anything to bottle here"))
end

function recently_mass_animated()
    return string.find(crawl.messages(10), escape("Autocasting Mass Animate Remains"))
end

function can_not_butcher()
    return string.find(crawl.messages(10), escape("anything suitable to butcher here"))
end

function can_not_eat_that()
    return string.find(crawl.messages(10), escape("You can't eat that"))
        --These strings don't seem to show up in messages
        --or string.find(crawl.messages(10), escape("Not only inedible but also greatly harmful"))
        --or string.find(crawl.messages(10), escape("It is caustic"))
end

function rest()
    sendkeys('5')
end

function you_are_gourmand()
    return you.gourmand() or (not you_are_not_ghoul()) or (not you_are_not_felid()) or (not you_are_not_troll()) or (string.find(you.race(), "Kobold"))
end

function have_no_chunks()
    for it in inventory() do
        if string.find(it.name(), "chunk") then
            return false
        end
    end
    return true
end

function have_rotten_chunks()
    for it in inventory() do
        if string.find(it.name(), "chunk") and string.find(it.name(), "rott") then
            return false
        end
    end
    return true
end

function number_of_chunks()
    for it in inventory() do
        --if string.find(it.name(), "chunk") then
        --crawl.mpr(it.name() .." is edible: " .. (food.can_eat(it) and "True" or "False") .. " and dangerous: " .. (food.dangerous(it) and "True" or "False"))
        --end
        if string.find(it.name(), "chunk") and (not string.find(it.name(), "book")) and food.can_eat(it) and not food.dangerous(it) then
            return it.quantity
        end
    end
    return 0
end

function is_in_inventory(str)
    for it in inventory() do
        if string.find(it.name(), str) then
            return true
        end
    end
    return false
end

function weapon_in_inventory()
    for it in inventory() do
        if string.find(it.class(true), "weapon") then
            return true
        end
    end
    return false
end

function weapon_in_slot_a()
    local it = items.inslot(0)
    if it then
        return string.find(it.class(true), "weapon")
    else
        return false
    end
end

function find_item_letter(str)
    for i = 0,51 do
        it = items.inslot(i)
        if it then
            if string.find(it.name(), str) then
                return items.index_to_letter(i)
            end
        end
    end
    return false
end

function you_worship_sacrifice_god()
    return string.find(you.god(), "Trog")
        --or string.find(you.god(), "Oka")
        --or string.find(you.god(), "Makhleb")
        or string.find(you.god(), "Beogh")
        or string.find(you.god(), "Lugonu")
        --or string.find(you.god(), "Nemelex")
end

function on_corpses()
    local fl = you.floor_items()
    for it in iter.invent_iterator:new(fl) do
        if string.find(it.name(), "corpse")
            and not string.find(it.name(), "rotting")
            and not string.find(it.name(), "plague") then
            return true
        end
    end
    return false
end

function on_chunks()
    for it in floor_items() do
        if string.find(it.name(), "chunk") then
            return true
        else
            return false
        end
    end
end

function you_are_carnivore()
    return you.saprovorous()
end

function you_are_not_ghoul()
    return not (string.find(you.race(), "Ghoul"))
end

function you_are_not_troll()
    return not (string.find(you.race(), "Troll"))
end

function you_are_not_felid()
    return not (string.find(you.race(), "Felid"))
end

function you_are_not_octopode()
    return not (string.find(you.race(), "Octopode"))
end

function find_corpses()
    local race = you.race()
    local god = you.god()
    local exclude_this = ""
    if string.find(god, "Shining") then
        exlude_this = race
    end
    sendkeys(string.char(6) .. "@corpse&&!!rott&&!!skel&&!!sky&&!!necrop&&!!ugly&&!!vampire&&!!corpse rot&&!!&&!!botono" .. exclude_this .. "\ra\r")
end

function inventory()
    return iter.invent_iterator:new(items.inventory())
end

function floor_items()
    return iter.invent_iterator:new(you.floor_items())
end

function no_weapon()
    return (items.equipped_at("Weapon") == nil) and not uses_unarmed()
end

function uses_unarmed()
    return not you_are_not_ghoul()
        or not you_are_not_troll()
        or not you_are_not_felid()
        or (you.skill("Unarmed Combat") >= 3)
end

function is_weapon(str)
    local weapon =  items.equipped_at("Weapon")
    if weapon then
        return string.find(weapon.name(), str)
    else
        return false
    end
end

function is_ring(str)
    local ring1 = items.equipped_at("Left Ring")
    local ring2 = items.equipped_at("Right Ring")
    if ring1 and ring2 then
        return string.find(ring1.name(), str) or string.find(ring2.name(), str)
    elseif ring1 then
        return string.find(ring1.name(), str)
    elseif ring2 then
        return string.find(ring2.name(), str)
    else
        return false
    end
end


-- Returns a table where the key is the monster description and value is the total number of that mob in your vision
function getMonsterList()
    local monsters = {}
    for x = -7,7 do
        for y = -7,7 do
            m = monster.get_monster_at(x, y)
            local attitude_hostile = 0
            if m and (m:attitude() == attitude_hostile) and not (m:is_firewood()) then
                desc = m:desc()
                if (monsters[desc] == nil) then
                    monsters[desc] = 1
                else
                    monsters[desc] = monsters[desc] + 1
                end
            end
        end
    end
    return monsters
end

function item_in_view(str)
    local x,y
    for x = -8,8 do
        for y = -8,8 do
            if not (x == 0 and y == 0) then
                local pile = items.get_items_at(x,y)
                if pile ~= nil then
                    for it in iter.invent_iterator:new(pile) do
                        if string.find(it.name(), str) and you.see_cell_no_trans(x,y) then
                            return true
                        end
                    end
                end
            end
        end
    end
    return false
end

local function init_spells()
    local spell_list = {}

    for _, spell_name in ipairs(you.spells()) do
        spell_list[spell_name] = true
    end

    return spell_list
end

known_spells = init_spells()
crawl.mpr('Helpers loaded')
