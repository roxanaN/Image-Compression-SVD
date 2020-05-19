function [A_k S] = cerinta4(image, k)
	% Se citeste o imagine
	% si se convertesc valorile la doulbe
	A = double(imread(image));
	[m n] = size(A);

	% Se calculeaza media pe fiecare linie a matricei A
	for i = 1 : m
		miu(i, 1) = sum(A(i, 1 : n)) / n;
	endfor
	
	% Se actualizeaza liniile matricei A
	A(1 : m, : ) = A(1 : m, : ) - miu(1 : m, 1);

	% Se construieste matricea de covarianta.
	% Se calculeaza valorile proprii si vectorii proprii
	Z = A * (A' / (n - 1));
	[V S] = eig(Z);

	% Se construieste spatiul k-dimensional
	% al componentelor principale.
	% Se calculeaza proiectia lui A
	% in spatiul componentelor principale
	W = V( : , 1 : k);
	Y = W' * A;

	% Se aproximeaza matricea initiala
	A_k = W * Y + miu;
endfunction