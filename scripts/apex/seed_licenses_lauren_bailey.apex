// Three DOF_License__c rows for Contact Lauren Bailey
Id contactId = [
    SELECT Id
    FROM Contact
    WHERE Name = 'Lauren Bailey'
    LIMIT 1
]
.Id;

List<DOF_License__c> rows = new List<DOF_License__c>{
    new DOF_License__c(
        Contact__c = contactId,
        Date_Issued__c = Date.newInstance(2024, 3, 12),
        Expiration_Date__c = Date.newInstance(2029, 3, 12),
        Issuing_Entity__c = 'California DMV',
        Status__c = 'Active',
        Type__c = 'Driver License',
        Description__c =
            '<p>Class C operator license. Restrictions: corrective lenses. Renew online eligible.</p>'
    ),
    new DOF_License__c(
        Contact__c = contactId,
        Date_Issued__c = Date.newInstance(2023, 8, 1),
        Expiration_Date__c = Date.newInstance(2025, 8, 1),
        Issuing_Entity__c = 'State Real Estate Commission',
        Status__c = 'Pending',
        Type__c = 'Real Estate',
        Description__c =
            '<p>Broker license application submitted; awaiting background check and exam results.</p>'
    ),
    new DOF_License__c(
        Contact__c = contactId,
        Date_Issued__c = Date.newInstance(2025, 1, 15),
        Expiration_Date__c = Date.newInstance(2026, 1, 15),
        Issuing_Entity__c = 'State Medical Board',
        Status__c = 'Issued',
        Type__c = 'Medical',
        Description__c =
            '<p>Continuing medical education: 25 hours completed this cycle. DEA registration on file.</p>'
    )
};

insert rows;
System.debug('Inserted ' + rows.size() + ' licenses for Lauren Bailey');
