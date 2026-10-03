// Collar and chastity signals, arguments are the carbon mob and the item that was gained or lost
#define COMSIG_CARBON_GAIN_COLLAR "carbon_gain_collar"
#define COMSIG_CARBON_LOSE_COLLAR "carbon_lose_collar"
#define COMSIG_CARBON_GAIN_CHASTITY "carbon_gain_chastity"
#define COMSIG_CARBON_LOSE_CHASTITY "carbon_lose_chastity"

///Chastity state changed on a wearer (mob/living/carbon/human/wearer, obj/item/chastity/device, reason)
#define COMSIG_CARBON_CHASTITY_STATE_CHANGED "carbon_chastity_state_changed"

///Intimate accessory state changed on a wearer (mob/living/carbon/human/wearer, obj/item/intimate_accessory/device, reason)
#define COMSIG_CARBON_INTIMATE_STATE_CHANGED "carbon_intimate_state_changed"

/// Standardized received-sex-action hook emitted on the receiving carbon (mob/living/carbon/human/acting_mob, datum/sex_controller/acting_sexcon, datum/sex_action/action, receiver_part, giving, arousal_amt, pain_amt, applied_force, applied_speed)
#define COMSIG_CARBON_SEX_ACTION_RECEIVED "carbon_sex_action_received"

/// Pre-validation hook emitted on an involved carbon during sex action menu/execution checks (datum/sex_action/action, mob/living/carbon/human/other, checked_part, is_user_role, menu_check)
#define COMSIG_CARBON_SEX_ACTION_VALIDATE "carbon_sex_action_validate"
	/// Return to hide or block the action.
	#define COMPONENT_SEX_ACTION_BLOCK (1<<0)

/// Pre-command hook for collar masters targeting a pet (mob/living/carbon/human/pet, datum/component/collar_master/controller, command_id, command_value)
#define COMSIG_CARBON_COLLAR_COMMAND "carbon_collar_command"
	/// Return to block execution of a collar command.
	#define COMPONENT_COLLAR_COMMAND_BLOCK (1<<0)
	#define COLLAR_COMMAND_SHOCK "shock"
	#define COLLAR_COMMAND_FORCE_STRIP "force_strip"
	#define COLLAR_COMMAND_FORCE_SURRENDER "force_surrender"
	#define COLLAR_COMMAND_TOGGLE_AROUSAL "toggle_arousal"
	#define COLLAR_COMMAND_TOGGLE_SPEECH "toggle_speech"
	#define COLLAR_COMMAND_TOGGLE_DENIAL "toggle_denial"
	#define COLLAR_COMMAND_SET_CHASTITY_LOCK "set_chastity_lock"
	#define COLLAR_COMMAND_SET_CHASTITY_FRONT_MODE "set_chastity_front_mode"
	#define COLLAR_COMMAND_SET_CHASTITY_ANAL_OPEN "set_chastity_anal_open"
	#define COLLAR_COMMAND_SET_CHASTITY_SPIKES "set_chastity_spikes"
	#define COLLAR_COMMAND_SET_CHASTITY_FLAT "set_chastity_flat"

/// Fired when a pet is released/cleaned up from collar control (mob/living/carbon/human/pet, datum/component/collar_master/controller)
#define COMSIG_CARBON_COLLAR_RELEASED "carbon_collar_released"

/// Called before a cursed collar finalizes on a wearer (mob/living/carbon/human/wearer, datum/mind/master, obj/item/clothing/neck/roguetown/cursed_collar/collar)
#define COMSIG_CARBON_COLLAR_BIND_ATTEMPT "carbon_collar_bind_attempt"
	/// Return to prevent the collar from binding.
	#define COMPONENT_COLLAR_BIND_BLOCK (1<<0)

/// Called after a cursed collar binds successfully (mob/living/carbon/human/wearer, datum/mind/master, obj/item/clothing/neck/roguetown/cursed_collar/collar)
#define COMSIG_CARBON_COLLAR_BOUND "carbon_collar_bound"

/// Called before lock state manipulation on chastity devices (mob/living/carbon/human/wearer, mob/living/actor, obj/item/source_item, new_locked_state, method)
#define COMSIG_CARBON_CHASTITY_LOCK_INTERACT "carbon_chastity_lock_interact"
	/// Return to prevent lock state changes from key/lockpick interactions.
	#define COMPONENT_CHASTITY_LOCK_INTERACT_BLOCK (1<<0)

/// Called after lock state changes on chastity devices (mob/living/carbon/human/wearer, mob/living/actor, obj/item/source_item, new_locked_state, method)
#define COMSIG_CARBON_CHASTITY_LOCK_CHANGED "carbon_chastity_lock_changed"
