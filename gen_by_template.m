function gen_by_template(template_name, outfile_name)

template = fopen(template_name', 'r');
out = fopen(outfile_name, 'w');

tmp = fgets(template);
str = '';
isCode = 1; % 1-matlab code 0-text
while ~feof(template)
    if isCode == 1
        if tmp(1) ~= '%' || tmp(2) ~= '{'
            str = [str, tmp];
        else
            isCode = 0;
            eval(str);
            str = '';
        end
    else
        if tmp(1) ~= '%' || tmp(2) ~= '}'
            fprintf(out, tmp);
        else
            isCode = 1;
        end
    end
    tmp = fgets(template);
end

fclose(template);
fclose(out);
