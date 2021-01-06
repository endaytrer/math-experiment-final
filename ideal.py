import numpy as np
from matplotlib import pyplot as plt

index = 1
delta = 0.01
phi = np.arange(0.001, np.pi-0.001, 0.001)
thetaSet = np.arange(0.01, 2 * np.pi - 0.01, 0.01)
count = 1
for theta_0 in thetaSet:
    res = []
    for phiPoint in phi:
        x = 0
        reflectionAngle = 0
        while ((reflectionAngle > theta_0 + delta / 2 or reflectionAngle < theta_0 - delta / 2) and x < 10000):
            reflectionAngle = (reflectionAngle + 2 * phiPoint) % (2 * np.pi)
            x += 1
        res.append(x)

    plt.title("theta_0=" + str(np.round(theta_0, 2)))
    plt.xlim((0, np.pi))
    plt.yscale('log')
    plt.ylim(1e0, 1e4)
    for i in range(0, 10):
        plt.plot(phi, (theta_0 - 2 * (i + 1) * np.pi) /
                 (2 * phi - 2*np.pi), 'y')
        plt.plot(phi, (theta_0 + 2 * i * np.pi)/(2 * phi), 'c')
    plt.plot(phi, res)
    plt.savefig("ExperimentResult/x-phi-spec/" + str(count) + ".png")
    plt.cla()
    count += 1
