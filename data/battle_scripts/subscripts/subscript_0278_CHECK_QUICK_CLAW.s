.include "asm/include/battle_commands.inc"

.data

// TODO Loop over battlers here

.include "asm/include/battle_commands.inc"

.data

_000:
    UpdateVar OPCODE_SET, BSCRIPT_VAR_BATTLER_SPEED_TEMP, 0

_loop:
    GetMonBySpeedOrder BSCRIPT_VAR_MSG_BATTLER_TEMP

    CompareMonDataToValue OPCODE_EQU, BATTLER_CATEGORY_MSG_TEMP, BMON_DATA_CUSTAP_FLAG, 1, _printMessage
    CompareMonDataToValue OPCODE_EQU, BATTLER_CATEGORY_MSG_TEMP, BMON_DATA_QUICK_CLAW_FLAG, 1, _printMessage
    GoTo _continue

_printMessage:
    PlayBattleAnimation BATTLER_CATEGORY_MSG_TEMP, BATTLE_ANIMATION_HELD_ITEM
    Wait 
    // {0} can act faster than normal, thanks to its {1}!
    PrintMessage 1254, TAG_NICKNAME_ITEM, BATTLER_CATEGORY_MSG_TEMP, BATTLER_CATEGORY_MSG_TEMP
    Wait 
    WaitButtonABTime 30

_continue:
    UpdateVar OPCODE_ADD, BSCRIPT_VAR_BATTLER_SPEED_TEMP, 1
    GoToIfValidMon BSCRIPT_VAR_BATTLER_SPEED_TEMP, _loop
    End
