local unpack = string.unpack -- luacheck: ignore

local PCMString = require('class')('PCMString')

-- Reuse a single table per PCMString instance to avoid allocating a new table every read.
function PCMString:__init(str)
    self._len = #str
    self._str = str
    self._pcm = {} -- reused buffer
    self._i = 1
end

function PCMString:read(n)
    local i = self._i
    local bytes = n * 2
    if i + bytes <= self._len then
        local pcm = self._pcm
        -- clear existing entries (avoid reallocating table)
        for j = 1, n do pcm[j] = nil end
        local pos = i
        for k = 1, n do
            local val
            val, pos = unpack('<i2', self._str, pos)
            pcm[k] = val
        end
        self._i = pos
        return pcm
    end
end

return PCMString
