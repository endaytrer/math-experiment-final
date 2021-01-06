clear;
clc;

phi = 2.09;
index = 1;
nSet = 0:2:1000;
t = linspace(0, 2 * sin(phi), 2);
gradientMultiplier = 1.01;
curveColor = [0, 0.14, 1];
hold off;

for nRange = nSet
    plot(cos(linspace(-pi, pi, 1000)), sin(linspace(-pi, pi, 1000)), 'color', [0 0.4470 0.7410])

    for n = nRange:nRange + 1
        hold on;
        x = cos(2 * n * phi) - t * sin((2 * n + 1) * phi);
        y = sin(2 * n * phi) + t * cos((2 * n + 1) * phi);
        plot(x, y, 'color', curveColor)
        curveColor = [1 1 1] - ([1 1 1] - curveColor).^gradientMultiplier; % gradient color
    end

    axis off;
    title("n = " + n)
    daspect([1 1 1])
    axis([-1, 1, -1, 1])
    saveas(gcf, "ExperimentResultOfMatlab/time/" + index + '.jpg')
    hold on;
    index = index + 1;
end
