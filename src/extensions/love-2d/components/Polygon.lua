--[[
    Luact
	
    MIT License
    Copyright (c) 2019 Alexis Munsayac
    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:
    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
--]]
local useDraw = require "luact.src.extensions.love-2d.hooks.useDraw"

local setPropType = require "luact.src.extensions.prop-types.setPropType"
local setDefaultProp = require "luact.src.extensions.prop-types.setDefaultProp"
local number = require "luact.src.extensions.prop-types.descriptor.number"
local tableOf = require "luact.src.extensions.prop-types.descriptor.tableOf"

local drawmode = require "luact.src.extensions.love-2d.types.drawmode"
local named = require "luact.src.extensions.named-components"

local function Polygon(props, children)
  local mode = props.mode
  local points = props.points

  useDraw(function ()
    love.graphics.polygon(mode, points)
  end, { mode, unpack(points) }

  return children
end

named.set(Polygon, "love.Polygon")

setPropType(Polygon, "mode", drawmode)
setPropType(Polygon, "points", tableOf(number))

return Polygon