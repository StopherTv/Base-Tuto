function CreateAddonBlackAccount(name, owner, money)
	local self = {}

	self.name  = name
	self.owner = owner
	self.money = money

	function self.addMoney(m)
		self.money = self.money + m
		self.save()
	end

	function self.removeMoney(m)
		self.money = self.money - m
		self.save()
	end

	function self.setMoney(m)
		self.money = m
		self.save()
	end

	function self.save()
		if self.owner == nil then
			MySQL.update('UPDATE addon_black_account_data SET money = ? WHERE account_name = ?', {self.money, self.name})
		else
			MySQL.update('UPDATE addon_black_account_data SET money = ? WHERE account_name = ? AND owner = ?', {self.money, self.name, self.owner})
		end
		TriggerClientEvent('esx_addonblackaccount:setMoney', -1, self.name, self.money)
	end

	return self
end