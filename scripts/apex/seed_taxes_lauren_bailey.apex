// Six DOF_Tax__c rows for Lauren Bailey — includes Federal + State income tax
Id contactId = [
    SELECT Id
    FROM Contact
    WHERE Name = 'Lauren Bailey'
    LIMIT 1
]
.Id;

List<DOF_Tax__c> rows = new List<DOF_Tax__c>{
    new DOF_Tax__c(
        Contact__c = contactId,
        Amount_Due__c = 18420.50,
        Amount_Paid__c = 18420.50,
        Transaction_Date__c = Date.newInstance(2024, 4, 2),
        Due_Date__c = Date.newInstance(2024, 4, 15),
        Type__c = 'Federal_Income_Tax',
        Status__c = 'Paid',
        Issuing_Entity__c = 'IRS',
        Description__c =
            '<p>FY2023 Form 1040 balance paid in full. Includes W-2 and 1099-INT income.</p>'
    ),
    new DOF_Tax__c(
        Contact__c = contactId,
        Amount_Due__c = 3210.00,
        Amount_Paid__c = 0,
        Transaction_Date__c = Date.newInstance(2025, 1, 10),
        Due_Date__c = Date.newInstance(2025, 4, 15),
        Type__c = 'State_Income_Tax',
        Status__c = 'Open',
        Issuing_Entity__c = 'California FTB',
        Description__c =
            '<p>Estimated Q1 state estimated tax; payment plan not yet elected.</p>'
    ),
    new DOF_Tax__c(
        Contact__c = contactId,
        Amount_Due__c = 875.25,
        Amount_Paid__c = 400.00,
        Transaction_Date__c = Date.newInstance(2024, 11, 5),
        Due_Date__c = Date.newInstance(2025, 1, 31),
        Type__c = 'Property_Tax',
        Status__c = 'Pending',
        Issuing_Entity__c = 'Cook County Assessor',
        Description__c =
            '<p>Second installment residential parcel; partial payment applied.</p>'
    ),
    new DOF_Tax__c(
        Contact__c = contactId,
        Amount_Due__c = 12450.75,
        Amount_Paid__c = 6200.00,
        Transaction_Date__c = Date.newInstance(2024, 6, 1),
        Due_Date__c = Date.newInstance(2024, 12, 31),
        Type__c = 'Business_Tax',
        Status__c = 'Pending',
        Issuing_Entity__c = 'City of Austin',
        Description__c =
            '<p>LLC franchise report fee and gross receipts reconciliation.</p>'
    ),
    new DOF_Tax__c(
        Contact__c = contactId,
        Amount_Due__c = 289.99,
        Amount_Paid__c = 289.99,
        Transaction_Date__c = Date.newInstance(2025, 2, 14),
        Due_Date__c = Date.newInstance(2025, 2, 20),
        Type__c = 'Sales_Tax',
        Status__c = 'Closed',
        Issuing_Entity__c = 'Texas Comptroller',
        Description__c =
            '<p>Retail use tax audit adjustment — closed with no balance.</p>'
    ),
    new DOF_Tax__c(
        Contact__c = contactId,
        Amount_Due__c = 156000.00,
        Amount_Paid__c = 0,
        Transaction_Date__c = Date.newInstance(2024, 9, 1),
        Due_Date__c = Date.newInstance(2025, 9, 1),
        Type__c = 'Estate_Tax',
        Status__c = 'Pending',
        Issuing_Entity__c = 'NYS Dept of Taxation',
        Description__c =
            '<p>Estate filing extension requested; inventory schedule in preparation.</p>'
    )
};

insert rows;
System.debug('Inserted ' + rows.size() + ' tax records for Lauren Bailey');
