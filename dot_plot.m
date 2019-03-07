clear all
clc
close all

% wczytanie plików w formacie FASTA
plik1 = 'Human.txt';
plik2 = 'Manatee.txt';
FASTAData1 = fastaread(plik1);
FASTAData2 = fastaread(plik2);

% odczytanie sekwencji w formacie Fasta
seq1 = FASTAData1.Sequence
seq2 = FASTAData2.Sequence
seq1 = upper(seq1(isspace(seq1)))
%seq2 = upper(seq2(~isspace(seq2)))

% d³ugoœæ sekwencji
n1 = length(seq1);
n2 = length(seq2);

% utworzenie macierzy dopasowania sekwencji
DotMatrix = zeros(n1, n2); 

% 1 - miejsca zgodnoœci sekwencji
for i = 1 : n1
    for j = 1: n2
        if (seq1(i) == seq2(j))
            DotMatrix(n1-i+1, j) = 1;
        end
    end
end

ws = 50; % windowsize
th = 80; % threshold


figure;
hold on
for i = ws : n1
    for j = 1 : n2-ws+1
        % suma elementów na przek¹tnej sprawdzanego okna
        line = trace(fliplr((DotMatrix(i-ws+1:i, j:j+ws-1))));
        % sprawdzenie progu
        if line >= th/100*ws
            x = j:j+ws-1;
            y = n1-i+1:n1-i+ws;
            plot(x, y, '-')
        end
    end
end
title({'Dot-plot'; ['windowsize = ', num2str(ws), '  threshold = ', num2str(th)]})
xlabel(plik2); ylabel(plik1);
hold off





