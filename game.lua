
--Variables and shit
player = {}
player.maxhealth = 100
player.health = 100
player.damage = 10
enemy = {}
enemy.name = "Dirt"
enemy.description = "Just a pile of dirt. Can't kill anyone."
enemy.maxhealth = 50
enemy.health = enemy.maxhealth
enemy.damage = 1

print(enemy.name, " appeared")
print(enemy.description)

function cdamage_player( dmgamnt)
    player.health = player.health - dmgamnt
    print("Player took ", dmgamnt, "Damage")
end
function cdamage_enemy( dmgamnt)
    enemy.health = enemy.health - dmgamnt
    print("Enemy took ", dmgamnt, "Damage")
end
function damage_player()
    player.health = player.health - enemy.damage
    print("Player took ", enemy.damage, "Damage")
end
function damage_enemy()
    enemy.health = enemy.health - player.damage
    print("Enemy took ", player.damage, "Damage")
end

--Game loop if you couldn't tell
while (1) do
    current_command=io.read("*l")
    
    if current_command=="ps" then
        print("HP:",player.health,"DMG:",player.damage)
    elseif current_command=="endgame" then
        do return end
    elseif current_command=="cdp" then
        local damage_ammount = tonumber(io.read("*l"))

        if damage_ammount then
            cdamage_player(damage_ammount)
        else
            print("enter a number dumbass")
        end
    elseif current_command=="clear" then
        os.execute("clear")
    elseif current_command=="restart" then
        enemy.health = enemy.maxhealth
        player.health = player.maxhealth
    elseif current_command=="cde" then
        local damage_ammount = tonumber(io.read("*l"))

        if damage_ammount then
            cdamage_enemy(damage_ammount)
        else
            print("enter a number dumbass")
        end
    elseif current_command=="de" then
        damage_enemy()
    elseif current_command=="dp" then
        damage_player()
    elseif current_command=="es" then
        print("Enemy stats HP: ",enemy.health," DMG: ",enemy.damage)
    end
    if player.health == 0 then
        print("You died")
        enemy.health = enemy.maxhealth
        player.health = player.maxhealth
        print("Restarted battle")
    elseif enemy.health == 0 then
        print("The enemy died, You won!")
        enemy.health = enemy.maxhealth
        player.health = player.maxhealth
        print("Restarted battle")
    end
end