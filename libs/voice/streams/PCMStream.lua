local unpack = string.unpack -- luacheck: ignore

local PCMStream = require('class')('PCMStream')

function PCMStream:__init(stream)
    self._stream = stream
    self._pcm = {} -- reused buffer
end

function PCMStream:read(n)
  local m = n * 2
  local str = self._stream:read(m)
  if str and #str == m then
    local pcm = self._pcm
    for j = 1, n do pcm[j] = nil end
    local pos = 1
    for k = 1, n do
        local val
        val, pos = unpack('<i2', str, pos)
        pcm[k] = val
    end
    return pcm
  end
end

return PCMStream
