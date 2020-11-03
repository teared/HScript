# [Houdini] add-on for [Sublime Text]

[Houdini]: https://www.sidefx.com/
[Sublime Text]: https://www.sublimetext.com/


## Features

* [HScript] and [HScript Expressions] syntax.
* Expression function auto-completions with arguments.
* Expression function documentation via styled popups.
* Nicely used in VEX snippets inside backticks by [VEX add-on].

Open [issues] for bug reports, requests, suggestions, etc.

[HScript]: https://www.sidefx.com/docs/houdini/commands/_guide
[HScript Expressions]: https://www.sidefx.com/docs/houdini/ref/expression_cookbook.html
[VEX add-on]: https://github.com/teared/VEX
[issues]: https://github.com/teared/HScript/issues


## Screenshots

![alt tag](https://raw.githubusercontent.com/teared/packages-dev/master/develop/img/expressions.png)
![alt tag](https://raw.githubusercontent.com/teared/packages-dev/master/develop/img/exhelpcard.png)
![alt tag](https://raw.githubusercontent.com/teared/packages-dev/master/develop/img/hscript.png)


## Setup

Preferences → Package Control → Install Package → HScript

Requirements:
1. Recent version of [Sublime Text].
2. [Package Control]

   Tools → Install Package Control

[Sublime Text]: https://www.sublimetext.com/
[Package Control]: https://packagecontrol.io/


### Optional: [VEX add-on]

Similar add-on for VEX and VEX Expressions. Syntax, auto-completions,
documentation popups. It can use HScript add-on inside backtick-expressions
embedded inside snippets.


## Usage

Open any HScript code and choose HScript using menu at the right bottom corner
of the editor. If you don't want to change from Batch to HScript every time
you open file with `.cmd` extension, there is "Open all with current extension
as..." action in the same menu.

When you start to type expression function name, it will prompt you with
suggestions. You can choose one and use `Tab` and `Shift+Tab` keys to navigate
back and forth.

To show docs for the function:

Tools → Command Pallette → HScript: Show Documentation for Function Under Cursor

Shortcut: `Ctrl+Alt+D`.

For the rest, check [Sublime Text Documentation], it has many small features
that make textual editing easy and powerful.

[Sublime Text Documentation]: https://www.sublimetext.com/docs/3/


## License

Public domain.
