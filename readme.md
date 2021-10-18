# Data Science, Engineering, Machine Learning

- [Data Science, Engineering, Machine Learning](#data-science-engineering-machine-learning)
  - [Datasets](#datasets)
  - [Shell](#shell)
    - [Command Line with bash](#command-line-with-bash)
    - [Command Line Shortcuts (Hotkeys)](#command-line-shortcuts-hotkeys)
    - [Docker](#docker)
  - [API](#api)
    - [HTTP Request Status Codes](#http-request-status-codes)
    - [API Querying with Python](#api-querying-with-python)
  - [Regex](#regex)
    - [Regexr.com](#regexrcom)
    - [Regex with Python](#regex-with-python)
  - [DAX and MS BI](#dax-and-ms-bi)
  - [Python](#python)
    - [Jupyter Shortcuts (Hotkeys)](#jupyter-shortcuts-hotkeys)
    - [Python Basics](#python-basics)
    - [Object-Oriented](#object-oriented)
    - [asyncio](#asyncio)
    - [venv](#venv)
    - [PyQT5](#pyqt5)
    - [NumPy Arrays](#numpy-arrays)
    - [Pandas Transform and Clean](#pandas-transform-and-clean)
  - [Data Visualization](#data-visualization)
    - [Pandas](#pandas)
    - [Seaborn](#seaborn)
    - [Matplotlib](#matplotlib)
  - [SQL](#sql)
    - [DML Operations](#dml-operations)
    - [DDL Operations](#ddl-operations)
    - [Normalization](#normalization)
    - [SQL with Python](#sql-with-python)
    - [SQLite](#sqlite)
    - [SQLite Shell](#sqlite-shell)
    - [SQLAlchemy](#sqlalchemy)
    - [SQL Server Snippets](#sql-server-snippets)
  - [Business](#business)
    - [Communication](#communication)
    - [Metrics](#metrics)
  - [Probability and Statistics](#probability-and-statistics)
    - [Sampling](#sampling)
    - [Variables](#variables)
    - [Frequency Distributions](#frequency-distributions)
    - [Averages and Variability](#averages-and-variability)
  - [Machine Learning](#machine-learning)
  - [Computer Vision](#computer-vision)

<br><hr><br>

## Datasets

- [Data.gov](https://www.data.gov/) - A directory of government data downloads
- [/r/datasets](https://reddit.com/r/datasets) - A subreddit that has hundreds of interesting data sets
- [Awesome datasets](https://github.com/caesar0301/awesome-public-datasets) - A list of data sets hosted on GitHub
- [rs.io](http://rs.io/100-interesting-data-sets-for-statistics/) - A great blog post with hundreds of interesting data sets

<br>

## Shell

- [Glob Patterns and Wildcards](https://www.gnu.org/software/grep/manual/html_node/Character-Classes-and-Bracket-Expressions.html): *, ?, [a-z\]

<br>

### Command Line with bash

| Bash Basics               | Syntax              | Arguments                                             |
| ------------------------- | ------------------- | ----------------------------------------------------- |
| Current time and date     | date                |                                                       |
| Calendar                  | cal                 |                                                       |
| Diff side to side         | diff -y file1 file2 | -q report only if differ, -y side by side             |
| Execute from history      | history, !num, !!   |                                                       |
| Clear screen              | clear               |                                                       |
| Close terminal            | exit                |                                                       |
| Print working directory   | pwd                 |                                                       |
| List the contents         | ls \| la \| ll      | -A all, -h size -l list, -p add / to dir              |
| Change directory          | cd                  | ~, .., -                                              |
| Make directory            | mkdir               |                                                       |
| Remove empty directory    | rmdir               |                                                       |
| Copy                      | cp                  | -i interactive, -r recursive                          |
| Remove                    | rm                  | -i interactive, -r recursive                          |
| Move                      | mv                  | -i interactive                                        |
| Find                      | find                | [location\] -name ['filename'\] -iname ['icasename'\] |
| Username                  | whoami              |                                                       |
| User info                 | id                  | -un                                                   |
| Groups                    | groups              |                                                       |
| Change mode (permissions) | chmod               | [ugoa\][+-=\][rwx\] files \| 777                      |
| Show file permissions     | stat                |                                                       |
| Run as superuser          | sudo                | -u username                                           |
| Change owner              | chown               | [new_owner\][:new_group\] file...                     |

<br>

| Text Processing                  | Syntax       | Arguments                                                                  |
| -------------------------------- | ------------ | -------------------------------------------------------------------------- |
| Python                           | python       | -c "print(42)"                                                             |
| Command type                     | type         | -p path, -t type                                                           |
| List aliases                     | compgen      | -a                                                                         |
| Create alias                     | alias d=date |                                                                            |
| Delete alias                     | unalias d    |                                                                            |
| Locatae a command                | which        |                                                                            |
| Manual                           | man          |                                                                            |
| First manual line                | whatis       |                                                                            |
| Manual built-in                  | help         |                                                                            |
| Text page reader                 | less         | -S truncate                                                                |
| Print head of files              | head         | -n lines                                                                   |
| Print tail of files              | tail         | -n lines                                                                   |
| Word count (lines, words, bytes) | wc           | -с bytes, -m chars, -l lines, -w words                                     |
| Print as table                   | column       | -s separator, -t table                                                     |
| Shuffle lines                    | shuf         | -n head                                                                    |
| Determine file type              | file         |                                                                            |
| Concatenate and print files      | cat \| tac   |                                                                            |
| Sort and print files             | sort         | -r reverse, -u unique, -t separator, -k range, -g numeric                  |
| Print columns of files           | cut          | -d separator, -f range                                                     |
| Regex finder                     | grep         | -E extended, -h no-filename, -n show-line, -i ignore-case, -v non-matching |
| Print to screen                  | echo         |                                                                            |
| Print formatted to screen        | printf       |                                                                            |
| Create a file                    | touch        |                                                                            |
| Translate (replace symbols)      | tr           |                                                                            |

<br>

| Command Line Flow                   | Syntax      |
| ----------------------------------- | ----------- |
| Redirect stdout (overwrite, append) | >, >>       |
| Redirect stderr (overwrite, append) | 2>, 2>>     |
| Redirect out and err                | > file 2>&1 |
| Redirect stdin                      | <           |
| Pipe left output to right input     | \|          |
| Drop output                         | > /dev/null |
| Current process descriptors         | /proc/$$/fd |

<br>

### Command Line Shortcuts (Hotkeys)

| Command           | PowerShell | bash                          |
| ----------------- | ---------- | ----------------------------- |
| Interrupt         | CTRL + C   | CTRL + C                      |
| EOF               | CTRL + D   | CTRL + D                      |
| Clear             | CTRL + L   | CTRL + L                      |
| Clear input       | ESC        | CTRL + U <br> ESC + Backspace |
| Commander info    | CTRL + Q   | CTRL + X, I                   |
| Commander extract | SHIFT + F2 |                               |

<br>

### Docker

| Command      | Syntax                                                                       |
| ------------ | ---------------------------------------------------------------------------- |
| Compose file | docker-compose [-f docker-compose.dev.yml\] <up, down, start, build, config> |

<br><hr><br>

## API

- [What is OAuth? Definition and How it Works](https://www.varonis.com/blog/what-is-oauth/)
- [Scraping Client Side Rendered Data with Python and Selenium](https://sadesmith.com/2018/06/15/blog/scraping-client-side-rendered-data-with-python-and-selenium)

<br>

### HTTP Request Status Codes

| Status Code | Description       |
| ----------- | ----------------- |
| 200         | OK                |
| 201         | POST OK           |
| 204         | DELETE OK         |
| 301         | Redirect          |
| 400         | Bad request       |
| 401         | Not authenticated |
| 403         | Forbidden         |
| 404         | Not found         |

<br>

### API Querying with Python

| API Basics               | Syntax                                   |
| ------------------------ | ---------------------------------------- |
| Import module            | import requests                          |
| GET Request              | requests.get(url, params={}, headers={}) |
| POST Request             | requests.post(url, json=payload)         |
| PUT/PATCH Request        | requests.patch(url, json=payload)        |
| DELETE Request           | requests.delete(url)                     |
| Status                   | response.status_code                     |
| Content in String        | response.content                         |
| Request/Response in JSON | response.json()                          |
| Content-Type             | response.headers['content-type'\]        |

<br>

| Scrapping Basics             | Syntax                                                  |
| ---------------------------- | ------------------------------------------------------- |
| Import module                | from bs4 import BeautifulSoup                           |
| Initialize the parser        | parser = BeautifulSoup(response_content, 'html.parser') |
| Get the body tag             | parser.body                                             |
| Get the inside text of a tag | parser.head.title.text                                  |
| Find specific tags           | parser.body.find_all('p', id='i', class_='c')           |
| Find all tags by selectors   | parser.body.select('.c')                                |

<br><hr><br>

## Regex

### [Regexr.com](https://regexr.com/)

| Character classes |                              |
| ----------------- | ---------------------------- |
| .                 | any character except newline |
| \w \d \s          | word, digit, whitespace      |
| \W \D \S          | not word, digit, whitespace  |
| [abc\]            | any of a, b, or c            |
| [^abc\]           | not a, b, or c               |
| [a-g\]            | character between a & g      |

<br>

| Anchors |                           |
| ------- | ------------------------- |
| ^abc$   | start / end of the string |
| \b \B   | word, not-word boundary   |

<br>

| Escaped characters |                                |
| ------------------ | ------------------------------ |
| \. \* \\\          | escaped special characters     |
| \\t \\n \\r        | tab, linefeed, carriage return |

<br>

| Groups & Lookaround |                                             |
| ------------------- | ------------------------------------------- |
| (abc)               | capture group                               |
| (?P<name\>abc)      | named capture group                         |
| \1                  | backreference to group #1                   |
| (?:abc)             | non-capturing group                         |
| (?=abc)             | positive lookahead (is followed by abc)     |
| (?!abc)             | negative lookahead (is not followed by abc) |
| (?<=abc)            | positive lookahead (is preceded by abc)     |
| (?<!abc)            | negative lookahead (is not preceded by abc) |

<br>

| Quantifiers & Alternation |                              |
| ------------------------- | ---------------------------- |
| a* a+ a?                  | 0 or more, 1 or more, 0 or 1 |
| a{5} a{2,}                | exactly five, two or more    |
| a{1,3}                    | between one & three          |
| a+? a{2,}?                | match as few as possible     |
| ab\|cd                    | match ab or cd               |

<br>

### Regex with Python

| Description                  | Syntax                                                                  |
| ---------------------------- | ----------------------------------------------------------------------- |
| Python module                | import re \| re.search(pattern, string) \| re.findall(patttern, string) |
| Regex pattern check          | s.str.contains(r'', na=False, flags=re.IGNORECASE) \| IGNORECASE = I    |
| Regex pattern extract        | s.str.extract(r'', expand=True, flags) \| expand returns df             |
| Regex pattern replace        | s.str.replace(r'', replace, flags)                                      |
| Regex all patterns extract   | s.str.extractall(r'')                                                   |
| Raw expression (prevents \\) | r''                                                                     |
| Escape                       | \                                                                       |

<br><hr><br>

## DAX and MS BI

- [SQLBI.com](https://www.sqlbi.com/)
- [DAX Patterns](https://www.daxpatterns.com/patterns/)
- [Kapacity Churn Risk Report in Power BI](https://powerbi.microsoft.com/en-us/partner-showcase/kapacity-a-s-sales-report-demo/)
- [Skateboard Report in Power BI](https://powerbi.tips/product/scrims-msft-skateboard-report-free/)

<br><hr><br>

## Python

- [List Comrehensions (Представление списков RU)](https://webdevblog.ru/kogda-ispolzovat-list-comprehension-v-python/)

<br>

### Jupyter Shortcuts (Hotkeys)

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

<br>

### Python Basics

| Import Modules                         | Syntax                         |
| -------------------------------------- | ------------------------------ |
| Importing a whole module               | import csv                     |
| Importing a whole module with an alias | import csv as c                |
| Importing a single definition          | from csv import reader         |
| Importing multiple definitions         | from csv import reader, writer |
| Importing all definitions              | from csv import *              |
| Reimport a module                      | pd = importlib.reload(pandas)  |

<br>

| String Basics                                                    | Syntax                               |
| ---------------------------------------------------------------- | ------------------------------------ |
| Replace substring within a string                                | <string\>.replace(substring, string) |
| Convert to title cases (capitalize every letter after every dot) | <string\>.title()                    |
| Check a string for the existence of a substring                  | if <substring\> in <string\>         |
| Split a string into a list of strings                            | <string\>.split(separator)           |
| Slice characters from a string by position                       | <string\>[:5\]                       |

<br>

- String functions: `capitalize`, `count`, `startswith`, `endswith`, `find`, `format`, `lower`, `upper`, `lstrip`, `rstrip`, `strip`, `replace`, `split`, `swapcase`, `title`, `zfill`;

<br>

| String interpolation                                                    | Syntax                         |
| ----------------------------------------------------------------------- | ------------------------------ |
| Insert values into a string in order                                    | "{} {}".format(value, value)   |
| Insert values into a string by position                                 | "{0} {1}".format(value, value) |
| Insert values into a string by name                                     | "{name}".format(name="value")  |
| Format specification for precision of two decimal places                | "{:.2f}".format(float)         |
| Order for format specification when using precision and comma separator | "{:,.2f}".format(float)        |
| Python 3.6 String Interpolation                                         | f"Hello {variable}"            |

<br>

| Dates and Times Basics             | Syntax                                                     |
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

| Dates and Times Math  | Type      |
| --------------------- | --------- |
| datetime - datetime   | timedelta |
| datetime - timedelta  | datetime  |
| datetime + timedelta  | datetime  |
| timedelta + timedelta | timedelta |
| timedelta - timedelta | timedelta |

<br>

| [Format](https://strftime.org/) | Description                                |
| ------------------------------- | ------------------------------------------ |
| %d                              | Day of the month as a zero-padded number   |
| %A                              | Day of the week as a word                  |
| %m                              | Month as a zero-padded number              |
| %Y                              | Year as four-digit number                  |
| %y                              | Year as two-digit number with zero-padding |
| %B                              | Month as a word                            |
| %H                              | Hour in 24 hour time as zero-padded number |
| %p                              | a.m. or p.m.                               |
| %I                              | Hour in 12 hour time as zero-padded number |
| %M                              | Minute as a zero-padded number             |

<br>

| JSON Basics           | Syntax                                    |
| --------------------- | ----------------------------------------- |
| Import module         | import json                               |
| JSON string to Object | json.loads('json')                        |
| JSON file to Object   | json.load(open('path'))                   |
| Object to JSON string | json.dumps(obj, sort_keys=True, indent=4) |
| Dictionary keys       | obj.keys()                                |
| Delete key            | del obj[key\]                             |

<br>

| List Comprehansions and Lambdas | Syntax                                                                                           |
| ------------------------------- | ------------------------------------------------------------------------------------------------ |
| Ranges (integers only)          | range(min, max, interval)                                                                        |
| List comprehension              | [i * 10 for i in [0,1,2,3,4,5\] if i > 0\]                                                       |
| Functions on Objects            | min\|max\|sorted(obj, key=function, reverse=True) \| one argument function extracts scalar value |
| Lambda function                 | f = lambda x, y: x * y                                                                           |
| Ternary operator                | return <val\> if <expression\> else None                                                         |

<br>

### Object-Oriented

<br>

```python
class MyClass():
	def __init__(self, param_1):
		self.attribute_1 = param_1
	def add_20(self):
		self.attribute_1 += 20

mc = MyClass(10)
mc.add_20()
print(mc.attribute_1)
```

<br>

### asyncio

- [asyncio for beginners](https://medium.com/@esfoobar/python-asyncio-for-beginners-c181ab226598)
- [asyncio on Real Python](https://realpython.com/async-io-python)
- [Task docs](https://docs.python.org/3/library/asyncio-task.html)
- [Stream docs](https://docs.python.org/3/library/asyncio-stream.html)
- [Use both Multitasking and Asyncio](https://youtu.be/0kXaLh8Fz3k?t=10m30s)

<br>

| asyncio                          | Syntax                               |
| -------------------------------- | ------------------------------------ |
| Import module                    | import asyncio                       |
| Grab an event loop               | asyncio.run(<coroutine\>)            |
| Make an async function           | async def func():                    |
| await coroutine                  | await func()                         |
| Awaitable sleep                  | asyncio.sleep(n)                     |
| Start an awaitable task (future) | asyncio.create_task(<coroutine\>)    |
| Gather multiple coroutines       | asyncio.gather([coroutines\])        |
| Asynchronous Queue               | asyncio.Queue()                      |
| Asynchronous Iterable            | async for <iterable\>                |
| Get Event Loop                   | asyncio.get_event_loop()             |
| Start Event Loop                 | try: loop.run_until_complete(main()) |
| Close Event Loop                 | finally: loop.close()                |
| Currently pending tasks          | asyncio.Task.all_tasks()             |


<br>

### venv

| Description  | Syntax                          |
| ------------ | ------------------------------- |
| Create       | py -m venv env                  |
| Activate     | .\env\Scripts\activate          |
| Deactivate   | deactivate                      |
| Dependencies | pip install -r requirements.txt |

<br>

### PyQT5

| Description                        | Syntax                       |
| ---------------------------------- | ---------------------------- |
| Import modules                     | from PyQt5.QtWidgets import  |
| Create an instance (one per app)   | app = QApplication(sys.argv) |
| Start the event loop               | app.exec_()                  |
| Create window (no parent = window) | window = QWidget()           |
| Create main window                 | window = QMainWindow()       |
| Show window (hidden by default)    | window.show()                |

<br>

### NumPy Arrays

| NumPy Selecting                           | Syntax                                      |
| ----------------------------------------- | ------------------------------------------- |
| Import module                             | import numpy as np                          |
| Convert a list of lists into a ndarray    | np.array(list(csv.reader(open(file, "r")))) |
| Selecting a row from an ndarray           | ndarr[1\]                                   |
| Selecting multiple rows from an ndarray   | ndarr[1:\]                                  |
| Selecting a specific item from an ndarray | ndarr[1,1\]                                 |
| Selecting multiple columns                | ndarr[:,1:3\] \| ndarr[:, [1,2\]\]          |
| Selecting a 2D slice                      | ndarr[1:4,:3\]                              |

<br>

| NumPy Boolean Indexing                           | Syntax                                                                 |
| ------------------------------------------------ | ---------------------------------------------------------------------- |
| Reading in a CSV file                            | np.genfromtxt('.csv', delimiter=',', skip_header=1)                    |
| Creating a Boolean array from filtering criteria | np.array([2,4,6,8\]) < 5                                               |
| Boolean filtering for 1D ndarray                 | a = np.array([2,4,6,8\]) \| a[a < 5\]                                  |
| Boolean filtering for 2D ndarray                 | ndarr[ndarr[:,12\] > 50\]                                              |
| Assigning values in a 2D ndarray using indices   | ndarr[1,1\] = 1 \| ndarr[:,0\] = 1 \| ndarr[:,7\] = ndarr[:,7\].mean() |
| Assigning values using Boolean arrays            | ndarr[ndarr[:,5\] == 2, 15\] = 1                                       |

<br>

| NumPy 1D Statistics | Syntax                               |
| ------------------- | ------------------------------------ |
| Vectorized math     | + - * /                              |
| Functions           | ndarray .min() .max() .mean() .sum() |

<br>

| NumPy Utils     | Syntax                        |
| --------------- | ----------------------------- |
| Advanced ranges | np.arange(min, max, interval) |

<br>

### Pandas Transform and Clean

- Tidy data: each variable is a column, each observation is a row, and each type of observational unit is a table
- Imputation: The technical name for filling in a missing value with a replacement value

<br>

| Pandas Information Basics               | Syntax                                                              |
| --------------------------------------- | ------------------------------------------------------------------- |
| Import module                           | import pandas as pd                                                 |
| Reading a file into a dataframe         | pd.read_csv('.csv', index_col=0, parse_dates=['col'\], encoding='') |
| Reading a JSON into a dataframe         | pd.read_json()                                                      |
| Exporting data                          | df.to_csv('.csv', index=False)                                      |
| Dataframe object info                   | df.info(memory_usage='deep')                                        |
| Describing a dataframe/series object    | df.describe(include='all') \| s.describe()                          |
| Returning a dataframe/series data types | df.dtypes \| s.dtype()                                              |
| Returning or setting column names       | df.columns                                                          |
| Returning the dimensions of a dataframe | dt.shape                                                            |
| Create dataframe/series                 | pd.DataFrame({'col': []}, columns=cols) \| pd.Series([])            |
| Series to dataframe/list                | s.to_frame('col')  \| s.tolist()                                    |

<br>

| Pandas Select Operations         | Syntax                                   |
| -------------------------------- | ---------------------------------------- |
| Selecting the first n rows       | df.head(5)                               |
| Selecting random n rows          | df.sample(5, random_state=1)             |
| Selecting a single column        | df['col'\]                               |
| Selecting multiple columns       | df[['col', 'col2'\]\]                    |
| Shorthand Convention for columns | df['col'\] \| df[['col', 'col2'\]\]      |
| Shorthand Convention for rows    | df['row':'row3'\]                        |
| Selecting rows by label          | df.loc[<row_labels\>, [column_labels\]\] |
| Selecting rows by index          | df.iloc[<row_index\>, [column_index\]\]  |

<br>

| Pandas Missing Values Handling             | Syntax                                                             |
| ------------------------------------------ | ------------------------------------------------------------------ |
| Unique value counts for a dataframe/series | s.unique() \| s.value_counts(dropna=False, bins=3, normalize=True) |
| Selecting null and non-null values         | s.isnull() \| s.notnull()                                          |
| Selecting null rows                        | df.isnull().any(axis=1)                                            |
| Renaming an existing column                | df.rename(columns={'src_name': 'dest_name'}, inplace=True)         |
| Dropping an existing column                | df.drop(labels=['row'\], columns=['col'\], inplace=True)           |
| Dropping missing values                    | df.dropna(axis=0, thresh=number_of_records, inplace=True)          |
| Show duplicated rows                       | df.duplicated(cols)                                                |
| Drop duplicated rows                       | df.drop_duplicates(cols)                                           |
| Fill missing values                        | df.fillna(value) \| s.fillna(value)                                |
| Reset index column                         | df.reset_index(drop=True, inplace=True)                            |
| Renaming an index                          | df.rename_axis(None, axis=0)                                       |

<br>

| Pandas Boolean Masks Operations         | Syntax                                 |
| --------------------------------------- | -------------------------------------- |
| In operator                             | df['col'\].isin(['val1', 'val2'\])     |
| Between method                          | df['col'\].between(val1, val2)         |
| Updating values using Boolean filtering | s.loc[s['col'\] == 0, 'col'\] = np.nan |
| Updating values using a Mapping dict    | s.map({ 'src_name': 'dest_name' })     |
| Updating values using mask method       | s.mask(bool_mask, new_values)          |

<br>

| Pandas Sort and Convert Basics  | Syntax                                  |
| ------------------------------- | --------------------------------------- |
| Sorting by index column         | df.sort_index(ascending=False)          |
| Sorting by column values        | df.sort_values(ascending=False)         |
| Converting column to datetime   | pd.to_datetime(series, errors="coerce") |
| Converting column to numeric    | pd.to_numeric(series, errors="coerce")  |
| Converting column to float/int  | s.astype(float/int)                     |
| Stack multiple columns into one | df.stack(dropna=False)                  |

<br>

| Pandas Vectorized Accessors                 | Syntax                 |
| ------------------------------------------- | ---------------------- |
| Multi-dimensional numpy array               | df.values              |
| Access datetime values in series            | s.dt \| s.dt.year      |
| Replace substring                           | s.str.replace('"', '') |
| Extracting values from strings (first word) | s.str.split().str[0\]  |

<br>

| Pandas Aggregation Methods | Syntax                                                                                           |
| -------------------------- | ------------------------------------------------------------------------------------------------ |
| Grouping                   | df.groupby('col')                                                                                |
| Group indexing             | gr['col'\]                                                                                       |
| Select group data          | gr.get_group('value')                                                                            |
| Groups and indexes         | gr.groups                                                                                        |
| Aggregations               | gr.size() \| mean, sum, count, min, max                                                          |
| Multiple aggregations      | gr.agg(functions_list)                                                                           |
| Aggregate                  | df.pivot_table(index=gr_cols, columns=gr_cols, values=val_cols, aggfunc=functions, margins=True) |

<br>

| Pandas Transforming Data                                          | Syntax                                              |
| ----------------------------------------------------------------- | --------------------------------------------------- |
| Apply function for each row in Series                             | s.map(func/dict)                                    |
| Apply function - Series: for each row, DataFrame: for each column | s.apply(func, args) \| df.apply(func, args, axis=0) |
| Apply function to every cell in the DataFrame                     | df.applymap(func)                                   |
| Unpivot                                                           | df.melt(id_vars=cols, value_vars=cols) \| pd.melt() |
| Pivot                                                             | df.pivot(index=cols, columns=cols, values=cols)     |
| List-like to a row (Pandas 0.25)                                  | df.explot(column, ignore_index=True)                |

<br>

-*Pandas Combining DataFrames**

- Union  
  - pd.concat(df_list, axis, ignore_index=True)  
  - df.append() # shortcut

- Join
  - pd.merge(  
    left=df1, right=df2,
    how='inner', on='col',  
    on_left='col1', on_right='col2',  
    left_index = True, right_index = True,  
    suffixes=('_x', '_y')  
    )
  - df.merge() # shortcut
  - df.join() # using indexes

<br><hr><br>

## Data Visualization

- [Find The Graphic You Need](https://www.data-to-viz.com/)
- [The Data Visualisation Catalogue](https://datavizcatalogue.com/index.html)
- [Plot With Pandas](https://realpython.com/pandas-plot-python/)
- [Charjunk, Data-ink ratio: effective data visualization](https://www.darkhorseanalytics.com/blog/data-looks-better-naked)
- [Tableau Color Blind 10](http://tableaufriction.blogspot.com/2012/11/finally-you-can-use-tableau-data-colors.html)
- [Kernel density estimation (KDE)](https://en.wikipedia.org/wiki/Kernel_density_estimation): better histogram
- [Small multiple](https://en.wikipedia.org/wiki/Small_multiple): series of similar graphs or charts using the same scale and axes
- [Matplotlib styles](https://matplotlib.org/stable/gallery/style_sheets/style_sheets_reference.html)

<br>

### Pandas

- df.plot(x='col', y='col', kind='scatter')
  - c='color', color='color'
  - figsize=(,), ax=ax1, grid=True
  - label='', legend=True, title=''
  - xlim=(,), xticks=[]
  - rot=30, alpha=1
  - autopct='%.1f%%' # -% String Formatting -.1 precision -f fixed point -% perc -% symbol
  - secondary_y=False, marker='o'
- df.plot.bar(x='col', y='col')
- df.plot.kde()
- df.hist(bins=, range=(,), histtype='step')
- df.box(x='col', y='col')
- df.<graph\>()

<br>

- from pandas.plotting import scatter_matrix
- scatter_matrix(cols, figsize(,))

<br>

### Seaborn

| Seaborn Basics              | Syntax                                                                           |
| --------------------------- | -------------------------------------------------------------------------------- |
| Import module               | import seaborn as sns                                                            |
| Set background style        | sns.set_style('darkgrid' \| 'whitegrid' \| 'dark' \| 'white' \| 'ticks')         |
| Remove spines               | sns.despine(left=True, bottom=True)                                              |
| Histogram \w KDE            | sns.distplot(y_values)                                                           |
| Kernel Density Plot         | sns.kdeplot(y_values, shade=True)                                                |
| Countplot (Clustered Bar)   | sns.countplot(x='x_col', hue='y_col', data=df, order=[], hue_order=[])           |
| Strip Plot (Narrow Scatter) | sns.stripplot(x='x_col', y='y_col', data=df, jitter=True)                        |
| Box Plot (And Whisker)      | sns.boxplot(x='x_col', y='y_col', data=df, whis=4, orient='vertical', width=.15) |
| Heatmap                     | sns.heatmap(data, cmap='Blues', cbar=False, annot=False, yticklabels=False)      |
| Small Multiple              | g = sns.FacetGrid(df, col='col1', row='col2', hue='col3', size=height)           |
| Fill Small Multiple         | g.map(sns.kdeplot, 'y_col', shade=True)                                          |

<br>

### Matplotlib

| Matplotlib Basics          | Syntax                                                            |
| -------------------------- | ----------------------------------------------------------------- |
| Import module              | import matplotlib.pyplot as plt                                   |
| Jupyter inline             | %matplotlib inline                                                |
| Set plot style             | plt.style.use('fivethirtyeight')                                  |
| Plot style list            | plt.style.available                                               |
| Show plot                  | plt.show()                                                        |
| Save plot                  | plt.savefig('file') \| fig.savefig('file')                        |
| Create figure              | fig = plt.figure(figsize=(width_dpi, height_dpi))                 |
| Add plot to the figure     | ax = fig.add_subplot(nrows, ncols, plot_number)                   |
| Create figure and subplots | fig, axes = plt.subplots(nrows, ncols, figsize=(width, height))   |
| Disable spines             | ax.spines['side'\].set_visible(False) \| right, bottom, top, left |

<br>

| Matplotlib Charts   | Syntax                                                         |
| ------------------- | -------------------------------------------------------------- |
| Line chart          | plt.plot(x_values, y_values, c='color', label='', linewidth=3) |
| Bar plot            | plt.bar(bar_positions, bar_heights, [bar_width\])              |
| Horizontal bar plot | plt.barh(bar_positions, bar_widths, [bar_height\])             |
| Scatter plot        | plt.scatter(x, y)                                              |
| Histogram           | plt.hist(y_values, bins=int, range=(min, max))                 |
| Box plot            | plt.boxplot(values)                                            |

<br>

| Matplotlib Plot and Axis | plt         | ax                             | Arguments                                                                         |
| ------------------------ | ----------- | ------------------------------ | --------------------------------------------------------------------------------- |
| Set Title                | title       | set_title                      | 'text'                                                                            |
| Add Legend               | legend      | legend                         | 'text', loc='upper left', fontsize=12                                             |
| Set Axis Labels          | xlabel      | set_xlabel                     | 'text', size=12                                                                   |
| Ticks and Their Labels   | xticks      | set_xticks, ax.set_xticklabels | [ticks\], [labels\], rotation=90, size=12                                         |
| Batch Tick Parameters    | tick_params | tick_params                    | bottom='off', top='off', left='off', right='off', labelbottom='off', labelsize=12 |
| Set Axis Limit Range     | xlim        | set_xlim                       | min, max                                                                          |
| Add H/V Lines            | axhline     | axhline                        | y, label='', c='color', alpha=1                                                   |
| Add Text                 | text        | text                           | x, y, 'text'                                                                      |

<br><hr><br>

## SQL

- Data Query Language (DQL)
  - Data Definition Language (DDL): `CREATE`, `ALTER`, and `DROP`
  - Data Control Language (DCL): `GRANT`, `REVOKE`
  - Data Manipulation Language (DML): `SELECT`, `INSERT`, `UPDATE`, `DELETE`

<br>

- [sqlstyle.guide](https://www.sqlstyle.guide/)
- [trino.io](https://trino.io/): Fast distributed SQL query engine for big data analytics

<br>

### DML Operations

<br>

```sql
select <column_name, ...,  *>
from <table_name>
where <condition>
group by <column_name, ...>
having <condition>
order by <column_name | column_number, ...> [desc]
limit 10;

insert into <table_name> [(
	<column_name>, ...
)] values (
	<value_1>, ...
), ...;

update <table_name>
set <column_name> = <new_value>, ...
where <condition>;

delete from <table_name> where <condition>;
```

<br>

| Description                   | Syntax                                                                         |
| ----------------------------- | ------------------------------------------------------------------------------ |
| Execution order               | from -> where -> group by -> having -> select -> order by -> limit             |
| String concatenation (SQLite) | \|\|                                                                           |
| Unique                        | distinct                                                                       |
| Aggregation functions         | count, sum, avg, min, max, len                                                 |
| Rounding results              | round(<column, value\>, <n\>)                                                  |
| Casting types                 | cast(<column, value\> as <type\>)                                              |
| Case conversion               | lower(), upper()                                                               |
| Conditional logic             | case when <expression\> then <value1\> [...\] [else <value2\>\] end as <name\> |
| IN Operator                   | <column, value\> in (<values\>)                                                |
| Joining data                  | <inner, left, right, full (outer), cross\> join on <condition\>                |
| Combining rows                | union [all\], intersect, except                                                |
| Null operations               | is [not\] null                                                                 |
| Like pattern                  | like '[pattern\] [%\]'                                                         |
| Named subquery                | with <name\> as <query\> [...\]                                                |

<br>

### DDL Operations

<br>

```sql
create table <table_name> (
	<column_name> <column_type> [primary key]
	,primary key (<column_name>, ...)
	,foreign key (<column_name>) references <table_name>(<column_name>)
);

alter table <table_name>
	add column <column_name> <column_type>;
```

<br>

| Description         | Syntax                                  |
| ------------------- | --------------------------------------- |
| SQLite column types | text, integer, real, numeric, blob      |
| Creating a view     | create view <name\> as <query\>         |
| Removing an object  | drop <view, table\> [if exists] <name\> |

<br>

### Normalization

- [A Simple Guide to Five Normal Forms in Relational Database Theory](http://www.bkent.net/Doc/simple5.htm)
- [Database Normalization on Wikipedia](https://en.wikipedia.org/wiki/Database_normalization)

1. First normal form: the values in each column of a table must be atomic
2. Second normal form: every non candidate-key attribute must depend on the whole candidate key, not just part of it
3. Third normal form: eliminating the transitive functional dependencies

<br>

### SQL with Python

<br>

```python
#!conda install -yc conda-forge ipython-sql

%%capture
%load_ext sql
%sql sqlite:///sqlite_file.db

%%sql
<query>
```

<br>

### SQLite

| Description             | Syntax                             |
| ----------------------- | ---------------------------------- |
| Import module           | import sqlite3                     |
| Connect to database     | conn = connect(path)               |
| Close the connection    | conn.close()                       |
| Create a cusror         | cursor = conn.cursor()             |
| Run the query           | cursor.execute(sql_query)          |
| Return one row          | cursor.fetchone()                  |
| Return n rows           | cursor.fetchmany(n)                |
| Return the full results | cursor.fetchall()                  |
| No cursor shortcut      | conn.execute(sql_query).fetchall() |

<br>

### SQLite Shell

| Description                 | Syntax                |
| --------------------------- | --------------------- |
| Open database               | sqlite3 <dbname.db\>  |
| Enable column headers       | .headers on           |
| Enable column output        | .mode column          |
| Help                        | .help                 |
| Tables list                 | .tables               |
| Run in shell                | .shell <command\>     |
| Quit                        | .quit                 |
| View the schema for a table | .schema <table_name\> |

<br>

### SQLAlchemy

```python
from sqlalchemy import create_engine
engine = create_engine(f'mysql://{LOGIN}:{PASS}@{URL}/{DB}?charset=utf8')
with engine.begin() as conn:
    cursor = conn.execute('''
        select value
        from table
        ''')
df = pd.DataFrame(cursor.all())
```

<br>

### SQL Server Snippets

- [Date and Time Conversions Using SQL Server](https://www.mssqltips.com/sqlservertip/1145/date-and-time-conversions-using-sql-server/)

```sql
select convert(varchar(8), getdate(), 112) as [DateKey]
select cast([YYYMMDD] as datetime) as [DateTime]
```

<br><hr><br>

## Business

### Communication

- **Fuzzy language** is vague language and it is common in the workspace
- **Sought clarification**: What is the reason behind the request? What is the right question to ask?
- [**Proxies**](https://en.wikipedia.org/wiki/Proxy_(statistics)): is a variable that stands in place of another variable (which is typically hard to get)
- [**Price dumping**](https://en.wikipedia.org/wiki/Dumping_(pricing_policy)): occurs when manufacturers export a product to another country at a price below the normal price with an injuring effect (could be illegal)
- **Line organization**: most requests come directly from your manager
- **Functional organization**: requests can come from all over the company
- **Majority rule**: a decision rule that selects alternatives with more than half the votes
- **Prototyping** has several advantages like easier estimation, profitability decision, changes and goals flexibility
- [**Supply Chain Management** (SCM)](https://en.wikipedia.org/wiki/Supply_chain_management): the management of the flow of goods and services

<br>

### Metrics

Measurements that help management track of the overall health of the business:

- Metrics are observed across time
- Metrics are calcullted separately at specific points in time
- Metrics are understood in a chronological context

<br>

A good metric should have the following characteristics:

- **Accurate**: do not create anything wrongly measured
- **Simple and intelligible**: easy to read for anyone
- **Easy to drill down into**: are we doing good or bad and why
- **Actionable**: ability to change things according to the measure
- **Dynamic**: metrics need to change over reasonable periods of time
- **Standardized**: everyone should see the same thing with no inconsistency
- **Business Oriented**: should be relevant for the business

<br>

Examples:

- **Gross Domestic Product** (GDP)
- **Inflation**
- **Unemployment Rate**
- **Revenue**
- **Conversion Rate** (CR)
- [**Average Order Value**](https://www.optimizely.com/optimization-glossary/average-order-value) (AOV): reduce payback period and increase Return on Investment (ROI) in retail
- [**Net Promoter Score**](https://en.wikipedia.org/wiki/Customer_success) (NPS): quantifies customer satisfaction
  - % Promoters - % Detractors = (\# Promoters - \# Detractors) / \# Total
- [**Churn Rate**](https://www.profitwell.com/customer-churn/calculate-churn-rate) is when a customer ceases to be a customer (subscription-based)
  - \# Churned Customers / \# Total Customers
  - The more customers you lose, the smaller the pool of potential customers becomes
  - Current customers are more likely to buy the more expensive products than new customers (subscription based)
  - Churn rate informs how happy customers are with your product
  - Happy customers provide free advertising
  - Rretaining existing customers is more profitable than acquiring new customers
    - [Applying and Evaluating Models to Predict Customer Attrition Using Data Mining Techniques](https://journals.lib.unb.ca/index.php/JCIM/article/view/442/735)

<br><hr><br>

## Probability and Statistics

- [**Introducing KaTeX**](https://katex.org/docs/supported.html): The fastest math typesetting library for the web
- **Granularity**: the level of detail at which data is stored
- **Rule of thumb**: principe based on practical experience rather than theory

<br>

### Sampling

- **Population**: the set of all individuals relevant to a particulas statistical question 
- **Sample**: a smaller group selected from a population
- **Parameter**: a population metric
- **Statistic**: a sample metric
- **Sampling error**: difference between the metrics of a population and the metrics of a sample
  - sampling error = parameter - statistic
- **Representativeness**: every individual in the population has an equal chance to be selected, leading to smaller sampling error

<br>

[Sampling methods](https://en.wikipedia.org/wiki/Sampling_(statistics)#Sampling_methods):

- **Simple random sampling** (SRS): a sampling method using random numbers to select a few sample units `# pd.sample()`
- **Stratified sampling**: organize (**stratify**) data into different groups (**stratums**), and then sample randomly each group
  - Maximize the variability between strata (different groups)
  - Minimize the variability within each stratum
  - The stratification criterion should be strongly correlated with the property you're trying to measure
- **Сluster sampling**: picking only a few of the individual data souces (**clusters**)
- **Descriptive statistics**: describing a sample or a population by measuring and visualizing stuff
- **Inferential statistics**: using a sample (**infering**) to draw conclusions about a population

<br>

### Variables

**Variable** is a property with varying value. Can be divided into two categories:

- **Quantitative variable**: describes *how much there is of something*
  - We **can** tell the *size* or *direction* of the difference
  - e.g. height, age (date), points, experience
- **Qualitative variable** (Categorical): describes *what or how*
  - We **cannot** tell the *size* and *direction* of the difference
  - e.g. name, position, place, college

<br>

**Scales of measurement** is the system of rules that define how each variable is measured:

- **The Nominal** scale: measuring **qualitative** variables only
- **An Ordinal** scale: measuring **quantitative** variables only
  - We **can** tell the *direction* of the difference
  - We **cannot** tell the *size* of the difference (intervals between ranks could differ)
  - We **should be aware** calculating averages for ordinal variables (different results with shifted encoding systems)
- **An Interval** or **Ratio** scales: measuring **quantitative** variables only
  - Preserves **the order** between values and has **well-defined intervals** using real numbers
  - On a **Ratio** scale, the zero point means "no quantity", while on an **Interval** scale it indicates the presence of a quantity
  - Using a **Ratio** scale we can measure the difference in terms of ratios (division)
  - **Discrete variable**: there is no possible intermediate value between any two adjacent values
  - **Continuous variable**: contains an infinity of values between any two values

<br>

### Frequency Distributions

- **Frequency Distribution Table** shows how frequencies are distributed
- **Grouped Frequency Distribution Talbes**: each group (interval) is called a *class interval*
  - `s.value_counts(bins=intervals)`
  - `pd.interval_range(start=0, end=100, freq=10)`
  - there should be a good balance between information and comprehensibility

<br>

Types of Frequencies:

- **Absolute frequencies**: absolute counts `# s.value_counts()`
- **Relative frequencies**: proportions and percentages `# s.value_counts(normalize=True)`

<br>

Percentiles and Quartiles:

- **Percentile rank** of a score is the percentage of scores in its distribution that are less than it
- **Percentile** and percentile rank are related terms, but percentile is measured in percentages
  - `from scipy.stats import percentileofscore`
  - `percentileofscore(a=series, score=value, kind='weak')`
- **Quartiles**: the *three* percentiles, 25th (lower quartile), the 50th (middle quartile), and the 75th (upper quartile), that divide the distribution in *four* equal parts `# s.describe(percentiles=[])`

<br>

Types of Distributions:

- **Skewed Distributions**
  - **Left skewed** (negatively skewed): the tail points in the direction of negative numbers
  - **Right skewed** (positively skewed): the tail points in the direction of positive numbers
- **Symmetrical Distributions**
  - **Normal distribution** (Gaussian distribution): the values pile up in the middle and gradually decrease toward both ends
  - **Uniform distribution**: the values are distributed uniformly

<br>

Visualizing Distributions:

- *Nominal* and *Ordinal* variables is common to visualize using **bar plot**, **pie chart** (better sense for the relative frequencies)
- The most commonly used graph for visualizing *distributions* is the **histogram**
- Smoothed histogram that display *densities* (probabilities) instead of frequencies is called **Kernel Density Estimate** (KDE) plot
- When we need to compare *multiple* (> 4) distributions, it is better to use **strip plot** or **box plot**
  - **Quartiles**
    - Lower quartile index: $Qi_1 = (n+1) * 0.25$
    - Upper quartile index: $Qi_3 = (n+1) * 0.75$
    - Interquartile range: $\text{IQR} = \text{upper quartile} - \text{lower quartile}$
  - **Outliers** are values in the distribution that are much larger or much lower than the rest of the values
    - Lower bound: $\min = Q_1 - 1.5* \text{IQR}$
    - Upper bound: $\max = Q_3 + 1.5 * \text{IQR}$


<br>

### Averages and Variability

- **Arithmetic Mean μ (Parameter)**: total sum divided by total number of values (distances belove and above are the same) $\dfrac{1}{N}(\sum_{i=1}^N x_i)$
- **Sample Mean x̄ (Statistics)**: there are three possible scenarios: overestimation, underestimation, equal estimation (when x̄>μ and x̄<μ, sampling error occurs)
- **Sampling Error**: $μ - x̄$
- **Sample Representativity**: the more representative a sample is, the closer x̄ will be to μ
- **Sample Size**: the larger the sample, the more chances we have to get a representative sample and less sampling error
- **Unbiased Estimator**: statistic that are on average equal to the parameter it estimates
  - This is true for any distribution of real numbers with equal sample size
- **Weighted Mean**: takes into account the different weights $\dfrac{\sum_{i=1}^{N} x_i w_i}{\sum_{i=1}^{N} w_i}$
  - `np.average(houses_per_year['Mean Price'], weights=houses_per_year['Houses Sold'])`
- **Open-Ended Distribution**: distribution with open boundary, for example "10 or more / 10+"
- **Median**: the middle value in a sorted distribution ($Q_2$), resistant to outliers (robust statistics) `# s.median()`
- **Mode**: the most frequent value in the destribution `# s.mode()`
  - The best option for discrete values, because it gives you the whole number
  - The distribution could be unimodal, bimodal or even multimodal

<br>

|        | Can be used for                           | Can't be used for                                                             | Ideal for                                                                       |
| ------ | ----------------------------------------- | ----------------------------------------------------------------------------- | ------------------------------------------------------------------------------- |
| Mean   | Interval or Ratio <br> Continuous Ordinal | Nominal <br> Non-numeric Ordinal <br> For different weights use weighted mean | Summarizing numerical distributions <br> with each value in the distribution    |
| Median | Interval or Ratio <br> Numeric Ordinal    | Nominal <br> Non-numeric Ordinal                                              | Summarizing numerical distributions with outliers <br> Open-ended distributions |
| Mode   | Interval or Ratio <br> Nominal or Ordinal | Uniform distributions <br> Continuous Ordinal                                 | Nominal or Non-numeric Ordinal <br> Discrete values                             |

<br><hr><br>

## Machine Learning

- [PyTorch for Deep Learning - Full Course / Tutorial](https://www.youtube.com/watch?v=GIsg-ZUy0MY)

<br>

- [**Correlation**](https://en.wikipedia.org/wiki/Correlation_and_dependence): attributes relations [-1, 1\]
  - [**Pearson correlation coefficient**](https://en.wikipedia.org/wiki/Pearson_correlation_coefficient): `df.corr()`
- [**Weighted sum model** (WSM)](https://en.wikipedia.org/wiki/Weighted_sum_model): is the best known and simplest multi-criteria decision analysis (MCDA)
  - $A_i^{WSM-score} = \sum_{j=1}^{n} w_j a_{ij} \text {, for i = 1, 2, 3, \dots, m}$
- [**Min-Max Feature scaling** (Normalization)](https://en.wikipedia.org/wiki/Feature_scaling): compare different scales in a meaningful way [0, 1\]
  - $x' = \frac {x-\min(x)} {\max(x) - \min(x)}$

<br><hr><br>

## Computer Vision

- [OpenCV Course - Full Tutorial with Python](https://www.youtube.com/watch?v=oXlwWbU8l2o)

