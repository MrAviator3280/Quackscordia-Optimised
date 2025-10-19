local PCMGenerator = require('class')('PCMGenerator')

function PCMGenerator:__init(fn)
    self._fn = fn
    self._pcm = {} -- reused buffer to avoid allocations
end

function PCMGenerator:read(n)
    local pcm = self._pcm
    -- clear previous values
    for i = 1, n do pcm[i] = nil end
    local fn = self._fn
    for i = 1, n, 2 do
        local left, right = fn()
        pcm[i] = tonumber(left) or 0
        pcm[i + 1] = tonumber(right) or pcm[i]
    end
    return pcm
end

return PCMGenerator
