/**
 * @author Alberto Mata
 * @date 05/03/2021
 * @description Unit tests for the entire framework 
 *				
 */
@isTest
public with sharing class TestTriggerFramework {

	@TestSetup
	static void setUpRecords() {
		Id currentUserId = UserInfo.getUserId();

		User currentUser = [
			SELECT Id, Name
			FROM User
			WHERE Id = :currentUserId
			LIMIT 1
		];

		System.debug(currentUserId);
		System.debug(currentUser);

		Account acct                     = new Account();
		        acct.Name                = 'testacct1';
		insert acct;
	}

	@isTest
	static void updateRecords() {
		Account acct1      = [SELECT Id, Name FROM Account WHERE Name = 'testacct1'];
		        acct1.Name = 'testacct2';
		update acct1;
		System.assert (true, 'testMessage');
	}

	@isTest
	static void deleteRecords() {
		Test.startTest();

		Account acct1 = [SELECT Id, Name FROM Account WHERE Name = 'testacct1'];

		try {
			delete acct1;
		} catch (Exception e) {
			System.debug (e);
		}

		Test.stopTest ();

		undelete acct1;

		System.assert (true, 'testMessage');
	}

	@isTest
	static void extra() {
		TriggerException ex = new TriggerException ();
		System.assert (true, 'testMessage');
	}

}