var context = $evaluation.context;
var identity = context.identity;
var permission = $evaluation.permission;
var resource = permission.resource;

var resourceOwner = resource.attributes.owner[0];

print('* Resource owner ' + resourceOwner);
print('* Identity id ' + identity.id);

if (resourceOwner == identity.id) {
    $evaluation.grant();
}
