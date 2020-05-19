function [A_k] = cerinta1(image, k)
	% Se citeste o imagine
	% si se convertesc valorile la doulbe
	A = double(imread(image));

	% Se descompune matricea A in valori singulare
	[U S V] = svd(A);

	% Se aproximeaza matricea initiala
	A_k = U( : , 1 : k) * S(1 : k, 1 : k) * V'(1 : k, : );
endfunction