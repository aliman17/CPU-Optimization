# PARAMETERS
iteration_flops = 2
peak_perf = 2  # 2 flops per cycle
# Load files

# Cycles
f = open('num_of_cycles.txt', 'r')
lines = f.readlines()
cycles = list(map(float, lines))
f.close()

# Size
f = open('n.txt', 'r')
lines = f.readlines()
ns = list(map(int, lines))
f.close()

#print(cycles)
#print(ns)

measured_flops = [iteration_flops*n for n in ns]
measured_flops_per_cycle = [f/c for f,c in zip(measured_flops, cycles)]
#print(measured_flops_per_cycle)

# Performance in %
print('Cycle per issue')
for fc in measured_flops_per_cycle:
    print(1/fc)

print('Procentage')
for fc in [fc / peak_perf for fc in measured_flops_per_cycle]:
    print(fc)
