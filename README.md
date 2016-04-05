# m-page-template
A MATLAB toolkit to embed MATLAB codes in your data files.
Sometimes you need some data as input in scietific computation. These data files may be large, filled with data in repeating formats. This toolkit helps you generate data files according to a template file in which MATLAB codes are embedded, so that repeating contents can be easily dealed with.

将MATLAB代码嵌入数据文件中。
在科学计算中，有时会需要数据输入文件。这些数据输入文件通常很大，且有很多重复的格式性内容。这个小工具用于根据一个模板来生成对应的数据文件，而在模板中，你可以使用MATLAB代码来处理重复性内容。

## Interface
function gen_by_template(template_filename, out_filename);
- template_filename: path to your template file
- out_filename: path to your output file

function gen_by_template(template_filename, out_filename);
- template_filename: 模板文件的路径和文件名
- out_filename: 输出文件的路径和文件名

## Format of Template File
The template file is nothing more than a MATLAB file, except that it should be parsed and evaluated by our toolkits instead of being executed directly. When parsing the template file, there are 2 rules:
- Contents in a comment block (begin with `%{` and end with `%}`) will be directly put into the output file.
- All MATLAB codes will be evaluated, in which the variable `out` is presetted as the pointer of output file.

模板文件是一个MATLAB文件，但该文件不应该直接运行，而是被m-page-template解析并执行。在解析时有两条规则：
- 在注释块（以`%{`开头，以`%}`结尾）中的文本会被直接输出到文件。
- 模板文件中的MATLAB代码会被执行，而其中的`out`变量被预置为输出文件变量。

## Example
### template.m
``` matlab
%{
Texts in the comment block will be written into output file directly.
注释块中的内容会被直接输出。
%}
% The single-line comment will not be written.
% 单行注释则不会被输出。

% The following codes will be evaluated, in which `out` refers to the output file.
% 下面的代码会被执行，其中`out`变量对应输出文件。
for i = 1 : 5
    fprintf(out, '%d\n', i);
end
```

### Call the gen_by_template
gen_by_template('template.m', 'output.txt');

### The Output File
```text
Texts in the comment block will be written into output file directly.
注释块中的内容会被直接输出。
1
2
3
4
5
```

