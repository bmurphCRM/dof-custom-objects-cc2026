// Ten DOF_Utility_Bill__c rows for Lauren Bailey
Id contactId = [
    SELECT Id
    FROM Contact
    WHERE Name = 'Lauren Bailey'
    LIMIT 1
]
.Id;

List<DOF_Utility_Bill__c> rows = new List<DOF_Utility_Bill__c>{
    new DOF_Utility_Bill__c(
        Contact__c = contactId,
        Account_Number__c = 'ELEC-88421-A',
        Account_Type__c = 'Residential',
        Type__c = 'Electricity',
        Status__c = 'Paid',
        Amount__c = 142.33,
        Amount_Paid__c = 142.33,
        Due_Date__c = Date.newInstance(2025, 3, 15),
        Organization__c = 'Pacific Gas & Electric',
        Comments__c = '<p>Winter billing cycle; budget billing enrolled.</p>'
    ),
    new DOF_Utility_Bill__c(
        Contact__c = contactId,
        Account_Number__c = 'WTR-99201',
        Account_Type__c = 'Residential',
        Type__c = 'Water',
        Status__c = 'Not_Paid',
        Amount__c = 67.50,
        Amount_Paid__c = 0,
        Due_Date__c = Date.newInstance(2025, 4, 1),
        Organization__c = 'Municipal Water District',
        Comments__c = '<p>Usage up 8% vs prior quarter.</p>'
    ),
    new DOF_Utility_Bill__c(
        Contact__c = contactId,
        Account_Number__c = 'NG-440772',
        Account_Type__c = 'Residential',
        Type__c = 'Natural_Gas',
        Status__c = 'Delinquent',
        Amount__c = 289.00,
        Amount_Paid__c = 50.00,
        Due_Date__c = Date.newInstance(2025, 1, 10),
        Organization__c = 'City Gas Co.',
        Comments__c = '<p>Second notice; arrange payment plan.</p>'
    ),
    new DOF_Utility_Bill__c(
        Contact__c = contactId,
        Account_Number__c = 'SWR-11209',
        Account_Type__c = 'Residential',
        Type__c = 'Sewer',
        Status__c = 'Paid',
        Amount__c = 45.00,
        Amount_Paid__c = 45.00,
        Due_Date__c = Date.newInstance(2025, 2, 28),
        Organization__c = 'Regional Sanitation Authority',
        Comments__c = '<p>Flat rate residential sewer charge.</p>'
    ),
    new DOF_Utility_Bill__c(
        Contact__c = contactId,
        Account_Number__c = 'TEL-5566300',
        Account_Type__c = 'Residential',
        Type__c = 'Phone',
        Status__c = 'Not_Paid',
        Amount__c = 89.99,
        Amount_Paid__c = 0,
        Due_Date__c = Date.newInstance(2025, 4, 20),
        Organization__c = 'Metro Communications',
        Comments__c = '<p>Bundle: landline + basic data.</p>'
    ),
    new DOF_Utility_Bill__c(
        Contact__c = contactId,
        Account_Number__c = 'HVAC-SVC-09',
        Account_Type__c = 'Residential',
        Type__c = 'Heating_Cooling',
        Status__c = 'Paid',
        Amount__c = 199.00,
        Amount_Paid__c = 199.00,
        Due_Date__c = Date.newInstance(2025, 3, 1),
        Organization__c = 'ComfortCare HVAC',
        Comments__c = '<p>Seasonal maintenance contract invoice.</p>'
    ),
    new DOF_Utility_Bill__c(
        Contact__c = contactId,
        Account_Number__c = 'WST-7781',
        Account_Type__c = 'Residential',
        Type__c = 'Garbage_Waste',
        Status__c = 'Delinquent',
        Amount__c = 124.75,
        Amount_Paid__c = 0,
        Due_Date__c = Date.newInstance(2024, 12, 15),
        Organization__c = 'GreenBin Waste Services',
        Comments__c = '<p>Cart size upgrade + missed pickup credit pending.</p>'
    ),
    new DOF_Utility_Bill__c(
        Contact__c = contactId,
        Account_Number__c = 'ELEC-88421-B',
        Account_Type__c = 'Commercial',
        Type__c = 'Electricity',
        Status__c = 'Not_Paid',
        Amount__c = 1840.22,
        Amount_Paid__c = 500.00,
        Due_Date__c = Date.newInstance(2025, 5, 5),
        Organization__c = 'Pacific Gas & Electric',
        Comments__c = '<p>Small business TOU rate; partial payment applied.</p>'
    ),
    new DOF_Utility_Bill__c(
        Contact__c = contactId,
        Account_Number__c = 'WTR-COMM-221',
        Account_Type__c = 'Commercial',
        Type__c = 'Water',
        Status__c = 'Paid',
        Amount__c = 412.60,
        Amount_Paid__c = 412.60,
        Due_Date__c = Date.newInstance(2025, 3, 30),
        Organization__c = 'Municipal Water District',
        Comments__c = '<p>Meter read actual; irrigation meter included.</p>'
    ),
    new DOF_Utility_Bill__c(
        Contact__c = contactId,
        Account_Number__c = 'NG-IND-0092',
        Account_Type__c = 'Industrial',
        Type__c = 'Natural_Gas',
        Status__c = 'Paid',
        Amount__c = 4520.00,
        Amount_Paid__c = 4520.00,
        Due_Date__c = Date.newInstance(2025, 2, 15),
        Organization__c = 'Industrial Gas Supply LLC',
        Comments__c = '<p>Volume tier pricing; safety inspection passed.</p>'
    )
};

insert rows;
System.debug('Inserted ' + rows.size() + ' utility bills for Lauren Bailey');
