index = 1;
deltaSet = 0.01 : 0.01 : pi - 0.01;
phi = 0.001 : 0.001 : pi - 0.001;
thetaPoint = 1.5;

for delta = deltaSet
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

    semilogy(phi, res)
    xlabel("\phi")
    ylabel("x")
    titleText = "\delta = " + round(delta, 2);
    title([titleText]);
    axis([0, pi, 0, 10000])
    saveas(gcf, "ExperimentResultOfMatlab/x-delta/" + index + '.jpg')
    index = index + 1;
end
