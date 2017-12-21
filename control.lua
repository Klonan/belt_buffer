built_entity = function(event)
    local entity = event.created_entity
    if not (entity and entity.valid) then return end
    --game.print("Entity built")
    if entity.name == "belt-buffer-proxy" then
        local position = {x = entity.position.x, y = entity.position.y}
        local direction = entity.direction
        local surface = entity.surface
        local force = entity.force
        entity.destroy()
        --game.print(direction)
        local loader_in
        local loader_out
        if direction == 0 then
            loader_in = surface.create_entity{
                name = "belt-buffing-loader",
                position = {x = position.x, y = position.y+0.95},
                direction = 0,
                force = force
            }
            loader_out = surface.create_entity{
                name = "belt-buffing-loader",
                position = {x = position.x, y = position.y-0.95},
                direction = 4,
                force = force
            }
        elseif direction == 2 then
            loader_in = surface.create_entity{
                name = "belt-buffing-loader",
                position = {x = position.x - 0.95, y = position.y},
                direction = 2,
                force = force
            }
            loader_out = surface.create_entity{
                name = "belt-buffing-loader",
                position = {x = position.x + 0.95, y = position.y},
                direction = 6,
                force = force
            }
        elseif direction == 4 then
            loader_in = surface.create_entity{
                name = "belt-buffing-loader",
                position = {x = position.x, y = position.y - 0.95},
                direction = 4,
                force = force
            }
            loader_out = surface.create_entity{
                name = "belt-buffing-loader",
                position = {x = position.x, y = position.y + 0.95},
                direction = 0,
                force = force
            }
        elseif direction == 6 then
            loader_in = surface.create_entity{
                name = "belt-buffing-loader",
                position = {x = position.x + 0.95, y = position.y},
                direction = 6,
                force = force
            }
            loader_out = surface.create_entity{
                name = "belt-buffing-loader",
                position = {x = position.x - 0.95, y = position.y},
                direction = 2,
                force = force
            }
        end
        if not (loader_out and loader_out.valid and loader_in and loader_in.valid) then
            --one of them was fucked, cancel the whole thing
            if loader_out then
                loader_out.destroy()
            end
            if loader_in then
                loader_in.destroy()
            end
            if event.player_index then
                game.players[event.player_index].insert({name = "belt-buffer-proxy"})
            else
                local stack = surface.create_entity{name = "item-entity", stack = {name = "belt-buffer-proxy", count = 1}, position = position, force = force}
                stack.order_deconstruction(force)
            end
            return
        end
        loader_out.loader_type = "output"
        loader_in.destructible = false
        loader_out.destructible = false
        if direction == 0  then
            surface.create_entity{name = "belt-buffer-vu", position = position, force = force}
        elseif direction == 4 then
            surface.create_entity{name = "belt-buffer-vd", position = position, force = force}
        elseif direction == 2 then
            surface.create_entity{name = "belt-buffer-hr", position = position, force = force}
        elseif direction == 6 then
            surface.create_entity{name = "belt-buffer-hl", position = position, force = force}
        end
        return
    end
    if entity.name == "entity-ghost" then
        --game.print("entity is ghost")
        local position = {x = entity.position.x, y = entity.position.y}
        local direction = entity.direction
        local surface = entity.surface
        local force = entity.force
        local inner_entity = entity.ghost_name
        local enum = {
            ["belt-buffer-vu"] = 0,
            ["belt-buffer-vd"] = 4,
            ["belt-buffer-hr"] = 2,
            ["belt-buffer-hl"] = 6
        }
        local direction = enum[inner_entity]
        if direction then
            entity.destroy()
            surface.create_entity{name = "entity-ghost", inner_name = "belt-buffer-proxy", direction = direction, force = force, position = position, expires = false}
        end
    end
end

mined_entity = function(event)
    local entity = event.entity
    if not (entity and entity.valid) then return end
    if entity.name == "belt-buffer-vu" or entity.name == "belt-buffer-vd" then
        local p1 = {x = entity.position.x, y = entity.position.y - 0.95}
        local splitter_area = {{p1.x-2, p1.y - 2},{p1.x+2, p1.y+2}}
        local splitters = entity.surface.find_entities_filtered{area = splitter_area, type = "splitter"}
        local area = {{p1.x - 0.01, p1.y-0.01},{p1.x+0.01, p1.y+0.01}}
        local nearby = entity.surface.find_entities_filtered{area = area, name = "belt-buffing-loader"}
        for k, splitter in pairs (splitters) do
            if splitter.valid then
                splitter.rotate()
            end
        end
        for k, loader in pairs (nearby) do
            loader.destructible = true
            loader.destroy()
            break
            --game.print("killed him")
        end
        for k, splitter in pairs (splitters) do
            if splitter.valid then
                splitter.rotate()
            end
        end
        local p2 = {x = entity.position.x, y = entity.position.y + 0.95}
        splitter_area = {{p2.x-2, p2.y - 2},{p2.x+2, p2.y+2}}
        local splitters = entity.surface.find_entities_filtered{area = splitter_area, type = "splitter"}
        local area = {{p2.x - 0.01, p2.y-0.01},{p2.x+0.01, p2.y+0.01}}
        local nearby = entity.surface.find_entities_filtered{area = area, name = "belt-buffing-loader"}
        for k, splitter in pairs (splitters) do
            if splitter.valid then
                splitter.rotate()
            end
        end
        for k, loader in pairs (nearby) do
            loader.destructible = true
            loader.destroy()
            break
            --game.print("killed his friend")
        end
        for k, splitter in pairs (splitters) do
            if splitter.valid then
                splitter.rotate()
            end
        end
        return
    end
    if entity.name == "belt-buffer-hl" or entity.name == "belt-buffer-hr" then
        local p1 = {x = entity.position.x - 0.95, y = entity.position.y}
        local area = {{p1.x - 0.01, p1.y-0.01},{p1.x+0.01, p1.y+0.01}}
        local splitter_area = {{p1.x-2, p1.y - 2},{p1.x+2, p1.y+2}}
        local splitters = entity.surface.find_entities_filtered{area = splitter_area, type = "splitter"}
        for k, splitter in pairs (splitters) do
            if splitter.valid then
                splitter.rotate()
            end
        end
        local nearby = entity.surface.find_entities_filtered{area = area, name = "belt-buffing-loader"}
        for k, loader in pairs (nearby) do
            loader.destructible = true
            loader.destroy()
            break
            --game.print("killed him")
        end
        for k, splitter in pairs (splitters) do
            if splitter.valid then
                splitter.rotate()
            end
        end
        local p2 = {x = entity.position.x + 0.95, y = entity.position.y}
        splitter_area = {{p2.x-2, p2.y - 2},{p2.x+2, p2.y+2}}
        local splitters = entity.surface.find_entities_filtered{area = splitter_area, type = "splitter"}
        local area = {{p2.x - 0.01, p2.y-0.01},{p2.x+0.01, p2.y+0.01}}
        local nearby = entity.surface.find_entities_filtered{area = area, name = "belt-buffing-loader"}
        for k, splitter in pairs (splitters) do
            if splitter.valid then
                splitter.rotate()
            end
        end
        for k, loader in pairs (nearby) do
            loader.destructible = true
            loader.destroy()
            break
            --game.print("killed his friend")
        end
        for k, splitter in pairs (splitters) do
            if splitter.valid then
                splitter.rotate()
            end
        end
        return
    end
end

script.on_event(defines.events.on_player_pipette, function(event)
    local player = game.players[event.player_index]
    if not (player and player.valid) then return end
    local selected = player.selected
    local item = event.item
    local check = {
        ["belt-buffer-hr"] = true,
        ["belt-buffer-hl"] = true,
        ["belt-buffer-vu"] = true,
        ["belt-buffer-vd"] = true
    }
    if item and check[item.name] then
        player.remove_item(item.name)
        player.cursor_stack.set_stack{name = "belt-buffer-proxy", count = game.item_prototypes["belt-buffer-proxy"].stack_size}
    end
    if selected and selected.valid and check[selected.name] then
        local count = math.min(player.get_item_count("belt-buffer-proxy"), game.item_prototypes["belt-buffer-proxy"].stack_size)
        if player.cheat_mode then count = game.item_prototypes["belt-buffer-proxy"].stack_size end
        if count > 0 then
            player.cursor_stack.set_stack{name = "belt-buffer-proxy", count = count}
            player.remove_item{name = "belt-buffer-proxy", count = count}
        end
    end
end)

script.on_event(defines.events.on_entity_died, function(event)
    local entity = event.entity
    if not (entity and entity.valid) then return end
    local enum = {
        ["belt-buffer-vu"] = 0,
        ["belt-buffer-vd"] = 4,
        ["belt-buffer-hr"] = 2,
        ["belt-buffer-hl"] = 6
    }
    local direction = enum[entity.name]
    if not direction then return end
    mined_entity(event)
    --game.print("It died to")
    local position = {x = entity.position.x, y = entity.position.y}
    local surface = entity.surface
    local force = entity.force
    local prototype = entity.prototype
    local corpse_name
    for name, corpse in pairs (prototype.corpses) do
        corpse_name = name
        break
    end
    entity.destroy()
    if corpse_name then
        surface.create_entity{name = corpse_name, force = "neutral", position = position}
    end
    surface.create_entity{name = "entity-ghost", inner_name = "belt-buffer-proxy", direction = direction, force = force, position = position, expires = true}
end)

script.on_event(defines.events.on_player_configured_blueprint, function(event)
    local player = game.players[event.player_index]
    if not (player and player.valid) then return end
    local stack = player.cursor_stack
    if not (stack and stack.valid and stack.valid_for_read) then return end
    --game.print("Stack is valid")
    local entities = stack.get_blueprint_entities()
    if not entities then return end
    local enum = {
        ["belt-buffer-vu"] = 0,
        ["belt-buffer-vd"] = 4,
        ["belt-buffer-hr"] = 2,
        ["belt-buffer-hl"] = 6
    }

    for k, entity in pairs (entities) do
        local direction = enum[entity.name]
        if direction then
            entity.name = "belt-buffer-proxy"
            entity.direction = direction
        end
    end
    stack.set_blueprint_entities(entities)
end)


script.on_event(defines.events.on_robot_mined_entity, mined_entity)
script.on_event(defines.events.on_player_mined_entity, mined_entity)
script.on_event(defines.events.on_robot_built_entity, built_entity)
script.on_event(defines.events.on_built_entity, built_entity)
