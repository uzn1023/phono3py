import h5py
import matplotlib.pyplot as plt

f = h5py.File("kappa-m111111.hdf5")
list(f)

temp = f['temperature'][:]
kappa = f['kappa'][:,1]

plt.plot(temp,kappa)
plt.xlim(200,900)
plt.ylim(25,200)

plt.xlabel("Temperature [K]")
plt.ylabel("Thermal conductivity [W/mK]")

plt.savefig("thermalcond.png")
plt.show()