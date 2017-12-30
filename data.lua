local util = require "util"

local tint = function(sprite, tint)
  --local tint = tint or {}
  local sprite = util.table.deepcopy(sprite)
  sprite.tint = tint
  if sprite.hr_version then
    sprite.hr_version.tint = tint
  end
  return sprite
end

data:extend({
    {
    type = "loader",
    name = "belt-buffing-loader",
    icon = "__belt_buffer__/buffer-icon.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation", "fast-replaceable-no-build-while-moving", "placeable-off-grid"},
    max_health = 100,
    filter_count = 5,
    corpse = "small-remnants",
    collision_box = {{-0.2, -0.01}, {0.2, 0.01}},
    selection_box = {{-0.2, -0.2}, {0.2, 0.2}},
    selectable_in_game = false,
    animation_speed_coefficient = 32/2,
    belt_horizontal = tint(basic_belt_horizontal),
    belt_vertical = tint(basic_belt_vertical),
    ending_top = tint(basic_belt_ending_top),
    ending_bottom = tint(basic_belt_ending_bottom),
    ending_side = tint(basic_belt_ending_side),
    starting_top = tint(basic_belt_starting_top),
    starting_bottom = tint(basic_belt_starting_bottom),
    starting_side = tint(basic_belt_starting_side),
    speed = 0.03125*4,
    structure =
    {
      direction_in =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/loader/loader-structure.png",
          priority = "extra-high",
          width = 1,
          height = 1
        }
      },
      direction_out =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/loader/loader-structure.png",
          priority = "extra-high",
          width = 1,
          height = 1
        }
      }
    },
    ending_patch = ending_patch_prototype,
    belt_distance = -0.45,
    container_distance = 0.75,
    belt_length = 0.5,
    localised_name = {"belt-buffer"},
    localised_description = {"belt-buffer-description"},
    order = "z-buffing-loader"
  }})

data:extend({
  {
    type = "container",
    name = "belt-buffer-vu",
    icon = "__belt_buffer__/buffer-icon.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "belt-buffer-proxy"},
    max_health = 150,
    corpse = "small-remnants",
    open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
    close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "impact",
        percent = 60
      }
    },
    collision_box = {{-0.25, -0.75}, {0.25, 0.75}},
    selection_box = {{-0.5, -1}, {0.5, 1}},
    fast_replaceable_group = "container",
    inventory_size = 2,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    picture =
    {
      filename = "__belt_buffer__/buffer-v.png",
      priority = "extra-high",
      width = 38,
      height = 64,
      shift = util.by_pixel(3, -3)
    },
    circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
    circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    localised_name = {"belt-buffer"},
    localised_description = {"belt-buffer-description"},
    order = "z-belt-buffer-chest-v"
  },
  {
    type = "container",
    name = "belt-buffer-vd",
    icon = "__belt_buffer__/buffer-icon.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "belt-buffer-proxy"},
    max_health = 150,
    corpse = "small-remnants",
    open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
    close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "impact",
        percent = 60
      }
    },
    collision_box = {{-0.25, -0.75}, {0.25, 0.75}},
    selection_box = {{-0.5, -1}, {0.5, 1}},
    fast_replaceable_group = "container",
    inventory_size = 2,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    picture =
    {
      filename = "__belt_buffer__/buffer-v.png",
      priority = "extra-high",
      width = 38,
      height = 64,
      shift = util.by_pixel(3, -3)
    },
    circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
    circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    localised_name = {"belt-buffer"},
    localised_description = {"belt-buffer-description"},
    order = "z-belt-buffer-chest-v"
  },
  {
    type = "container",
    name = "belt-buffer-hl",
    icon = "__belt_buffer__/buffer-icon.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "belt-buffer-proxy"},
    max_health = 150,
    corpse = "small-remnants",
    open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
    close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "impact",
        percent = 60
      }
    },
    collision_box = {{-0.75, -0.25}, {0.75, 0.25}},
    selection_box = {{-1, -0.5}, {1, 0.5}},
    fast_replaceable_group = "container",
    inventory_size = 2,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    picture =
    {
      filename = "__belt_buffer__/buffer-h.png",
      priority = "extra-high",
      width = 72,
      height = 32,
      shift = util.by_pixel(3, -3)
    },
    circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
    circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    localised_name = {"belt-buffer"},
    localised_description = {"belt-buffer-description"},
    order = "z-belt-buffer-chest-h"
  },
  {
    type = "container",
    name = "belt-buffer-hr",
    icon = "__belt_buffer__/buffer-icon.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "belt-buffer-proxy"},
    localised_name = {"belt-buffer"},
    localised_description = {"belt-buffer-description"},
    max_health = 150,
    corpse = "small-remnants",
    open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
    close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "impact",
        percent = 60
      }
    },
    collision_box = {{-0.75, -0.25}, {0.75, 0.25}},
    selection_box = {{-1, -0.5}, {1, 0.5}},
    fast_replaceable_group = "container",
    inventory_size = 2,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    picture =
    {
      filename = "__belt_buffer__/buffer-h.png",
      priority = "extra-high",
      width = 72,
      height = 32,
      shift = util.by_pixel(3, -3)
    },
    circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
    circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    order = "z-belt-buffer-chest-h"
  },
})

local item = util.table.deepcopy(data.raw.item["transport-belt"])
item.name = "belt-buffer-proxy"
item.place_result = "belt-buffer-proxy"
item.icon = "__belt_buffer__/buffer-icon.png"
item.localised_name = {"belt-buffer"}
item.localised_description = {"belt-buffer-description"}
item.order = "z-belt-buffer"
data:extend({item})

local item = util.table.deepcopy(data.raw.item["transport-belt"])
item.name = "belt-buffer-proxy-hl"
item.flags = {"hidden"}
item.place_result = "belt-buffer-hl"
item.icon = "__belt_buffer__/buffer-icon.png"
item.localised_name = {"belt-buffer"}
item.localised_description = {"belt-buffer-description"}
data:extend({item})

local item = util.table.deepcopy(data.raw.item["transport-belt"])
item.name = "belt-buffer-proxy-vu"
item.flags = {"hidden"}
item.place_result = "belt-buffer-vu"
item.icon = "__belt_buffer__/buffer-icon.png"
item.localised_name = {"belt-buffer"}
item.localised_description = {"belt-buffer-description"}
data:extend({item})

local item = util.table.deepcopy(data.raw.item["transport-belt"])
item.name = "belt-buffer-proxy-hr"
item.flags = {"hidden"}
item.place_result = "belt-buffer-hr"
item.icon = "__belt_buffer__/buffer-icon.png"
item.localised_name = {"belt-buffer"}
item.localised_description = {"belt-buffer-description"}
data:extend({item})

local item = util.table.deepcopy(data.raw.item["transport-belt"])
item.name = "belt-buffer-proxy-vd"
item.flags = {"hidden"}
item.place_result = "belt-buffer-vd"
item.icon = "__belt_buffer__/buffer-icon.png"
item.localised_name = {"belt-buffer"}
item.localised_description = {"belt-buffer-description"}
data:extend({item})

local combinator = util.table.deepcopy(data.raw["decider-combinator"]["decider-combinator"])
combinator.name = "belt-buffer-proxy"
combinator.icon = "__belt_buffer__/buffer-icon.png"
combinator.localised_name = {"belt-buffer"}
combinator.localised_description = {"belt-buffer-description"}
combinator.active_energy_usage = "0J"
combinator.sprites.east = 
{
  filename = "__belt_buffer__/buffer-h.png",
  priority = "extra-high",
  width = 72,
  height = 32,
  shift = util.by_pixel(3, -3)
}
combinator.sprites.west = 
{
  filename = "__belt_buffer__/buffer-h.png",
  priority = "extra-high",
  width = 72,
  height = 32,
  shift = util.by_pixel(3, -3)
}
combinator.sprites.north = 
{
  filename = "__belt_buffer__/buffer-v.png",
  priority = "extra-high",
  width = 38,
  height = 64,
  shift = util.by_pixel(3, -3)
}
combinator.sprites.south = 
{
  filename = "__belt_buffer__/buffer-v.png",
  priority = "extra-high",
  width = 38,
  height = 64,
  shift = util.by_pixel(3, -3)
}
combinator.less_symbol_sprites.east.width = 1
combinator.less_symbol_sprites.east.height = 1
combinator.less_symbol_sprites.north.width = 1
combinator.less_symbol_sprites.north.height = 1
combinator.less_symbol_sprites.west.width = 1
combinator.less_symbol_sprites.west.height = 1
combinator.less_symbol_sprites.south.width = 1
combinator.less_symbol_sprites.south.height = 1
--error(serpent.block(combinator))
data:extend({combinator})
local recipe = util.table.deepcopy(data.raw.recipe["transport-belt"])
recipe.name = "belt-buffer"
recipe.result = "belt-buffer-proxy"
recipe.ingredients = {
  {type = "item", name = "iron-plate", amount = 5},
  {type = "item", name = "iron-gear-wheel", amount = 10},
  {type = "item", name = "transport-belt", amount = 2},
  {type = "item", name = "iron-stick", amount = 5}
}
recipe.localised_name = {"belt-buffer"}
recipe.localised_description = {"belt-buffer-description"}
recipe.result_count = 1
data:extend({recipe})

