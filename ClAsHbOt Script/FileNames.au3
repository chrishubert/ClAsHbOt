Global $CoCIconBMPs[1] = ["CoCIcon.bmp"]

Global $gPlayStoreOpenButton[1] = ["PlayStoreOpenButton.bmp"]

Global $GUIImages[12] = [ _
  "GUISplash\troop-archer.png", "GUISplash\troop-balloon.png", "GUISplash\troop-barbarian.png", _
  "GUISplash\troop-dragon.png", "GUISplash\troop-giant.png", "GUISplash\troop-goblin.png", _
  "GUISplash\troop-healer.png", "GUISplash\troop-pekka.png", "GUISplash\troop-wallbreaker.png", _
  "GUISplash\troop-wizard.png" , "GUISplash\troop-bk.png", "GUISplash\troop-aq.png"]

Global $TownHallBMPs[4] = [ _
  "TownHall\TH7.bmp", "TownHall\TH8.bmp", "TownHall\TH9.bmp", "TownHall\TH10.bmp"]

Global $CollectLootBMPs[3] = [ _
  "Loot\FullGoldCollector.bmp", "Loot\FullElixCollector.bmp", "Loot\FullDarkCollector.bmp"]

Global $CollectorBMPs[8] = [ _
  "Collectors\GoldCollectorL12.bmp", "Collectors\GoldCollectorL11.bmp", "Collectors\GoldCollectorL10.bmp", _
  "Collectors\GoldCollectorL9.bmp", _
  "Collectors\ElixCollectorL12.bmp", "Collectors\ElixCollectorL11.bmp", "Collectors\ElixCollectorL10.bmp", _
  "Collectors\ElixCollectorL9.bmp"]

Global $GoldStorageBMPs[8] = [ _
  "Storages\GoldStorageL11.00.bmp", "Storages\GoldStorageL11.25.bmp", "Storages\GoldStorageL11.50.bmp", _
  "Storages\GoldStorageL11.75.bmp", "Storages\GoldStorageL11.90.bmp", _
  "Storages\GoldStorageL10.00.bmp", "Storages\GoldStorageL10.25.bmp", "Storages\GoldStorageL10.50.bmp" ]

Global $ElixStorageBMPs[6] = [ _
  "Storages\ElixStorageL11.00.bmp", "Storages\ElixStorageL11.25.bmp", _
  "Storages\ElixStorageL11.50.bmp", "Storages\ElixStorageL11.75.bmp", _
  "Storages\ElixStorageL11.90.bmp", _
  "Storages\ElixStorageL10.00.bmp"]

Global $DarkStorageBMPs[16] = [ _
  "Storages\DarkStorageL6.00.bmp", "Storages\DarkStorageL6.10.bmp", "Storages\DarkStorageL6.25.bmp", _
  "Storages\DarkStorageL6.75.bmp", "Storages\DarkStorageL6.90.bmp", _
  "Storages\DarkStorageL5.25.bmp", "Storages\DarkStorageL5.30.bmp", "Storages\DarkStorageL5.40.bmp", _
  "Storages\DarkStorageL4.00.bmp", "Storages\DarkStorageL4.25.bmp", "Storages\DarkStorageL4.50.bmp", _
  "Storages\DarkStorageL3.00.bmp", _
  "Storages\DarkStorageL2.00.bmp", "Storages\DarkStorageL2.25.bmp", _
  "Storages\DarkStorageL1.00.bmp", "Storages\DarkStorageL1.25.bmp"]

Global $gTrainTroopsButtonBMPs[1] = ["TrainTroopsButton.bmp"]

Global $gTroopSlotBMPs[$eTroopCount] = [ _
  "RaidSlots\SlotBarbarian.bmp", "RaidSlots\SlotArcher.bmp", "RaidSlots\SlotGiant.bmp", "RaidSlots\SlotGoblin.bmp", _
  "RaidSlots\SlotWallBreaker.bmp", "RaidSlots\SlotBalloon.bmp", "RaidSlots\SlotWizard.bmp", "RaidSlots\SlotHealer.bmp", _
  "RaidSlots\SlotDragon.bmp", "RaidSlots\SlotPekka.bmp", _
  "RaidSlots\SlotMinion.bmp", "RaidSlots\SlotHogRider.bmp", "RaidSlots\SlotValkyrie.bmp", "RaidSlots\SlotGolem.bmp", _
  "RaidSlots\SlotWitch.bmp", "RaidSlots\SlotLavaHound.bmp", "RaidSlots\SlotKing.bmp", "RaidSlots\SlotQueen.bmp"]

; Todo, add earthquake and haste, when I get them
Global $gSpellSlotBMPs[$eSpellCount] = [ _
  "RaidSlots\SlotLightningSpell.bmp", "RaidSlots\SlotHealSpell.bmp", "RaidSlots\SlotRageSpell.bmp", _
  "RaidSlots\SlotJumpSpell.bmp", "RaidSlots\SlotFreezeSpell.bmp", "RaidSlots\SlotPoisonSpell.bmp"]

Global $DonateButtonBMPs[1] = ["Donate\DonateButton.bmp"]

Global $gDonateSlotBMPs[16] = [ _
  "Donate\DonateBarbarian.bmp", "Donate\DonateArcher.bmp", "Donate\DonateGiant.bmp", "Donate\DonateGoblin.bmp", _
  "Donate\DonateWallBreaker.bmp", "Donate\DonateBalloon.bmp", "Donate\DonateWizard.bmp", "Donate\DonateHealer.bmp", _
  "Donate\DonateDragon.bmp", "Donate\DonatePekka.bmp", _
  "Donate\DonateMinion.bmp", "Donate\DonateHogRider.bmp", "Donate\DonateValkyrie.bmp", "Donate\DonateGolem.bmp", _
  "Donate\DonateWitch.bmp", "Donate\DonateLavaHound.bmp"]

Global $gBarracksTroopSlotBMPs [$eTroopCount-2] = [ _
  "Barracks\BarracksBarbarian.bmp", "Barracks\BarracksArcher.bmp", "Barracks\BarracksGiant.bmp", "Barracks\BarracksGoblin.bmp", _
  "Barracks\BarracksWallBreaker.bmp", "Barracks\BarracksBalloon.bmp", "Barracks\BarracksWizard.bmp", "Barracks\BarracksHealer.bmp", _
  "Barracks\BarracksDragon.bmp", "Barracks\BarracksPekka.bmp", _
  "Barracks\BarracksMinion.bmp", "Barracks\BarracksHogRider.bmp", "Barracks\BarracksValkyrie.bmp", "Barracks\BarracksGolem.bmp", _
  "Barracks\BarracksWitch.bmp", "Barracks\BarracksLavaHound.bmp"]

; Todo, add earthquake and haste, when I get them
Global $gBarracksSpellSlotBMPs [$eSpellCount] = [ _
  "Barracks\BarracksLightningSpell.bmp", "Barracks\BarracksHealSpell.bmp", "Barracks\BarracksRageSpell.bmp", _
  "Barracks\BarracksJumpSpell.bmp", "Barracks\BarracksFreezeSpell.bmp", "Barracks\BarracksPoisonSpell.bmp"]
