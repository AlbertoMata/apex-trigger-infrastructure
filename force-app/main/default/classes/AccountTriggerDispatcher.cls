/**
 * @author Hari Krishnan
 * @date 07/17/2013
 * @description This class extends the TriggerDispatcherBase to provide the dispatching functionality for the trigger actions
 *				on the Account object. The event handlers support allowing and preventing actions for reentrant scenarios.
 *				This is controlled by the flag isBeforeXxxxx and isAfterXxxxx member variables. These variables need to be set
 *				to true before invoking the handlers and set to false after the invocation of the handlers. Resetting is MUST
 *				as otherwise unit tests MAY fail. The actual actions should be placed in the handlers (in a separate class).
 */
public class AccountTriggerDispatcher extends TriggerDispatcherBase {
	private static Boolean isBeforeInsertProcessing  = false;
	private static Boolean isBeforeUpdateProcessing  = false;
	private static Boolean isBeforeDeleteProcessing  = false;
	private static Boolean isAfterInsertProcessing   = false;
	private static Boolean isAfterUpdateProcessing   = false;
	private static Boolean isAfterDeleteProcessing   = false;
	private static Boolean isAfterUndeleteProcessing = false;

	/**
	 * @author Hari Krishnan
	 * @date 07/17/2013
	 * @description Called by the trigger framework to carry out the actions before the records are inserted. If there is an
	 *				existing call running on the same context, the rentrant call will utilize the handler that was created
	 *				in the original call.
	 * @param TriggerParameters Contains the trigger parameters which includes the records that is getting inserted.
	 */
	public virtual override void beforeInsert(TriggerParameters tp) {
		if (!isBeforeInsertProcessing) {
			isBeforeInsertProcessing = true;
			execute(
				new AccountBeforeInsertTriggerHandler(),
				tp,
				TriggerParameters.TriggerEvent.BEFORE_INSERT
			);
			isBeforeInsertProcessing = false;
		} else {
			execute(null, tp, TriggerParameters.TriggerEvent.BEFORE_INSERT);
		}
	}

	public virtual override void beforeDelete(TriggerParameters tp) {
		if (!isBeforeDeleteProcessing) {
			isBeforeDeleteProcessing = true;
			execute(
				new AccountBeforeDeleteTriggerHandler(),
				tp,
				TriggerParameters.TriggerEvent.BEFORE_DELETE
			);
			isBeforeDeleteProcessing = false;
		} else {
			execute(null, tp, TriggerParameters.TriggerEvent.BEFORE_DELETE);
		}
	}

	/**
	 * @author Hari Krishnan
	 * @date 06/20/2013
	 * @description Called by the trigger framework to carry out the actions before the records are updated. If there is an
	 *				existing call running on the same context, the rentrant call will utilize the handler that was created
	 *				in the original call.
	 * @param TriggerParameters Contains the trigger parameters which includes the records that is getting updated.
	 */
	public virtual override void beforeUpdate(TriggerParameters tp) {
		if (!isBeforeUpdateProcessing) {
			isBeforeUpdateProcessing = true;

			execute(
				new AccountBeforeUpdateTriggerHandler(),
				tp,
				TriggerParameters.TriggerEvent.BEFORE_UPDATE
			);

			isBeforeUpdateProcessing = false;
		} else {
			execute(null, tp, TriggerParameters.TriggerEvent.BEFORE_UPDATE);
		}
	}

	/**
	 * @author Hari Krishnan
	 * @date 07/17/2013
	 * @description Called by the trigger framework to carry out the actions after the record(s) are created. If there is an
	 *				existing call running on the same context, the rentrant call will utilize the handler that was created
	 *				in the original call.
	 * @param TriggerParameters Contains the trigger parameters which includes the record(s) that got created.
	 */
	public virtual override void afterInsert(TriggerParameters tp) {
		if (!isAfterInsertProcessing) {
			isAfterInsertProcessing = true;
			execute(
				new AccountAfterInsertTriggerHandler(),
				tp,
				TriggerParameters.TriggerEvent.AFTER_INSERT
			);
			isAfterInsertProcessing = false;
		} else {
			execute(null, tp, TriggerParameters.TriggerEvent.AFTER_INSERT);
		}
	}

	/**
	 * @author Hari Krishnan
	 * @date 07/17/2013
	 * @description Called by the trigger framework to carry out the actions after the records are updated. If there is an
	 *				existing call running on the same context, the rentrant call will utilize the handler that was created
	 *				in the original call.
	 * @param TriggerParameters Contains the trigger parameters which includes the record(s) that got updated.
	 */

	public virtual override void afterUpdate(TriggerParameters tp) {
		if (!isAfterUpdateProcessing) {
			isAfterUpdateProcessing = true;

			execute(
				new AccountAfterUpdateTriggerHandler(),
				tp,
				TriggerParameters.TriggerEvent.AFTER_UPDATE
			);

			isAfterUpdateProcessing = false;
		} else {
			execute(null, tp, TriggerParameters.TriggerEvent.AFTER_UPDATE);
		}
	}

	public virtual override void afterDelete(TriggerParameters tp) {
		if (!isAfterDeleteProcessing) {
			isAfterDeleteProcessing = true;
			execute(
				new AccountAfterDeleteTriggerHandler(),
				tp,
				TriggerParameters.TriggerEvent.AFTER_DELETE
			);
			isAfterDeleteProcessing = false;
		} else {
			execute(null, tp, TriggerParameters.TriggerEvent.AFTER_DELETE);
		}
	}

	public virtual override void afterUnDelete(TriggerParameters tp) {
		if (!isAfterUndeleteProcessing) {
			isAfterUndeleteProcessing = true;
			execute(
				new AccountAfterUnDeleteTriggerHandler(),
				tp,
				TriggerParameters.TriggerEvent.AFTER_UNDELETE
			);
			isAfterUndeleteProcessing = false;
		} else {
			execute(null, tp, TriggerParameters.TriggerEvent.AFTER_UNDELETE);
		}
	}
}
