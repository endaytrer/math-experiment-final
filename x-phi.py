import numpy as np
from matplotlib import pyplot as plt

index = 1
delta = 0.01
phi = np.arange(0.001, np.pi-0.001, 0.001)
theta_0 = np.arange(0.01, 2 * np.pi-0.001, 0.01)
for thetaPoint in theta_0:
    res = []
    for phiPoint in phi:
        x = 0
        reflectionAngle = 0
        while ((reflectionAngle > thetaPoint + delta / 2 or reflectionAngle < thetaPoint - delta / 2) and x < 10000):
            reflectionAngle = (reflectionAngle + 2 * phiPoint) % (2 * np.pi)
            x += 1
        res.append(x)
    plt.title("theta_0=" + str(thetaPoint.round(2)))
    plt.yscale('log')
    plt.xlim((0, np.pi))
    plt.ylim((1e0, 1e4))
    plt.plot(phi, res)
    plt.savefig("ExperimentResult/x-phi/" + str(index) + ".png")
    plt.cla()
    index += 1
