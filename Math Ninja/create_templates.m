function temp = create_templates()
%CREATE TEMPLATES
%Letter
A=imread('data/A.bmp');B=imread('data/B.bmp');
C=imread('data/C.bmp');D=imread('data/D.bmp');
E=imread('data/E.bmp');F=imread('data/F.bmp');
G=imread('data/G.bmp');H=imread('data/H.bmp');
I=imread('data/I.bmp');J=imread('data/J.bmp');
K=imread('data/K.bmp');L=imread('data/L.bmp');
M=imread('data/M.bmp');N=imread('data/N.bmp');
O=imread('data/O.bmp');P=imread('data/P.bmp');
Q=imread('data/Q.bmp');R=imread('data/R.bmp');
S=imread('data/S.bmp');T=imread('data/T.bmp');
U=imread('data/U.bmp');V=imread('data/V.bmp');
W=imread('data/W.bmp');X=imread('data/X.bmp');
Y=imread('data/Y.bmp');Z=imread('data/Z.bmp');

%Number
one=imread('data/1.bmp');  two=imread('data/2.bmp');
three=imread('data/3.bmp');four=imread('data/4.bmp');
five=imread('data/5.bmp');five2=imread('data/5.2.jpg') ;six=imread('data/6.bmp');
seven=imread('data/7.bmp');eight=imread('data/8.bmp');
nine=imread('data/9.bmp'); zero=imread('data/0.bmp');

%Operators
plus = imread('data/plus.bmp');
% plus = rgb2gray(plus);
minus = imread('data/minus.bmp');
%minus = rgb2gray(minus);
division = imread('data/division.bmp');
%division = rgb2gray(division);
multiply = imread('data/multiply.jpg');
multiply = rgb2gray(multiply);
multiply2 = imread('data/multiply2.jpg');
power = imread('data/power.bmp');
% power = rgb2gray(power);
paran_open = imread('data/paran_open.bmp');
 %paran_open = rgb2gray(paran_open);
paran_closed = imread('data/paran_closed.bmp');
 %paran_closed = rgb2gray(paran_closed);
dot = imread('data/dot.bmp');
dot2 = imread('data/dot2.bmp');
 %dot = rgb2gray(dot);
% %Skel
% A = bwmorph(A, 'skel', inf);
% B = bwmorph(B, 'skel', inf);
% C = bwmorph(C, 'skel', inf);
% D = bwmorph(D, 'skel', inf);
% E = bwmorph(E, 'skel', inf);
% F = bwmorph(F, 'skel', inf);
% G = bwmorph(G, 'skel', inf);
% H = bwmorph(H, 'skel', inf);
% I = bwmorph(I, 'skel', inf);
% J = bwmorph(J, 'skel', inf);
% K = bwmorph(K, 'skel', inf);
% L = bwmorph(L, 'skel', inf);
% M = bwmorph(M, 'skel', inf);
% N = bwmorph(N, 'skel', inf);
% O = bwmorph(O, 'skel', inf);
% P = bwmorph(P, 'skel', inf);
% Q = bwmorph(Q, 'skel', inf);
% R = bwmorph(R, 'skel', inf);
% S = bwmorph(S, 'skel', inf);
% T = bwmorph(T, 'skel', inf);
% U = bwmorph(U, 'skel', inf);
% V = bwmorph(V, 'skel', inf);
% W = bwmorph(W, 'skel', inf);
% X = bwmorph(X, 'skel', inf);
% Y = bwmorph(Y, 'skel', inf);
% Z = bwmorph(Z, 'skel', inf);
% 
% one = bwmorph(one, 'skel', inf);
% two = bwmorph(two, 'skel', inf);
% three = bwmorph(three, 'skel', inf);
% four = bwmorph(four, 'skel', inf);
% five = bwmorph(five, 'skel', inf);
% six = bwmorph(six, 'skel', inf);
% seven = bwmorph(seven, 'skel', inf);
% eight = bwmorph(eight, 'skel', inf);
% nine = bwmorph(nine, 'skel', inf);
% zero = bwmorph(zero, 'skel', inf);
% 
% plus = bwmorph(plus, 'skel', inf);
% minus = bwmorph(minus, 'skel', inf);
% division = bwmorph(division, 'skel', inf);
% multiply = bwmorph(multiply, 'skel', inf);
% power = bwmorph(power, 'skel', inf);
% paran_open = bwmorph(paran_open, 'skel', inf);
% paran_closed = bwmorph(paran_closed, 'skel', inf);


% --------------------------------------

letter=[A B C D E F G H I J K L M...
    N O P Q R S T U V W X Y Z];
number=[one two three four five...
    six seven eight nine zero];

operators=[plus minus division multiply power paran_open paran_closed dot five2 dot2 multiply2];
threshold = graythresh(operators);
operators = im2bw(operators,threshold);
character=[letter number operators];
% -----------------------------
temp = mat2cell(character,90,ones(1,47)*120);
end
