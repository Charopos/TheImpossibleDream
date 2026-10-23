/obj/structure/roguemachine/atm
	desc = "A witch-engineered apparatus with a mouth that stores and withdraws currency for accounts managed by the Vault of Pharos."

/obj/structure/roguethrone
	name = "throne of Pharos"

/obj/structure/roguemachine/vaultbank
	desc = "A biomechanical obelisk that collects and secures the treasury of the County of Pharos. Throttle it with a strike to spill that which is rightfully yours."

/obj/structure/roguemachine/vaultbank/church
	name = "\improper TEMPLE JAWBANK"
	desc = "A biomechanical obelisk that holds the alms and tithe of the Pantheon's faithful. Throttle it with a strike to spill that which is rightfully yours."
	alert_location = "the Temple"

/obj/structure/roguemachine/vaultbank/merchant
	desc = "A biomechanical obelisk that secures the coffers of the PTC. Throttle it with a strike to spill that which is rightfully yours."

/obj/structure/roguemachine/vaultbank/merchant/get_faction_label()
	return "the PTC"

/obj/structure/roguemachine/vaultbank/merchant/get_patron_label()
	return "the PTC"

/obj/structure/roguemachine/vaultbank/merchant/get_patron_explanation()
	return "Granting a person the status of Agent of the PTC confers Burgher standing upon them. It lowers their tax class and shields them from the worst abuses of the Crown's taxmen. They may also read the names of those who owe debt to the PTC. It enables them to call upon their kin in their home realms for benefits. They can also hail ships and manage purchases on your behalf. Go forth, in Malum's name, and let them collect what is rightfully owed. - Ser Yohan d'Azur"

/obj/structure/roguemachine/vaultbank/bathhouse
	desc = "A biomechanical obelisk that secures the takings of the Pharovian Bathhouse. Throttle it with a strike to spill that which is rightfully yours."
