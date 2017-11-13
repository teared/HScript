# SYNTAX TEST "Packages/HScript/syntax/HScript.sublime-syntax"



Comments.


# Test comment.
# <- punctuation.definition.comment
#^^^^^^^^^^^^^^ comment.line



Constants.


 1.f 1.0_f .1f 1.3 .3 1. 1_1.3_3 .3_3 1_1. 1.1_
#^^^ constant.numeric
#    ^^^^^ constant.numeric
#          ^^^ constant.numeric
#              ^^^ constant.numeric
#                  ^^ constant.numeric
#                     ^^ constant.numeric
#                        ^^^^^^^ constant.numeric
#                                ^^^^ constant.numeric
#                                     ^^^^ constant.numeric
#                                          ^^^^ constant.numeric
  1_000 1000_
# ^^^^^ constant.numeric
#       ^^^^^ constant.numeric
  017 0_17 00_07 0007
# ^^^ constant.numeric
#     ^^^^ constant.numeric
#          ^^^^^ constant.numeric
#                ^^^^ constant.numeric
  1e2 1e-2 1e+2 1e10 1_0.1e-2
# ^^^ constant.numeric
#     ^^^^ constant.numeric
#          ^^^^ constant.numeric
#               ^^^^ constant.numeric
#                    ^^^^^^^^ constant.numeric



String literals.


"asd\"fgh\t\\t\fe\nd\\"
#   ^^ constant.character.escape
#            ^ -constant.character.escape
#             ^^ -constant.character.escape
#                     ^ punctuation.definition.string.end
#^^^^^^^^^^^^^^^^^^^^^^ string.quoted



Types, variables, operators.

vector color
# <- storage.type
float color
# <- storage.type
matrix color

$PI - $F^2
# <- constant.language.variable
#     ^^ constant.language.variable
#   ^ keyword.operator.arithmetic
#       ^ keyword.operator.power



Expression functions and commands.


opinput(name, index)
# <- support.function

opls
# <- keyword.control.command

echo foo
# <- keyword.control.command
#    ^^^ string.unquoted.echo



Flow control.


if (1)
# <- keyword.control

for
# <- keyword.control



HScript Expressions.


  if($PT % 2 == 0, ($TX - point("../mountain_z", ($PT + 1), "P", 0)), 0)
# ^^ support.function
#   ^ punctuation.parens.begin
#    ^^^ constant.language.variable
#        ^ keyword.operator.arithmetic
#          ^ constant.numeric.dec
#            ^^ keyword.operator.assignment
#               ^ constant.numeric.dec
#                ^ punctuation.separator
#                  ^ punctuation.parens.begin
#                         ^^^^^ support.function
#                               ^ punctuation.definition.string.begin
#                               ^^^^^^^^^^^^^^^ string.quoted.double
#                                             ^ punctuation.definition.string.end
#                                              ^ punctuation.separator

{
# <- punctuation.braces.begin
    if ($PT % 2 == 0)
#   ^^ keyword.control
    {
        return point("../mountain_z", $PT + 1, "P", 0);
#       ^^^^^^ keyword.control
#              ^^^^^ support.function
    }
    else if (2)
#   ^^^^ keyword.control
#       ^ -keyword.control
#        ^^ keyword.control
    {
        return 0;
#       ^^^^^^ keyword.control
#              ^ constant.numeric.dec
    }
}
# <- punctuation.braces.end



HScript


foreach object ("`run("opls -d")`")
# <- keyword.control
#              ^ punctuation.parens.begin
#               ^ punctuation.definition.string.begin
#                ^ keyword.other.backticks
#                 ^^^ support.function
#                    ^ punctuation.parens.begin
#                              ^ punctuation.parens.end
#                               ^ keyword.other.backticks
#                                ^ punctuation.definition.string.end
#               ^^^^^^^^^^^^^^^^^^ string.quoted.double
#                                 ^ punctuation.parens.end
    echo Object $object
#   ^^^^ keyword.control.command
#        ^^^^^^ string.unquoted.echo
#               ^^^^^^^ constant.language.variable
end
# <- keyword.control



Group Patterns has no special scopes, only reusing existing operators.


geo*
[gG]eo*
?eo*
* ^geo1
10-20
0-30:2
0-30:2,3
!3-5
0-100:2 ^10-20



Demos.


# HScript Expressions example.
if($PT % 2 == 0, ($TX - point("../mountain_z", ($PT + 1), "P", 0)), 0)

# Multi-line style.
{
    if ($PT % 2 == 0)
    {
        return point("../mountain_z", $PT + 1, "P", 0);
    }
    else
    {
        return 0;
    }
}

# Expression function to reverse the order of a string.
string strreverse(string in)
{
    float len = strlen(in);
    string result = "";
    for (src = len-1; src >= 0; src--)
    {
        result += in[src];
        return result;
    }
}



{
    float rot = (ch("../crank_rotate/rz") + ch("../root_cyl_01/rz") - ch("../strokepath_01/rz")) * -1;
    float crankrad = ch("../cylinder_stroke")/2;

    float aa = crankrad * cos( rot );
    float bb = crankrad * sin( rot );
    float dd = sqrt( ch("../rod_length")^2 - bb^2);

    return aa + dd;
}

# Function to find the minimum value of two floating point numbers
min(v1, v2)
{
    if (v1 < v2)
    {
        return v1;
    }
    else
    {
        return v2;
    }
}

# Function to reverse the order of a string
string strreverse(string in)
{
    float len = strlen(in);
    string result = "";
    for (src = len-1; src >= 0; src--)
    {
        result += in[src];
        return result;
    }
}

# Example to find the minimum element in a vector
float vecmin(vector vec)
{
    min = vec[0];

    for (i = 1; i < vsize(vec); i++)
    {
        if (vec[i] < min)
        {
            min = vec[i];
        }
    }

    return min;
}

# Example to transform a vector into the space of an object passed in.
vector opxform(string oname, vector v)
{
    matrix xform = 1;

    if (index(oname, "/obj/"))
    {
        xform = optransform(oname);
    }
    else
    {
        xform = optransform("/obj/" + oname);
    }

    return v * xform;
}

# Example to find all objects which have their display flag set
string opdisplay()
{
    string objects = run("opls /obj");
    string result = "";
    nargs = argc(objects);

    for (i = 0; i < nargs; i++)
    {
        string obj = arg(objects, i);
        if (index(run("opset " + obj), " -d on") >= 0)
        {
            result += " " + obj;
        }
    }

    return result;
}


# Scripts.
foreach i (a b c)
    echo $i
end

foreach object ("`run("opls -d")`")
    echo Object $object
end

# Data types allowed on objects.
dopdatahint -t SIM_Data SIM_Object

set foo = "Hello world"
echo '$foo='"$foo"
echo ${afile:e}


# Script for a guessing game.
set foo = `system(date)`
set seed = `substr($foo, 14, 2)``substr($foo, 17, 2)`
set num = `int(rand($seed)*100)+1`
set guess = -1
echo Guess a random number between 1 and 100.
while ("$guess" != "$num")
    echo "-n Enter guess (q to quit): "
    read guess

    if ("$guess" == q || "$guess" == "") then
        break;
    endif

    # Convert to a number
    set iguess = `atof($guess)`

    if ($iguess < $num) then
        echo Too low
    else if ($iguess > $num) then
        echo Too high
    else
        echo Spot on!
    endif
end
echo The number was $num
