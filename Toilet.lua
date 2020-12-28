local Toilet = {}
Toilet.__index = Toilet

function Toilet.new()
	local self = setmetatable({}, Toilet)

	self.contents = {}
	self._queue   = {}

	return self
end

function Toilet:Dump(value)
	table.insert(self._queue, value)
end

function Toilet:Clean()
	local list = {}

	for _, value in next, self._queue do
		if not table.find(self.contents, value) then
			table.insert(list, value)
		end
	end

	return list
end

function Toilet:Flush()
	local list = {}

	for _, value in next, self.contents do
		if not table.find(self._queue, value) then
			table.insert(list, value)
		end
	end

	self.contents = self._queue
	self._queue   = {}

	return list
end

function Toilet:Destroy()
	self._contents = nil
	self._queue    = nil

	setmetatable(self, nil)
end

return Toilet