local _ = require('src.const_libretro')

local sfx_jump = love.audio.newSource('share/bart_8-bit_platformer_sfx_jump.wav', 'static')
local gfx_texture1 = love.graphics.newImage('share/grafxkid_old_hero.png')
local gfx_texture2 = love.graphics.newImage('share/grafxkid_old_hero_mirror.png') 
local gfx_idle = {
  [0] = love.graphics.newQuad(16, 16, 16, 16, 128, 112),
  love.graphics.newQuad(32, 16, 16, 16, 128, 112),
  love.graphics.newQuad(48, 16, 16, 16, 128, 112),
  love.graphics.newQuad(64, 16, 16, 16, 128, 112)
}
local gfx_move = {
  [0] = love.graphics.newQuad(16, 32, 16, 16, 128, 112),
  love.graphics.newQuad(32, 32, 16, 16, 128, 112),
  love.graphics.newQuad(48, 32, 16, 16, 128, 112),
  love.graphics.newQuad(64, 32, 16, 16, 128, 112),
  love.graphics.newQuad(80, 32, 16, 16, 128, 112),
  love.graphics.newQuad(96, 32, 16, 16, 128, 112)
}
local gfx_jump = {
  love.graphics.newQuad(16, 48, 16, 16, 128, 112),
  love.graphics.newQuad(32, 48, 16, 16, 128, 112)
}
local JUMPTIMEMAX = .25
local XSPEEDMIN = .25

local hero = {
  controller_number = 0,
  texture = gfx_texture1,
  quad = gfx_idle[0],
  on_ground = false,
  jump_held = false,
  n_jump_sfx = 0,
  facing = 1,
  xsize = 16,
  ysize = 16,
  dx = 0,
  dy = 0,
  x = 0,
  y = 0,
}

function hero:animate(dt)
  if self.dx > 0 then
    self.texture = gfx_texture1
  elseif self.dx < 0 then
    self.texture = gfx_texture2
  end
  if not self.on_ground then
    if self.dy < 0 then
      self.quad = gfx_jump[1]
    else
      self.quad = gfx_jump[2]
    end
  elseif self.on_ground and math.abs(self.dx) > .5 then
    local frame = math.floor(love.timer.getTime() * 15) % 6
    self.quad = gfx_move[frame]
  else
    local frame = math.floor(love.timer.getTime() * 5) % 4
    self.quad = gfx_idle[frame]
  end
end

function hero:clamp(rectangle)
  if self.x < rectangle.x then self.x = rectangle.x
  elseif self.x + 1 > rectangle.x + rectangle.width then self.x = rectangle.x + rectangle.width - 1
  end
  --if self.y < rectangle.y then self.y = rectangle.y
  --elseif self.y + 1 > rectangle.y + rectangle.height then self.y = rectangle.y + rectangle.height - 1
  --end
end

function hero:control(dt)
  if self.controller_number < 1 or self.controller_number > 8 then return end
  local speed = self.on_ground and 25 or 15
  if love.joystick.isDown(self.controller_number, RETRO_DEVICE_ID_JOYPAD_UP) then
    --
  elseif love.joystick.isDown(self.controller_number, RETRO_DEVICE_ID_JOYPAD_DOWN) then
    --self.dy = self.dy + dt * speed
  end
  if love.joystick.isDown(self.controller_number, RETRO_DEVICE_ID_JOYPAD_LEFT) then
    self.dx = self.dx - dt * speed
  elseif love.joystick.isDown(self.controller_number, RETRO_DEVICE_ID_JOYPAD_RIGHT) then
    self.dx = self.dx + dt * speed
  end
  if love.joystick.isDown(self.controller_number, RETRO_DEVICE_ID_JOYPAD_A) then
    if self.on_ground and not self.jump_held then
      self:jump()
      self.dy = -15
      self.jump_held = dt
    elseif not self.on_ground and self.jump_held and self.jump_held < JUMPTIMEMAX then  -- Can hold jump for a split second.
      self.dy = -15
      self.jump_held = self.jump_held + dt
    end
  elseif self.jump_held then
    self.jump_held = false
  end
end

function hero:enter_door(map)
  if love.joystick.isDown(self.controller_number, RETRO_DEVICE_ID_JOYPAD_UP) then
    if map:get_char(self.x, self.y) == 'D' or map:get_char(self.x + 1, self.y) == 'D' then
      return true
    end    
  end
end

function hero:jump()
  for _, sfx in ipairs(self.sfx_jump) do
    if not sfx:isPlaying() then love.audio.play(sfx) break end
  end
end

function hero:move(dt, map)
  local dxmax = 10
  local dymax = 100
  local gravity = 98 * dt
  self.dy = self.dy + gravity
  if self.on_ground then
    self.dx = self.dx * .95
    if math.abs(self.dx) < XSPEEDMIN then self.dx = 0 end
  end
  if self.dx < -dxmax then self.dx = -dxmax elseif self.dx > dxmax then self.dx = dxmax end
  if self.dy < -dymax then self.dy = -dymax elseif self.dy > dymax then self.dy = dymax end
  local dx = self.x + self.dx * dt
  local dy = self.y + self.dy * dt
  -- Pickup gems and other items.
  if map:get_char(dx, dy) == 'o' then map:set_char(dx, dy, '.') self:pickup_coin() end
  if map:get_char(dx, dy + 1) == 'o' then map:set_char(dx, dy + 1, '.') self:pickup_coin() end
  if map:get_char(dx + 1, dy) == 'o' then map:set_char(dx + 1, dy, '.') self:pickup_coin() end
  if map:get_char(dx + 1, dy + 1) == 'o' then map:set_char(dx + 1, dy + 1, '.') self:pickup_coin() end
  -- Check for and resolve tile collisions.
  if self.dx <= 0 then
    if map:get_char(dx, self.y) ~= '.' or map:get_char(dx, self.y + .9) ~= '.' then
      dx = math.ceil(dx)
      self.dx = 0
    end
  else
    if map:get_char(dx + 1, self.y) ~= '.' or map:get_char(dx + 1, self.y + .9) ~= '.' then
      dx = math.floor(dx)
      self.dx = 0
    end
  end
  self.on_ground = false
  if self.dy <= 0 then
    if map:get_char(dx, dy) ~= '.' or map:get_char(dx + .9, dy) ~= '.' then
      dy = math.ceil(dy)
      self.dy = 0
      if self.jump_held then
        for _, sfx in ipairs(self.sfx_jump) do
          if sfx:isPlaying() then love.audio.stop(sfx) end
        end
        self.jump_held = JUMPTIMEMAX
      end
    end
  else
    if map:get_char(dx, dy + 1) ~= '.' or map:get_char(dx + .9, dy + 1) ~= '.' then
      dy = math.floor(dy)
      self.dy = 0
      self.on_ground = true
    end
  end
  self.x = dx
  self.y = dy
  self:animate(dt)
end

function hero:paint(xoffset, yoffset)
  xoffset, yoffset = xoffset or 0, yoffset or 0
  love.graphics.draw(
    self.texture,
    self.quad,
    math.floor((self.x - xoffset) * self.xsize),
    math.floor((self.y - yoffset) * self.ysize)
  )
end

function hero:pickup_coin()
  for _, sfx in ipairs(self.sfx_pickup_coin) do
    if not sfx:isPlaying() then love.audio.play(sfx) break end
  end
end

-- Constructor.
function hero:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  -- Initialization.
  self.sfx_jump = {
    love.audio.newSource('share/bart_8-bit_platformer_sfx_jump.wav', 'static'),
    love.audio.newSource('share/bart_8-bit_platformer_sfx_jump.wav', 'static'),
    love.audio.newSource('share/bart_8-bit_platformer_sfx_jump.wav', 'static')
  }
  for _, sfx in ipairs(self.sfx_jump) do sfx:setVolume(.5) end
  self.sfx_pickup_coin = {
    love.audio.newSource('share/bart_8-bit_platformer_sfx_pickup_coin.wav', 'static'),
    love.audio.newSource('share/bart_8-bit_platformer_sfx_pickup_coin.wav', 'static'),
    love.audio.newSource('share/bart_8-bit_platformer_sfx_pickup_coin.wav', 'static')
  }
  for _, sfx in ipairs(self.sfx_pickup_coin) do sfx:setVolume(.5) end
  return o
end

return hero
