/**
 * @author Hari Krishnan
 * @date 07/16/2013
 * @description This class holds the trigger parameters.
 */
public class TriggerParameters {
  /**
   * @author Hari Krishnan
   * @date 07/16/2013
   * @description A enum that represents the trigger event.
   */
  public enum TriggerEvent {
    BEFORE_INSERT,
	BEFORE_UPDATE,
    BEFORE_DELETE,
    AFTER_INSERT,
    AFTER_UPDATE,
    AFTER_DELETE,
    AFTER_UNDELETE
  }
  public TriggerEvent eventType;

  public List<SObject> oldList { get; private set; }
  public List<SObject> newList { get; private set; }
  public Map<Id, SObject> oldMap { get; private set; }
  public Map<Id, SObject> newMap { get; private set; }
  public String triggerObject { get; private set; }
  public Boolean isExecuting { get; private set; }

  /**
   * @author Hari Krishnan
   * @date 07/16/2013
   * @description Constructs the TriggerParameter object.
   * @param List<SObject> A list of records with the state of 'before' event.
   * @param List<SObject> A list of records with the state of 'after' event.
   * @param Map<Id, SObject> A map of records with the state of 'before' event.
   * @param Map<Id, SObject> A map of records with the state of 'after' event.
   * @param Boolean A flag to indicate 'isBefore' event.
   * @param Boolean A flag to indicate 'isAfter' event.
   * @param Boolean A flag to indicate 'isDelete' event.
   * @param Boolean A flag to indicate 'isInsert' event.
   * @param Boolean A flag to indicate 'isUpdate' event.
   * @param Boolean A flag to indicate 'isUnDelete' event.
   * @param Boolean A flag to indicate 'isExecuting'.
   */
  public TriggerParameters(
    List<SObject> olist,
    List<SObject> nlist,
    Map<Id, SObject> omap,
    Map<Id, SObject> nmap,
    Boolean isBefore,
    Boolean isAfter,
    Boolean isDelete,
    Boolean isInsert,
    Boolean isUpdate,
    Boolean isUndelete,
    Boolean isExecuting
  ) {
    this.oldList = olist;
    this.newList = nlist;
    this.oldMap = omap;
    this.newMap = nmap;
    this.triggerObject = UtilityClass.getSObjectTypeName(
      (this.oldList != null &&
        this.oldList.size() > 0)
        ? this.oldList[0]
        : this.newList[0]
    );

    if (isBefore & isInsert) {
      eventType = TriggerEvent.BEFORE_INSERT;
    } else if (isBefore && isUpdate) {
      eventType = TriggerEvent.BEFORE_UPDATE;
    } else if (isBefore && isDelete) {
      eventType = TriggerEvent.BEFORE_DELETE;
    } else if (isAfter && isInsert) {
      eventType = TriggerEvent.AFTER_INSERT;
    } else if (isAfter && isUpdate) {
      eventType = TriggerEvent.AFTER_UPDATE;
    } else if (isAfter && isDelete) {
      eventType = TriggerEvent.AFTER_DELETE;
    } else if (isAfter && isUndelete) {
      eventType = TriggerEvent.AFTER_UNDELETE;
    }

    this.isExecuting = isExecuting;
  }
}
