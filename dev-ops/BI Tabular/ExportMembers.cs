// Created by TopSail Group EU

#r "System.IO"

using System.IO;

//var filePath = @"C:\Users\dx\Downloads\TabularMembers.csv";
var filePath = @"TabularMetadata\TabularMembers.csv";
var sb = new System.Text.StringBuilder();
var modelName = Model.Description;

Func<string, string> csvEscaper = x => x.Replace("\n", " ").Replace("\r", " ").Replace("\"", "\"\"");
Func<List<string>, string> csvRowString = x => "\"" + String.Join("\";\"", x.ToArray()) + "\"" + Environment.NewLine;

Directory.CreateDirectory(Path.GetDirectoryName(filePath));
if(!File.Exists(filePath))
{
    var header = "ModelName;RoleName;MemberName" + Environment.NewLine;
    File.WriteAllText(filePath, header);
}

foreach(ModelRole role in Model.Roles)
{
    string roleName = role.Name;
    
    foreach(var member in role.Members)
    {
        string memberName = member.Name;
        sb.Append(csvRowString(new List<string>{modelName, roleName, memberName}));
    }
}

// Save to text file SaveFile(filePath, sb.ToString());
File.AppendAllText(filePath, sb.ToString());
