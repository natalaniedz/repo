function FastaSet = parseFasta(fastaContent)
  FastaSet = struct('identifier', {}, 'sequence', {});
  n = 0;
  remain = char(fastaContent);
  while length(remain) > 0
    [token, remain] = strtok(remain, char(10));
    if length(token)>0 && token(1) == '>'
      n = n + 1;
      FastaSet(n).identifier = token(2:end);
      FastaSet(n).sequence = '';
    elseif n > 0
      FastaSet(n).sequence = strcat(FastaSet(n).sequence, token);
    end
  end

end
