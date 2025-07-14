function [q] = hw03()
% hw03 runs the code for h03
% usage:
%  q = hw03()
% where q is the number of questions answered
% 
%  assumes all required files for h03 exist in the same directory, the
%  script will expect them
%
%  the main function of this script is to demonstrate geometric projection
%  of images

format compact
close all
q = 3;

% a1
ld1 = importdata('line_data.txt');
ld2 = importdata('line_data_2.txt');
% replace 'ld2' for 'ld1' below to see results for ld1
x2 = ld2(:, 1);
y2 = ld2(:, 2);

figure
scatter(x2, y2, 'filled')
hold on

% y = mx + b
% y = (x 1) * (m ; b)
% (m ; b) = (x 1) \ y
U_nh = [x2, ones(length(x2), 1)];
mb_nh = U_nh\y2;
y_nh = mb_nh(1) * x2 + mb_nh(2);
plot(x2, y_nh, 'green', 'LineWidth', 3);
title('Best Fit Line Using Two Least Squares Methods');
xlabel('x');
ylabel('y');

% U * n = 0
% U (x - x_bar, y - y_bar)
% Y = U' * U
% [vec, val] = eig(Y)
% (a ; b) = vec(1)
% d = a * x_bar + b * y_bar
% ax + by = d
% y = -ax/b + d/b
A = [x2 - mean(x2), y2 - mean(y2)];
AtA = A' * A;
[e_vec, e_val] = eig(AtA);
e_val
e_vec
a = e_vec(1,1);
b = e_vec(2,1);
d = a*mean(x2) + b*mean(y2);
y_n = -(a/b) * x2 + (d/b);
plot(x2, y_n, 'r', 'LineWidth', 3);
legend('', 'Non-homogenous least squares', 'Homogenous least squares', 'FontSize', 14)

% report results
fprintf("Non-homogenous least squares slope: %f\n", mb_nh(1));
fprintf("Non-homogenous least squares intercept: %f\n", mb_nh(2));
nh_resid_vert = y2 - y_nh;
nh_rmse_vert = sqrt(mean(nh_resid_vert.^2));
fprintf("Non-homogenous least squares RMSE for vertical distance: %f\n", nh_rmse_vert);
% ax + bx = d
% y = mx + b
% mx - y = -b
% a = m, b = -1, d = -b
% norm_ab = sqrt(a^2 + b^2) = sqrt(m^2 + 1)
% a_hat = m/norm_ab
% b_hat = -1/norm_ab
% d = -b/norm_ab
% a_hat*x + b_hat*x - d = 0
% norm_ab = sqrt(mb_nh(1)^2 + 1)
% a_nh = mb_nh(1)/norm_ab
% b_nh = -1/norm_ab
% d_nh = b/norm_ab
% distances = abs(a_nh*x2 - b_nh*y2 + d_nh)/norm_ab;
% nh_rmse_perp = sqrt(mean(distances.^2))


distances_t = abs(mb_nh(1) * x2 - y2 + mb_nh(2))/sqrt(mb_nh(1)^2 + 1);
nh_rmse_perp_t = sqrt(mean(distances_t.^2));
fprintf("Non-homogenous least squares for RMSE perpendicular distance: %f\n", nh_rmse_perp_t);


fprintf("\n")

fprintf("Homogenous least squares slope: %f\n", -(a/b))
fprintf("Homogenous least squares intercept: %f\n", (d/b))
n_resid_vert = y2 - y_n;
n_rmse_vert = sqrt(mean(n_resid_vert.^2));
fprintf("Homogenous least squares RMSE for veritcal distance: %f\n", n_rmse_vert);
distances = abs(a*x2 + b*y2 - d)/sqrt(a^2 + b^2);
n_rmse_perp = sqrt(mean(distances.^2));
fprintf("Homogenous least squares RMSE for perpendicular distance: %f\n", n_rmse_perp);
saveas(gcf, 'a1.png')