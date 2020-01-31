trigger AccountTrigger on Account(
	after insert,
	after update,
	after delete,
	before insert,
	before update,
	before delete,
	after undelete
) {
	// This is the only line of code that is required.
	TriggerFactory.createTriggerDispatcher(Account.sObjectType);
}
