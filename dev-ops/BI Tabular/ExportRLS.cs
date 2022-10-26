// Created by TopSail Group EU

#r "System.IO"

using System.IO;

//var filePath = @"C:\Users\dx\Downloads\TabularRLS.csv";
var filePath = @"TabularMetadata\TabularRLS.csv";
var sb = new System.Text.StringBuilder();
var modelName = Model.Description;

Func<string, string> csvEscaper = x => x.Replace("\n", " ").Replace("\r", " ").Replace("\"", "\"\"");
Func<List<string>, string> csvRowString = x => "\"" + String.Join("\";\"", x.ToArray()) + "\"" + Environment.NewLine;

Directory.CreateDirectory(Path.GetDirectoryName(filePath));
if(!File.Exists(filePath))
{
    var header = "ModelName;RoleName;TableName;TableRLS" + Environment.NewLine;
    File.WriteAllText(filePath, header);
}

foreach(ModelRole role in Model.Roles)
{
    string roleName = role.Name;
    
    if(role.RowLevelSecurity.Summary.StartsWith("RLS enabled on 0"))
    {
        sb.Append(csvRowString(new List<string>{modelName, roleName, "Full Access", "Full Access"}));
    }
    else
    {
        foreach(var tableName in role.RowLevelSecurity.Keys)
        {
            string tableRLS = role.RowLevelSecurity[tableName];
            if(!string.IsNullOrEmpty(tableRLS))
            {
                sb.Append(csvRowString(new List<string>{modelName, roleName, tableName, csvEscaper(tableRLS)}));
            }
        }
    }
}

// Save to text file SaveFile(filePath, sb.ToString());
File.AppendAllText(filePath, sb.ToString());
