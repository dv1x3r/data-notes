foreach(var ds in Model.DataSources.OfType<ProviderDataSource>())
    ds.ConnectionString = "Placeholder";

foreach(var role in Model.Roles)
{
    // Find all Azure AD role members where MemberID is assigned:
    var orgMembers = role.Members.OfType<ExternalModelRoleMember>()
        .Where(m => m.IdentityProvider == "AzureAD" && !string.IsNullOrEmpty(m.MemberID)).ToList();
        
    // Delete the member and recreate it without assigning MemberID:
    foreach(var orgMember in orgMembers)
    {
        orgMember.Delete();
        role.AddExternalMember(orgMember.MemberName);
    }
}