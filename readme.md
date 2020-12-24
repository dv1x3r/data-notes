# Data Scientist 2020-2021

## Jupyter Shortcuts

| Command Mode (press Esc to enable)                                                       | Edit Mode (press Enter to enable)      |
| ---------------------------------------------------------------------------------------- | -------------------------------------- |
| F: find and replace                                                                      | Tab: code completion or indent         |
| Ctrl-Shift-P: open the command palette                                                   | Shift-Tab: tooltip                     |
| Enter: enter edit mode                                                                   | Ctrl-]: indent                         |
| Shift-Enter: run cell, select below                                                      | Ctrl-[: dedent                         |
| Ctrl-Enter: run selected cells                                                           | Ctrl-A: select all                     |
| Alt-Enter: run cell, insert below                                                        | Ctrl-Z: undo                           |
| Y: to code                                                                               | Ctrl-Shift-Z: redo                     |
| M: to markdown                                                                           | Ctrl-Y: redo                           |
| R: to raw                                                                                | Ctrl-Home: go to cell start            |
| 1: to heading 1                                                                          | Ctrl-Up: go to cell start              |
| 2: to heading 2                                                                          | Ctrl-End: go to cell end               |
| 3: to heading 3                                                                          | Ctrl-Down: go to cell end              |
| 4: to heading 4                                                                          | Ctrl-Left: go one word left            |
| 5: to heading 5                                                                          | Ctrl-Right: go one word right          |
| 6: to heading 6                                                                          | Ctrl-Backspace: delete word before     |
| K: select cell above                                                                     | Ctrl-Delete: delete word after         |
| Up: select cell above                                                                    | Ctrl-M: command mode                   |
| Down: select cell below                                                                  | Ctrl-Shift-P: open the command palette |
| J: select cell below                                                                     | Esc: command mode                      |
| Shift-K: extend selected cells above                                                     | Shift-Enter: run cell, select below    |
| Shift-Up: extend selected cells above                                                    | Ctrl-Enter: run selected cells         |
| Shift-Down: extend selected cells below                                                  | Alt-Enter: run cell, insert below      |
| Shift-J: extend selected cells below                                                     | Ctrl-Shift-Minus: split cell           |
| A: insert cell above                                                                     | Ctrl-S: Save and Checkpoint            |
| B: insert cell below                                                                     | Down: move cursor down                 |
| X: cut selected cells                                                                    | Up: move cursor up                     |
| C: copy selected cells                                                                   |
| Shift-V: paste cells above                                                               |
| V: paste cells below                                                                     |
| Z: undo cell deletion                                                                    |
| D,D: delete selected cells                                                               |
| Shift-M: merge selected cells, or current cell with cell below if only one cell selected |
| Ctrl-S: Save and Checkpoint                                                              |
| S: Save and Checkpoint                                                                   |
| L: toggle line numbers                                                                   |
| O: toggle output of selected cells                                                       |
| Shift-O: toggle output scrolling of selected cells                                       |
| H: show keyboard shortcuts                                                               |
| I,I: interrupt kernel                                                                    |
| 0,0: restart the kernel (with dialog)                                                    |
| Esc: close the pager                                                                     |
| Q: close the pager                                                                       |
| Shift-Space: scroll notebook up                                                          |
| Space: scroll notebook down                                                              |

<br><hr><br>

## Cleaning and Preparing

| Description                                                      | Syntax                               |
| ---------------------------------------------------------------- | ------------------------------------ |
| Replace substring within a string                                | <string\>.replace(substring, string) |
| Convert to title cases (capitalize every letter after every dot) | <string\>.title()                    |
| Check a string for the existence of a substring                  | if <substring\> in <string\>         |
| Split a string into a list of strings                            | <string\>.split(separator)           |
| Slice characters from a string by position                       | <string\>[:5\]                       |

<br><hr><br>

## Basis

| Description                                                             | Syntax                         |
| ----------------------------------------------------------------------- | ------------------------------ |
| Insert values into a string in order                                    | "{} {}".format(value, value)   |
| Insert values into a string by position                                 | "{0} {1}".format(value, value) |
| Insert values into a string by name                                     | "{name}".format(name="value")  |
| Format specification for precision of two decimal places                | "{:.2f}".format(float)         |
| Order for format specification when using precision and comma separator | "{:,.2f}".format(float)        |

<br><hr><br>

## Object-Oriented

``` python
class MyClass():
	def __init__(self, param_1):
		self.attribute_1 = param_1
	def add_20(self):
		self.attribute_1 += 20

mc = MyClass(10)
mc.add_20()
print(mc.attribute_1)
```

<br><hr><br>

## Importing

| Description                            | Syntax                         |
| -------------------------------------- | ------------------------------ |
| Importing a whole module               | import csv                     |
| Importing a whole module with an alias | import csv as c                |
| Importing a single definition          | from csv import reader         |
| Importing multiple definitions         | from csv import reader, writer |
| Importing all definitions              | from csv import *              |
| Reimport a module                      | pd = importlib.reload(pandas)  |

<br><hr><br>

## String functions

capitalize, count, startswith, endswith, find, format, lower, upper, lstrip, rstrip, strip, replace, split, swapcase, title, zfill

<br><hr><br>

## Dates and Times

| Description                        | Syntax                                                     |
| ---------------------------------- | ---------------------------------------------------------- |
| Import module                      | import datetime as dt                                      |
| Instantiating dt.datetime          | dt.datetime(year, month, day)                              |
| Creating dt.datetime from a string | dt.datetime.strptime("day/month/year", "%d/%m/%Y")         |
| Converting dt.datetime to a string | dt_object.strftime("%d/%m/%Y")                             |
| Instantiating a dt.time            | dt.time(hour=int, minute=int, second=int, microsecond=int) |
| Retrieving a part of a date        | dt_object.day                                              |
| Retrieving a date                  | dt_object.date()                                           |
| Instantiating a dt.timedelta       | dt.timedelta(weeks=3)                                      |

<br>

### dt.strptime formats

| Format | Description                                |
| ------ | ------------------------------------------ |
| %d     | Day of the month as a zero-padded number   |
| %A     | Day of the week as a word                  |
| %m     | Month as a zero-padded number              |
| %Y     | Year as four-digit number                  |
| %y     | Year as two-digit number with zero-padding |
| %B     | Month as a word                            |
| %H     | Hour in 24 hour time as zero-padded number |
| %p     | a.m. or p.m.                               |
| %I     | Hour in 12 hour time as zero-padded number |
| %M     | Minute as a zero-padded number             |

<br>

### Operations

| Operation             | Type      |
| --------------------- | --------- |
| datetime - datetime   | timedelta |
| datetime - timedelta  | datetime  |
| datetime + timedelta  | datetime  |
| timedelta + timedelta | timedelta |
| timedelta - timedelta | timedelta |

<br><hr><br>

## NumPy

| Description                               | Syntax                                      |
| ----------------------------------------- | ------------------------------------------- |
| Import module                             | import numpy as np                          |
| Convert a list of lists into a ndarray    | np.array(list(csv.reader(open(file, "r")))) |
| Selecting a row from an ndarray           | ndarr[1\]                                   |
| Selecting multiple rows from an ndarray   | ndarr[1:\]                                  |
| Selecting a specific item from an ndarray | ndarr[1,1\]                                 |
| Selecting multiple columns                | ndarr[:,1:3\] \| ndarr[:, [1,2\]\]          |
| Selecting a 2D slice                      | ndarr[1:4,:3\]                              |

<br>

### 1-D statistics

* Vector math: + - * /
* ndarray.min()
* ndarray.max()
* ndarray.mean()
* ndarray.sum()

<br><hr><br>

## Boolean Indexing

| Description                                      | Syntax                                                                 |
| ------------------------------------------------ | ---------------------------------------------------------------------- |
| Reading in a CSV file                            | np.genfromtxt('.csv', delimiter=',', skip_header=1)                    |
| Creating a Boolean array from filtering criteria | np.array([2,4,6,8\]) < 5                                               |
| Boolean filtering for 1D ndarray                 | a = np.array([2,4,6,8\]) \| a[a < 5\]                                  |
| Boolean filtering for 2D ndarray                 | ndarr[ndarr[:,12\] > 50\]                                              |
| Assigning values in a 2D ndarray using indices   | ndarr[1,1\] = 1 \| ndarr[:,0\] = 1 \| ndarr[:,7\] = ndarr[:,7\].mean() |
| Assigning values using Boolean arrays            | ndarr[ndarr[:,5\] == 2, 15\] = 1                                       |

<br><hr><br>

## Pandas

| Description                             | Syntax                                                                            |
| --------------------------------------- | --------------------------------------------------------------------------------- |
| Import module                           | import pandas as pd                                                               |
| Reading a file into a dataframe         | pd.read_csv('.csv', index_col=0, encoding='') \| Latin-1 \| UTF-8 \| Windows-1251 |
| Reading a JSON into a dataframe         | pd.read_json()                                                                    |
| Exporting data                          | df.to_csv('.csv', index=False)                                                    |
| Dataframe object info                   | df.info(memory_usage='deep')                                                      |
| Describing a dataframe/series object    | df.describe(include='all') \| s.describe()                                        |
| Returning a dataframe/series data types | df.dtypes \| s.dtype()                                                            |
| Returning the dimensions of a dataframe | dt.shape                                                                          |
| Create dataframe/series                 | pd.DataFrame({'col': []}) \| pd.Series([])                                        |
| Series to dataframe                     | s.to_frame('col')                                                                 |
| Serios to list                          | s.tolist()                                                                        |

<br>

### Pandas select values

| Description                      | Syntax                                   |
| -------------------------------- | ---------------------------------------- |
| Selecting the first n rows       | df.head(5)                               |
| Selecting a single column        | df['col'\]                               |
| Selecting multiple columns       | df[['col', 'col2'\]\]                    |
| Shorthand Convention for columns | df['col'\] \| df[['col', 'col2'\]\]      |
| Shorthand Convention for rows    | df['row':'row3'\]                        |
| Selecting rows by label          | df.loc[<row_labels\>, [column_labels\]\] |
| Selecting rows by index          | df.iloc[<row_index\>, [column_index\]\]  |

<br>

### Pandas column operations

| Description                                | Syntax                                                     |
| ------------------------------------------ | ---------------------------------------------------------- |
| Unique value counts for a dataframe/series | s.unique() \| s.value_counts(dropna=False)                 |
| Selecting null and non-null values         | s.isnull() \| s.notnull()                                  |
| Selecting null rows                        | df.isnull().any(axis=1)                                    |
| Renaming an existing column                | df.rename(columns={'src_name': 'dest_name'}, inplace=True) |
| Dropping an existing column                | df.drop(columns=['src_name'\], inplace=True)               |
| Dropping missing values                    | df.dropna(axis=0, thresh=number_of_records, inplace=True)  |
| Show duplicated rows                       | df.duplicated(cols)                                        |
| Drop duplicated rows                       | df.drop_duplicates(cols)                                   |
| Fill missing values                        | s.fillna(value)                                            |

<br>

### Pandas boolean stuff

| Description                             | Syntax                                 |
| --------------------------------------- | -------------------------------------- |
| In operator                             | df['col'\].isin(['val1', 'val2'\])     |
| Between method                          | df['col'\].between(val1, val2)         |
| Updating values using Boolean filtering | s.loc[s['col'\] == 0, 'col'\] = np.nan |
| Updating values using a Mapping dict    | s.map({ 'src_name': 'dest_name' })     |
| Updating values using mask method       | s.mask(bool_mask, new_values)          |

<br>

### Pandas sorting and converting

| Description                     | Syntax                         |
| ------------------------------- | ------------------------------ |
| Sorting by index column         | df.sort_index(ascending=False) |
| Sorting by column values        | s.sort_values()                |
| Converting column to datetime   | pd.to_datetime(series)         |
| Converting column to float/int  | s.astype(float/int)            |
| Stack multiple columns into one | df.stack(dropna=False)         |

<br>

### Pandas accessors

| Description                                 | Syntax                 |
| ------------------------------------------- | ---------------------- |
| Multi-dimensional numpy array               | df.values              |
| Access datetime values in series            | s.dt \| s.dt.year      |
| Replace substring                           | s.str.replace('"', '') |
| Extracting values from strings (first word) | s.str.split().str[0\]  |

<br>

### Pandas aggregation and cleaning

| Description           | Syntax                                                                          |
| --------------------- | ------------------------------------------------------------------------------- |
| Grouping              | df.groupby('col')                                                               |
| Group indexing        | gr['col'\]                                                                      |
| Select group data     | gr.get_group('value')                                                           |
| Groups and indexes    | gr.groups                                                                       |
| Aggregations          | gr.size() \| mean, sum, count, min, max                                         |
| Multiple aggregations | gr.agg(functions_list)                                                          |
| Aggregate             | df.pivot_table(values=val_cols, index=gr_cols, aggfunc=functions, margins=True) |

<br>

### Pandas combining

| Description           | Syntax                                                                                                                   |
| --------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| Union                 | pd.concat(df_list, axis, ignore_index=True) \| df.append()                                                               |
| Merge join            | df or pd.merge(left=df1, right=df2, how='inner', on='col', suffixes=('_x', '_y'), left_index = True, right_index = True) |
| Merge join on indices | df.join()                                                                                                                |

<br>

### Pandas transforming

| Description                                                       | Syntax                                                                   |
| ----------------------------------------------------------------- | ------------------------------------------------------------------------ |
| Apply function for each row in Series                             | s.map(func/dict)                                                         |
| Apply function - Series: for each row, DataFrame: for each column | s.apply(func, args) \| df.apply(func, args) \| df.apply(pd.value_counts) |
| Apply function to every cell in the DataFrame                     | df.applymap(func)                                                        |
| Unpivot                                                           | df.melt(id_vars=cols, value_vars=cols) \| pd.melt()                      |
| Pivot                                                             | df.pivot(columns=cols, values=cols)                                      |

<br>

### Pandas casting

* pd.to_numeric(series, errors="coerce")

<br>

### Pandas plots

* df.plot(x='col', y='col', kind='scatter', c='color', label='', title='', figsize=(,), ax=ax1, xlim=(,), ylim=(,), rot=30)
* df.plot.bar(x=, y=, color=)
* df.hist(bins=, range=(,))
* df.box(x='col', y='col')
* scatter_matrix(cols, figsize(,)) \| from pandas.plotting import scatter_matrix

<br><hr><br>

## Matplotlib

| Description        | Syntax                                                                              |
| ------------------ | ----------------------------------------------------------------------------------- |
| Import module      | import matplotlib.pyplot as plt                                                     |
| Jupyter inline     | %matplotlib inline                                                                  |
| Show plot          | plt.show()                                                                          |
| Save plot          | plt.savefig('file') \| fig.savefig('file')                                          |
| Rotate axis ticks  | plt.xticks(rotation=90)                                                             |
| Disable axis ticks | ax.tick_params(bottom='off', top='off', left='off', right='off', labelbottom='off') |
| Disable spines     | ax.spines['side'\].set_visible(False) \| right, bottom, top, left                   |
| Add axis labels    | plt.xlabel('') \| plt.ylabel('')                                                    |
| Add plot label     | plt.title('')                                                                       |
| Add legend labels  | plt.legend(loc='upper left')                                                        |
| Add axis text      | ax.text(x, y, text)                                                                 |

<br>

### Matplotlib figures

| Description                 | Syntax                                                        |
| --------------------------- | ------------------------------------------------------------- |
| Create figure               | fig = plt.figure(figsize=(width_dpi, height_dpi))             |
| Add plot to the figure      | ax = fig.add_subplot(nrows, ncols, plot_number)               |
| Create figure and subplots  | fig, ax = plt.subplots(nrows, ncols, figsize=(width, height)) |
| Set subplot title           | ax.set_title('')                                              |
| Set subplot tick positions  | ax.set_xticks(label_positions)                                |
| Set subplot tick labels     | ax.set_xticklabels(labels, rotation=90)                       |
| Set subplot ranges          | ax.set_xlim(min, max)                                         |
| Set subplot horizontal line | ax.axhline(y, c='color', alpha=1)                             |

<br>

### Matplotlib charts

| Description         | Syntax                                                         |
| ------------------- | -------------------------------------------------------------- |
| Line chart          | plt.plot(x_values, y_values, c='color', label='', linewidth=3) |
| Bar plot            | plt.bar(bar_positions, bar_heights, [bar_width\])              |
| Horizontal bar plot | plt.barh(bar_positions, bar_widths, [bar_height\])             |
| Scatter plot        | plt.scatter(x, y)                                              |
| Histogram           | plt.hist(y_values, bins=int, range=(min, max))                 |
| Box plot            | plt.boxplot(values)                                            |

<br><hr><br>

## Seaborn

| Description         | Syntax                                                                   |
| ------------------- | ------------------------------------------------------------------------ |
| Import module       | import seaborn as sns                                                    |
| Set style           | sns.set_style('darkgrid' \| 'whitegrid' \| 'dark' \| 'white' \| 'ticks') |
| Remove spines       | sns.despine(left=True, bottom=True)                                      |
| Add legend          | sns.add_legend()                                                         |
| Histogram \w KDE    | sns.distplot(y_values)                                                   |
| Kernel Density Plot | sns.kdeplot(y_values, shade=True)                                        |
| Small multiple      | g = sns.FacetGrid(df, col='col1', row='col2', hue='col3', size=height)   |
| Fill small multiple | g.map(sns.kdeplot, 'y_col', shade=True)                                  |
| Heatmap             | sns.heatmap(data, cbar=False, yticklabels=False)                         |

<br><hr><br>

## List Comprehensions and Lambda Functions

| Description           | Syntax                                                                                           |
| --------------------- | ------------------------------------------------------------------------------------------------ |
| Import module         | import json                                                                                      |
| Json string to Object | json.loads('json')                                                                               |
| Json file to Object   | json.load(open('path'))                                                                          |
| Object to Json string | json.dumps(obj, sort_keys=True, indent=4)                                                        |
| Dictionary keys       | obj.keys()                                                                                       |
| Delete key            | del obj[key\]                                                                                    |
| List comprehension    | [i * 10 for i in [0,1,2,3,4,5\] if i > 0\]                                                       |
| Functions on Objects  | min\|max\|sorted(obj, key=function, reverse=True) \| one argument function extracts scalar value |
| Lambda function       | f = lambda x, y: x * y                                                                           |
| Ternary operator      | return <val\> if <expression\> else None                                                         |

<br><hr><br>

## Regex [regexr.com](https://regexr.com/)

| Description                      | Syntax                                                                  |
| -------------------------------- | ----------------------------------------------------------------------- |
| Python module                    | import re \| re.search(pattern, string) \| re.findall(patttern, string) |
| Regex pattern check              | s.str.contains(r'', na=False, flags=re.IGNORECASE) \| IGNORECASE = I    |
| Regex pattern extract            | s.str.extract(r'', expand=True, flags) \| expand returns df             |
| Regex pattern replace            | s.str.replace(r'', replace, flags)                                      |
| Regex all patterns extract       | s.str.extractall(r'')                                                   |
| Raw expression (prevents \\)     | r''                                                                     |
| Escape                           | \                                                                       |
| _                                |
| <b>Character classes</b>         |
| .                                | any character except newline                                            |
| \w \d \s                         | word, digit, whitespace                                                 |
| \W \D \S                         | not word, digit, whitespace                                             |
| [abc\]                           | any of a, b, or c                                                       |
| [^abc\]                          | not a, b, or c                                                          |
| [a-g\]                           | character between a & g                                                 |
| _                                |
| <b>Anchors</b>                   |
| ^abc$                            | start / end of the string                                               |
| \b \B                            | word, not-word boundary                                                 |
| _                                |
| <b>Escaped characters</b>        |
| \. \* \\\                        | escaped special characters                                              |
| \\t \\n \\r                      | tab, linefeed, carriage return                                          |
| _                                |
| <b>Groups & Lookaround</b>       |
| (abc)                            | capture group                                                           |
| (?P<name\>abc)                   | named capture group                                                     |
| \1                               | backreference to group #1                                               |
| (?:abc)                          | non-capturing group                                                     |
| (?=abc)                          | positive lookahead (is followed by abc)                                 |
| (?!abc)                          | negative lookahead (is not followed by abc)                             |
| (?<=abc)                         | positive lookahead (is preceded by abc)                                 |
| (?<!abc)                         | negative lookahead (is not preceded by abc)                             |
| _                                |
| <b>Quantifiers & Alternation</b> |
| a* a+ a?                         | 0 or more, 1 or more, 0 or 1                                            |
| a{5} a{2,}                       | exactly five, two or more                                               |
| a{1,3}                           | between one & three                                                     |
| a+? a{2,}?                       | match as few as possible                                                |
| ab\|cd                           | match ab or cd                                                          |

<br><hr><br>

## Stuff

### Cool Data Science terms

* Correlation: attributes relations [-1, 1\]
* Charjunk, Data-ink ratio: [effective data visualization](https://www.darkhorseanalytics.com/blog/data-looks-better-naked)
* The Tableau Data Color RGB Values: [Color Blind 10](http://tableaufriction.blogspot.com/2012/11/finally-you-can-use-tableau-data-colors.html)
* Kernel density estimation (KDE): better histogram
* Small multiple: series of similar graphs or charts using the same scale and axes
* Tidy data: each variable is a column, each observation is a row, and each type of observational unit is a table
* Imputation: The technical name for filling in a missing value with a replacement value.

<br>

### Datasets

* [Data.gov](https://www.data.gov/) - A directory of government data downloads
* [/r/datasets](https://reddit.com/r/datasets) - A subreddit that has hundreds of interesting data sets
* [Awesome datasets](https://github.com/caesar0301/awesome-public-datasets) - A list of data sets hosted on GitHub
* [rs.io](http://rs.io/100-interesting-data-sets-for-statistics/) - A great blog post with hundreds of interesting data sets

<br>

### Personal links

[data-to-viz.com: leads you to the most appropriate graph for your data](https://www.data-to-viz.com/)  
[Fourier Transforms With scipy.fft: Python Signal Processing – Real Python](https://realpython.com/python-scipy-fft/)  
[Plot With Pandas: Python Data Visualization for Beginners – Real Python](https://realpython.com/pandas-plot-python/)  
[Async IO in Python: A Complete Walkthrough – Real Python](https://realpython.com/async-io-python/)  
[List Comrehensions (Представление списков RU)](https://webdevblog.ru/kogda-ispolzovat-list-comprehension-v-python/)  

<br><hr><br>

## Command Line (bash)

| Description             | Syntax              | Arguments                                             |
| ----------------------- | ------------------- | ----------------------------------------------------- |
| Current time and date   | date                |                                                       |
| Diff side to side       | diff -y file1 file2 | -q report only if differ, -y side by side             |
| Execute from history    | history, !num, !!   |                                                       |
| Clear screen            | clear               |                                                       |
| Close terminal          | exit                |                                                       |
| Print working directory | pwd                 |                                                       |
| List the contents       | ls                  | -A all, -h size -l list, -p add / to dir              |
| Change directory        | cd                  | ~, .., -                                              |
| Make directory          | mkdir               |                                                       |
| Remove empty directory  | rmdir               |                                                       |
| Copy                    | cp                  | -i interactive, -r recursive                          |
| Remove                  | rm                  | -i interactive, -r recursive                          |
| Move                    | mv                  | -i interactive                                        |
| Find                    | find                | [location\] -name ['filename'\] -iname ['icasename'\] |

<br>

### Glob Patterns and Wildcards
\*, ?, [a-z\], [ranges and expressions](https://www.gnu.org/software/grep/manual/html_node/Character-Classes-and-Bracket-Expressions.html)
