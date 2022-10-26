// Created by TopSail Group EU
// Description https://www.elegantbi.com/post/descriptions

#r "System.IO"

using System.IO;

//var filePath = @"C:\Users\dx\Downloads\TabularDescriptions.csv";
var filePath = @"TabularMetadata\TabularDescriptions.csv";
var sb = new System.Text.StringBuilder();
var modelName = Model.Description;

Func<string, string> csvEscaper = x => x.Replace("\n", " ").Replace("\r", " ").Replace("\"", "\"\"");
Func<List<string>, string> csvRowString = x => "\"" + String.Join("\";\"", x.ToArray()) + "\"" + Environment.NewLine;

Directory.CreateDirectory(Path.GetDirectoryName(filePath));
if(!File.Exists(filePath))
{
    var header = "ModelName;TableName;ObjectType;ObjectName;HiddenFlag;Description;DaxExpression" + Environment.NewLine;
    File.WriteAllText(filePath, header);
}

foreach (var t in Model.Tables.Where(a => a.ObjectType.ToString() != "CalculationGroupTable").OrderBy(a => a.Name).ToList())
{
    string tableName = t.Name;
    string tableDesc = t.Description;
    string tableType = t is CalculatedTable ? "Calculated Table" : "Table";
    string tableDax = t is CalculatedTable ? (t as CalculatedTable).Expression : "";
    string tableIsHidden = t.IsHidden ? "Yes" : "No";
    sb.Append(csvRowString(new List<string>{modelName, tableName, tableType, tableName, tableIsHidden, csvEscaper(tableDesc), csvEscaper(tableDax)}));

    foreach (var o in t.Columns.OrderBy(a => a.Name).ToList())
    {
        string objName = o.Name;
        string objDesc = o.Description;
        string objType = o is CalculatedColumn ? "Calculated Column" : "Column";
        string objDax = o is CalculatedColumn ? (o as CalculatedColumn).Expression : "";
        string objIsHidden = o.IsHidden ? "Yes" : "No";
        sb.Append(csvRowString(new List<string>{modelName, tableName, objType, objName, objIsHidden, csvEscaper(objDesc), csvEscaper(objDax)}));
    }
    
    foreach (var o in t.Measures.OrderBy(a => a.Name).ToList())
    {
        string objName = o.Name;
        string objDesc = o.Description;
        string objType = "Measure";
        string objDax = o.Expression;
        string objIsHidden = o.IsHidden ? "Yes" : "No";
        sb.Append(csvRowString(new List<string>{modelName, tableName, objType, objName, objIsHidden, csvEscaper(objDesc), csvEscaper(objDax)}));
    }
    
    foreach (var o in t.Hierarchies.OrderBy(a => a.Name).ToList())
    {
        string objName = o.Name;
        string objDesc = o.Description;
        string objType = "Hierarchy";
        string objDax = "";
        string objIsHidden = o.IsHidden ? "Yes" : "No";
        sb.Append(csvRowString(new List<string>{modelName, tableName, objType, objName, objIsHidden, csvEscaper(objDesc), csvEscaper(objDax)}));
    }
}

foreach (var o in Model.CalculationGroups.OrderBy(a => a.Name).ToList())
{
    string tableName = o.Name;
    string tableDesc = o.Description;
    string tableType = "Calculation Group";
    string tableDax = "";
    string tableIsHidden = o.IsHidden ? "Yes" : "No";
    sb.Append(csvRowString(new List<string>{modelName, tableName, tableType, tableName, tableIsHidden, csvEscaper(tableDesc), csvEscaper(tableDax)}));
    
    foreach (var i in o.CalculationItems.ToList())
    {        
        string objName = i.Name;
        string objDesc = i.Description;
        string objType = "Calculation Item";
        string objDax = i.Expression;
        string objIsHidden = "No";
        sb.Append(csvRowString(new List<string>{modelName, tableName, objType, objName, objIsHidden, csvEscaper(objDesc), csvEscaper(objDax)}));
    }
}

// Save to text file SaveFile(filePath, sb.ToString());
File.AppendAllText(filePath, sb.ToString());
