local level_01 = require('src.dat_level_01')
local level_02 = require('src.dat_level_02')
local background = require('src.background')
local foreground = require('src.foreground')
local unitwindow = require('src.unitwindow')
local character = require('src.hero')

local levels = {
  [0] = level_01,
  level_02,
  level_01
}
local level = 0
local player1 = character:new{ controller_number = 1, x = 2, y = 2 }
local mainwindow = unitwindow:new()
local bg = background:new()
local fg = foreground:new()
bg:load_string(levels[level][1])
fg:load_string(levels[level][2])

function love.load()
  love.graphics.setBackgroundColor(104, 166, 255)
end

function love.update(dt)
  dt = math.min(dt, 0.016666666666667)
  player1:control(dt)
  player1:move(dt, fg)
  if player1:enter_door(bg) then
    player1.x = 0
    player1.y = 4
    bg:load_string(require('dat.world1-4_bg'))
    fg:load_string(require('dat.world1-4_fg'))
    love.graphics.setBackgroundColor(0, 0, 0)
    bg:set_castle()
    fg:set_castle()
  end
  mainwindow.x = player1.x - 10
  mainwindow.y = player1.y - 7.5
  if mainwindow.x < fg.x then mainwindow.x = fg.x elseif mainwindow.x > fg.x + fg.width - 20 then mainwindow.x = fg.x + fg.width - 20 end
  if mainwindow.y < fg.y then mainwindow.y = fg.y elseif mainwindow.y > fg.y + fg.height - 15 then mainwindow.y = fg.y + fg.height - 15 end
  if player1.y < 0 then
    level = (level - 1) % #levels
    bg:load_string(levels[level][1])
    fg:load_string(levels[level][2])
    player1.y = player1.y % 15
  elseif player1.y > 15 then
    level = (level + 1) % #levels
    bg:load_string(levels[level][1])
    fg:load_string(levels[level][2])
    player1.y = player1.y % 15
  end
end

function love.draw()
  bg:paint(mainwindow.x, mainwindow.y)
  fg:paint(mainwindow.x, mainwindow.y)
  player1:paint(mainwindow.x, mainwindow.y)
end
