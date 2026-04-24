// Seeds 10 DOF_Tax__c records for 10 distinct contacts (run once per org).
List<Contact> contacts = [SELECT Id, Name FROM Contact ORDER BY Name LIMIT 10];
if (contacts.size() < 10) {
    throw new IllegalArgumentException('Need at least 10 contacts; found ' + contacts.size());
}

List<String> types = new List<String>{
    'Federal_Income_Tax',
    'State_Income_Tax',
    'Business_Tax',
    'Property_Tax',
    'Estate_Tax',
    'Sales_Tax'
};
List<String> statuses = new List<String>{ 'Open', 'Pending', 'Paid', 'Closed' };
List<String> entities = new List<String>{
    'IRS',
    'California FTB',
    'City of Austin',
    'Cook County Assessor',
    'NYS Dept of Taxation',
    'Texas Comptroller',
    'SF Treasurer',
    'MA DOR',
    'WA Dept of Revenue',
    'NYC Dept of Finance'
};

List<DOF_Tax__c> taxes = new List<DOF_Tax__c>();
Integer i = 0;
for (Contact c : contacts) {
    Decimal due = (Decimal.valueOf(Math.round(Math.random() * 5000000)) / 100).setScale(2);
    Decimal paid = (due * Decimal.valueOf(Math.random())).setScale(2, System.RoundingMode.HALF_UP);
    Integer typeIdx = Math.mod(
        (Integer) Math.floor(Math.random() * types.size()),
        types.size()
    );
    Integer statIdx = Math.mod(
        (Integer) Math.floor(Math.random() * statuses.size()),
        statuses.size()
    );
    Integer txnOffset = -1 * (Integer) Math.floor(Math.random() * 400);
    Integer dueOffset = txnOffset + 30 + (Integer) Math.floor(Math.random() * 120);

    taxes.add(
        new DOF_Tax__c(
            Contact__c = c.Id,
            Amount_Due__c = due,
            Amount_Paid__c = paid,
            Transaction_Date__c = Date.today().addDays(txnOffset),
            Due_Date__c = Date.today().addDays(dueOffset),
            Type__c = types[typeIdx],
            Status__c = statuses[statIdx],
            Issuing_Entity__c = entities[Math.mod(i, entities.size())],
            Description__c =
                '<p>Sample tax record for <b>'
                    + c.Name
                    + '</b>. Reference quarter Q'
                    + String.valueOf(Math.mod(i, 4) + 1)
                    + ' — auto-seeded for testing.</p>'
        )
    );
    i++;
}

insert taxes;
System.debug('Inserted ' + taxes.size() + ' DOF_Tax__c records');
