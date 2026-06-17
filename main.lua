local background = require('src.background')
local foreground = require('src.foreground')
local unitwindow = require('src.unitwindow')
local character = require('src.character')

local player1 = character:new{ controller_number = 1, x = 200, y = 2 }
local mainwindow = unitwindow:new()
local bg = background:new()
local fg = foreground:new()
bg:load_string(require('dat.world1-1_bg'))
fg:load_string(require('dat.world1-1_fg'))

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
  end
  mainwindow.x = player1.x - 10
  mainwindow.y = player1.y - 7.5
  if mainwindow.x < fg.x then mainwindow.x = fg.x elseif mainwindow.x > fg.x + fg.width - 20 then mainwindow.x = fg.x + fg.width - 20 end
  if mainwindow.y < fg.y then mainwindow.y = fg.y elseif mainwindow.y > fg.y + fg.height - 15 then mainwindow.y = fg.y + fg.height - 15 end
end

function love.draw()
  bg:paint(mainwindow.x, mainwindow.y)
  fg:paint(mainwindow.x, mainwindow.y)
  player1:paint(mainwindow.x, mainwindow.y)
end
