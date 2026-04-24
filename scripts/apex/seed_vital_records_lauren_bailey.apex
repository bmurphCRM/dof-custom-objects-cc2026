// Three DOF_Vital_Record__c rows for Lauren Bailey: birth, marriage, paternity
Id contactId = [
    SELECT Id
    FROM Contact
    WHERE Name = 'Lauren Bailey'
    LIMIT 1
]
.Id;

List<DOF_Vital_Record__c> rows = new List<DOF_Vital_Record__c>{
    new DOF_Vital_Record__c(
        Contact__c = contactId,
        Type__c = 'Birth_Certificate',
        Status__c = 'Issued',
        Date_Issued__c = Date.newInstance(1992, 6, 14),
        Issuing_Entity__c = 'County Clerk — Vital Records Division',
        Description__c =
            '<p>Certified copy on file. Registered at county of birth; amended footnote none.</p>'
    ),
    new DOF_Vital_Record__c(
        Contact__c = contactId,
        Type__c = 'Marriage_Certificate',
        Status__c = 'Active',
        Date_Issued__c = Date.newInstance(2018, 9, 22),
        Issuing_Entity__c = 'State Registrar of Vital Statistics',
        Description__c =
            '<p>Marriage recorded in issuing jurisdiction; license number on file with county.</p>'
    ),
    new DOF_Vital_Record__c(
        Contact__c = contactId,
        Type__c = 'Establishment_of_Paternity',
        Status__c = 'Approved',
        Date_Issued__c = Date.newInstance(2020, 3, 5),
        Issuing_Entity__c = 'Family Court — Juvenile & Domestic Relations',
        Description__c =
            '<p>Order establishing paternity entered; genetic testing referenced in docket.</p>'
    )
};

insert rows;
System.debug('Inserted ' + rows.size() + ' vital records for Lauren Bailey');
