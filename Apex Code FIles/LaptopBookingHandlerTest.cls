@isTest
public class LaptopBookingHandlerTest {

	@isTest
	static void testLaptopBookingTrigger() {

		Laptop_Bookings__c testBooking = new Laptop_Bookings__c(
		Name = 'SnapDeal',
		Send_Email_Notification__c = 'test@example.com',
        Laptop_names__c = 'Dell',        
        Total_No_Of_Laptops__c = '10',        
        Name__c = 'Test User',    
        how_many_months__c = '3'
	);

    Test.startTest();
    
    insert testBooking;
    
    testBooking.how_many_months__c = '4';
    update testBooking;
    
    Test.stopTest();
        
    System.assertEquals(2, Limits.getEmailInvocations(), 'Two emails should be sent (one on insert and one on update)');

}

}