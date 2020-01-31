Map<String, Schema.SObjectType> m         = Schema.getGlobalDescribe();
Schema.SObjectType s                      = m.get('Account');
Schema.DescribeSObjectResult r            = s.getDescribe();
Map<String,Schema.SObjectField> fields    = r.fields.getMap();

for (String field : fields.keyset()) {
    Schema.DescribeFieldResult describeResult = fields.get(field).getDescribe();
    if (describeResult.isCreateable() && !describeResult.isNillable() && !describeResult.isDefaultedOnCreate()) {
        System.debug(field);
    }
}