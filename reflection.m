clear;
clc;

phiSet = 0.005:0.005:pi;
index = 1;
nSet = 0:50;

for phi = phiSet
    t = linspace(0, 2 * sin(phi), 2);
    plot(cos(linspace(-pi, pi, 1000)), sin(linspace(-pi, pi, 1000)))
    curveColor = [0, 0.14, 1];
    gradientMultiplier = 1.1;

    for n = nSet
        hold on;
        x = cos(2 * n * phi) - t * sin((2 * n + 1) * phi);
        y = sin(2 * n * phi) + t * cos((2 * n + 1) * phi);
        plot(x, y, 'color', curveColor)% './' gurantees every point out of the circle is NaN
        curveColor = [1 1 1] - ([1 1 1] - curveColor).^gradientMultiplier; % gradient color
    end

    hold off;
    axis off;
    title("\phi = " + phi)
    daspect([1 1 1])
    axis([-1, 1, -1, 1])
    saveas(gcf, "ExperimentResultOfMatlab/simulation/" + index + '.jpg')
    index = index + 1;
end
