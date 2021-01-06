import numpy as np
from matplotlib import pyplot as plt

index = 1
deltaSet = np.arange(0.01, np.pi-0.01, 0.01)
phi = np.arange(0.001, np.pi-0.001, 0.001)
thetaPoint = 1.5
for delta in deltaSet:
    res = []
    for phiPoint in phi:
        x = 0
        reflectionAngle = 0
        while ((reflectionAngle > thetaPoint + delta / 2 or reflectionAngle < thetaPoint - delta / 2) and x < 10000):
            reflectionAngle = (reflectionAngle + 2 * phiPoint) % (2 * np.pi)
            x += 1
        res.append(x)
    plt.title("delta=" + str(delta.round(2)))
    plt.yscale('log')
    plt.xlim((0, np.pi))
    plt.ylim((1e0, 1e4))
    plt.plot(phi, res)
    plt.savefig("ExperimentResult/x-delta/" + str(index) + ".png")
    plt.cla()
    index += 1
