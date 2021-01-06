index = 1;
delta = 0.01;
phi = 0.001:0.001:pi - 0.001;
theta_0 = 0.01:0.01:2 * pi - 0.001;

for thetaPoint = theta_0
    res = [];

    for phiPoint = phi
        x = 0;
        reflectionAngle = 0;

        while (reflectionAngle > thetaPoint + delta / 2 || reflectionAngle < thetaPoint - delta / 2) && x < 10000
            reflectionAngle = mod((reflectionAngle + 2 * phiPoint), 2 * pi);
            x = x + 1;
        end

        res = [res, x];
    end

    for i = 0:1:9
        semilogy(phi, (thetaPoint - 2 * (i + 1) * pi) ./ (2 * phi - 2 * pi), 'y')
        hold on;
        semilogy(phi, (thetaPoint + 2 * i * pi) ./ (2 * phi), 'c')
        hold on;
    end

    semilogy(phi, res, 'color', [0 0.4470 0.7410])
    hold off;
    title(["\theta_0=" + round(thetaPoint, 2)]);
    xlabel("\phi")
    ylabel("x")
    axis([0 pi 1 10000])
    saveas(gcf, "ExperimentResultOfMatlab/x-phi-spec/" + index + '.jpg')
    index = index + 1;

end
