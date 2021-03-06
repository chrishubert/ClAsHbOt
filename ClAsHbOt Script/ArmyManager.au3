Func OpenArmyManagerWindow()
   DebugWrite("OpenArmyManagerWindow()")

   ; Click the Army Manager button
   RandomWeightedClick($rArmyManagerButton)
   Sleep(250)

   ; Wait for Army Manager window to appear
   Local $failCount = 5

   While $failCount > 0
	  If WhereAmI() = $eWindowArmyManager Then ExitLoop
	  Sleep(200)
	  $failCount -= 1
   WEnd

   If $failCount <= 0 Then
	  DebugWrite("OpenArmyManagerWindow failed - timeout opening Army Manager Window.")
	  ResetToCoCMainScreen()
	  Return False
   EndIf

   Return True
EndFunc

Func CloseArmyManagerWindow()
   DebugWrite("CloseArmyManagerWindow()")
   ; Close Army Overview window
   RandomWeightedClick($rArmyManagerWindowCloseButton)
   Sleep(500)

EndFunc

Func FindBarracksTroopSlots(Const ByRef $bitmaps, ByRef $index)
   ; Populates index with the client area coords of all available troop buttons
   Local $barracksTroopBox[4] = [292, 238, 739, 412]
   Local $buttonOffset[4] = [0, 17, 74, 63]

   GrabFrameToFile("BarracksFrame.bmp", $barracksTroopBox[0], $barracksTroopBox[1], $barracksTroopBox[2], $barracksTroopBox[3])

   For $i = 0 To UBound($bitmaps)-1
	  Local $res = DllCall("ImageMatch.dll", "str", "FindMatch", "str", "BarracksFrame.bmp", "str", "Images\"&$bitmaps[$i], "int", 3)
	  Local $split = StringSplit($res[0], "|", 2) ; x, y, conf
	  ;DebugWrite("Barracks troop " & $bitmaps[$i] & " found at " & $split[0] & ", " & $split[1] & " conf: " & $split[2])

	  If $split[2] > $gConfidenceBarracksTroopSlot Then
		 $index[$i][0] = $split[0]+$barracksTroopBox[0]+$buttonOffset[0]
		 $index[$i][1] = $split[1]+$barracksTroopBox[1]+$buttonOffset[1]
		 $index[$i][2] = $split[0]+$barracksTroopBox[0]+$buttonOffset[2]
		 $index[$i][3] = $split[1]+$barracksTroopBox[1]+$buttonOffset[3]
	  Else
		 $index[$i][0] = -1
		 $index[$i][1] = -1
		 $index[$i][2] = -1
		 $index[$i][3] = -1
	  EndIf
   Next
EndFunc

#cs
Func GetBarracksTroopCounts(Const ByRef $bitmaps, ByRef $counts)
   Local $barracksTroopBox[4] = [289, 224, 739, 400]
   Local $textOffset[4] = [0, -15, 35, 0]

   ; Grab frame
   GrabFrameToFile("BarracksFrame.bmp", $barracksTroopBox[0], $barracksTroopBox[1], _
				   $barracksTroopBox[2], $barracksTroopBox[3])

   ; Count queued number of each troop
   For $i = 0 To UBound($bitmaps)-1
	  Local $res = DllCall("ImageMatch.dll", "str", "FindMatch", "str", "BarracksFrame.bmp", _
						   "str", "Images\"&$bitmaps[$i], "int", 3)
	  Local $split = StringSplit($res[0], "|", 2) ; x, y, conf
	  ;DebugWrite("Troop " & $gBarracksTroopSlotBMPs[$i] & " conf: " & $split[2])

	  If $split[2] > $gConfidenceBarracksTroopSlot Then
		 Local $textBox[10] = [$barracksTroopBox[0] + $split[0] + $textOffset[0], _
							   $barracksTroopBox[1] + $split[1] + $textOffset[1], _
							   $barracksTroopBox[0] + $split[0] + $textOffset[2], _
							   $barracksTroopBox[1] + $split[1] + $textOffset[3], _
							   $rBarracksTroopCountTextBox[4], $rBarracksTroopCountTextBox[5], _
							   0, 0, 0, 0]

		 ; Parse queue text
		 Local $rawText = ScrapeFuzzyText($gLargeCharacterMaps, $textBox, $gLargeCharMapsMaxWidth, $eScrapeDropSpaces)
		 $counts[$i] = Number(StringReplace($rawText, "x", ""))
		 If $counts[$i]>0 Then DebugWrite("Barracks queued: " & $gTroopNames[$i] & " = " & $counts[$i])

	  EndIf
   Next
EndFunc
#ce

Func DequeueTroops()
   Local $dequeueTries = 6
   While IsButtonPresent($rTrainTroopsWindowDequeueButton) And $dequeueTries>0 And _
		 (_GUICtrlButton_GetCheck($GUI_AutoRaidCheckBox)=$BST_CHECKED Or _
		  _GUICtrlButton_GetCheck($GUI_AutoSnipeCheckBox)=$BST_CHECKED)

	  DebugWrite("Dequeueing troops.")
	  Local $xClick, $yClick
	  RandomWeightedCoords($rTrainTroopsWindowDequeueButton, $xClick, $yClick)
	  _ClickHold($xClick, $yClick, 4000)
	  $dequeueTries-=1
	  Sleep(500)
   WEnd
EndFunc

Func QueueTroopsEvenly(Const $troop, Const ByRef $troopSlots, Const $troopsToQueue)

   If $troopSlots[$eTroopWallBreaker][0] <> -1 Then
	  Local $button[4] = [$troopSlots[$troop][0], $troopSlots[$troop][1], $troopSlots[$troop][2], $troopSlots[$troop][3]]

	  If $troopsToQueue/4 < 1 Then
		 DebugWrite("Queueing 1 " & $gTroopNames[$troop])
		 RandomWeightedClick($button)
		 Sleep(150)
	  Else
		 DebugWrite("Queueing " & Int($troopsToQueue/4) & " " & $gTroopNames[$troop])
		 For $i = 1 To Int($troopsToQueue/4)
			RandomWeightedClick($button)
			Sleep(150)
		 Next
	  EndIf
   EndIf
EndFunc


Func FillBarracksWithTroops(Const $troop, Const ByRef $troopSlots)
   Local $troopsToFill = 999

   ; Get number of troops already queued in this barracks
   Local $queueStatus = ScrapeFuzzyText($gBarracksStatusCharacterMaps, $rBarracksWindowTextBox, $gBarracksStatusCharMapsMaxWidth, $eScrapeDropSpaces)
   ;DebugWrite("Barracks queue status: " & $queueStatus)

   Local $stringLoc = StringInStr($queueStatus, "troops")
   If ($stringLoc <> 0) Then
	  $queueStatus = StringMid($queueStatus, $stringLoc+6)
	  ;DebugWrite("Barracks queue status separated: " & $queueStatus)

	  Local $queueStatSplit = StringSplit($queueStatus, "/")
	  ;DebugWrite("Barracks queue status split: " & $queueStatSplit[1] & " " & $queueStatSplit[2])

	  If $queueStatSplit[0] = 2 Then
		 $troopsToFill = Number($queueStatSplit[2]) - Number($queueStatSplit[1])

		 ; How long to click and hold?
		 Local $fillTime
		 If $troopsToFill>60 Then
			$fillTime = 3500 + Random(-250, 250, 1)
		 ElseIf $troopsToFill>25 Then
			$fillTime = 2700 + Random(-250, 250, 1)
		 ElseIf $troopsToFill>10 Then
			$fillTime = 2300 + Random(-250, 250, 1)
		 Else
			$fillTime = 1800 + Random(-250, 250, 1)
		 EndIf

		 ; Click and hold to fill up queue
		 If $troopsToFill>0 Then
			DebugWrite("FillBarracksWithTroops(), Adding " & $troopsToFill & " " & $gTroopNames[$troop] & " box: " & _
			   $troopSlots[$troop][0] & ", " & $troopSlots[$troop][1] & ", " & $troopSlots[$troop][2] & ", " & $troopSlots[$troop][3])
			Local $button[4] = [$troopSlots[$troop][0], $troopSlots[$troop][1], $troopSlots[$troop][2], $troopSlots[$troop][3]]
			Local $xClick, $yClick
			RandomWeightedCoords($button, $xClick, $yClick)
			_ClickHold($xClick, $yClick, $fillTime)
			Sleep(500)
		 EndIf
	  EndIf
   EndIf

   Return $troopsToFill
EndFunc
