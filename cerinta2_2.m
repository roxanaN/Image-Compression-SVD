function cerinta2_2()
	% Se citeste o imagine
	% si se convertesc valorile la doulbe
	image_name = 'in/images/image3.gif';
	A = double(imread(image_name));
	[m n] = size(A);
	min_dim = min(m, n);

	% Se descompune matricea A in valori singulare
	[U S V] = svd(A);

	% Se alege vectorul k
	k = [1 : min_dim];

	% 2.1
	% Se retin valorile singulare
	S_desc = diag(S);
	figure
	grid on;
	subplot(2, 2, 1);
	plot(k, S_desc, 'LineWidth', 4);
	title('2.1');
	ylabel('Valorile singulare');

	% 2.2
	% Se calculeaza informatia
	% data de primele k valori singulare
	sum_down = sum(S_desc);
	for i = 1 : min_dim
		sum_up = 0;

		for j = 1 : k(i)
			sum_up += S(j, j);
		endfor

		S_info(i) = sum_up / sum_down;
	endfor

	subplot(2, 2, 2);
	plot(k, S_info, 'LineWidth', 4);
	title('2.2');
	ylim([0 1.01]);
	ylabel('Informatia');

	% 2.3
	% Se calculeaza eroarea aproximarii
	sum_of_errors = zeros(min_dim, 1);
	for p = 1 : min_dim
		% Se calculeaza A_k pentru fiecare k
		A_k = cerinta1(image_name, k(p));

		res = A .- A_k;
		sum_of_errors(p) = sum(sum(res.^2));
	endfor

	err = sum_of_errors / (m * n);
	subplot(2, 2, 3);
	plot(k, err, 'LineWidth', 4);
	title('2.3');
	ylabel('Eroarea aproximarii');

	% 2.4
	% Se calculeaza rata de compresie
	cp = (m * k + n * k + k) / ( m * n);
	subplot(2, 2, 4);
	plot(k, cp, 'LineWidth', 4);
	title('2.4');
	ylabel('Rata de compresie a datelor');
endfunction