# DOF Custom Objects for CC2026

Custom Salesforce objects for the **Department of Future (DOF)** built as part of the CC2026 project. This SFDX project contains 4 custom objects designed to manage core government finance operations including licensing, taxation, utility billing, and vital records. (b.murphy@cc2026)

<img width="1781" height="814" alt="image" src="https://github.com/user-attachments/assets/1aa6cf2e-3e7e-4c4f-b22f-decf8a65d0ba" />


---

## Custom Objects

### 1. License (`DOF_License__c`)

Tracks the various types of licenses issued and managed by the Department of Finance.

- **Auto-Number:** LIC-{00000}
- **Sharing Model:** Private

| Field | Type | Description |
|---|---|---|
| Type__c | Picklist | License type (Boating, Business, Commercial Vehicle, Cosmetology, Driver, Fiduciary, Fishing, Hunting, Liquor, Medical, Motorcycle, Professional, Real Estate, Teaching) |
| Status__c | Picklist | License status (Active, Inactive, Pending, Requested, Issued, Forfeited) |
| Contact__c | Lookup (Contact) | Associated contact record |
| Date_Issued__c | Date | Date the license was issued |
| Expiration_Date__c | Date | License expiration date |
| Issuing_Entity__c | Text | Entity that issued the license |
| Description__c | Text | Additional details |

---

### 2. Tax (`DOF_Tax__c`)

Manages tax records and filings for individuals and businesses.

- **Auto-Number:** TAX-{00000}
- **Sharing Model:** Private

| Field | Type | Description |
|---|---|---|
| Type__c | Picklist | Tax type (Federal Income Tax, State Income Tax, Business Tax, Property Tax, Estate Tax, Sales Tax) |
| Status__c | Picklist | Filing status (Active, Inactive, Pending, Requested, Issued, Forfeited) |
| Contact__c | Lookup (Contact) | Associated contact record |
| Amount_Due__c | Currency | Total amount owed |
| Amount_Paid__c | Currency | Amount already paid |
| Due_Date__c | Date | Payment due date |
| Transaction_Date__c | Date | Date of the tax transaction |
| Issuing_Entity__c | Text | Entity responsible for the tax |
| Description__c | Text | Additional details |

---

### 3. Utility Bill (`DOF_Utility_Bill__c`)

Tracks utility bills and payment status for government oversight and verification.

- **Auto-Number:** UTL-{00000}
- **Sharing Model:** Private

| Field | Type | Description |
|---|---|---|
| Type__c | Picklist | Utility type |
| Status__c | Picklist | Bill status |
| Account_Type__c | Picklist | Account classification (Residential, Commercial, Industrial, Government) |
| Contact__c | Lookup (Contact) | Associated contact record |
| Organization__c | Lookup | Associated organization |
| Account_Number__c | Text | Utility account number |
| Amount__c | Currency | Total bill amount |
| Amount_Outstanding__c | Currency | Remaining balance |
| Amount_Paid__c | Currency | Amount already paid |
| Due_Date__c | Date | Payment due date |
| Comments__c | Text | Additional notes |

---

### 4. Vital Record (`DOF_Vital_Record__c`)

Maintains vital records for government documentation and tracking.

- **Auto-Number:** VR-{00000}
- **Sharing Model:** Private

| Field | Type | Description |
|---|---|---|
| Type__c | Picklist | Record type (Birth Certificate, Death Certificate, Establishment of Paternity, Marriage Certificate, Other) |
| Status__c | Picklist | Record status |
| Contact__c | Lookup (Contact) | Associated contact record |
| Date_Issued__c | Date | Date the record was issued |
| Issuing_Entity__c | Text | Entity that issued the record |
| Description__c | Text | Additional details |

---

## Common Characteristics

All four objects share the following traits:

- **Private sharing model** for data security
- **Deployed** status
- **Bulk API** support
- **Reports**, **Search**, **Activities**, and **Streaming API** enabled
- `Contact__c` lookup with `SetNull` delete constraint
- Standard `Type__c` and `Status__c` picklists for classification

---

## Project Structure

```
force-app/
└── main/
    └── default/
        └── objects/
            ├── DOF_License__c/
            ├── DOF_Tax__c/
            ├── DOF_Utility_Bill__c/
            └── DOF_Vital_Record__c/
```

---

## Deployment

Deploy to a Salesforce org using the SF CLI:

```bash
sf project deploy start --source-dir force-app
```

Or target a specific org:

```bash
sf project deploy start --source-dir force-app --target-org <org-alias>
```
