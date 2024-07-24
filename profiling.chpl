use Zarr;
use Time;

const chunkShape = (1,100,136,23);
const storePath = "/pscratch/sd/s/sbachman/chapel_experiments/offline_BGC/Zarr/ZARR_STORES/Iceland1_avg.20120402000000.zarr0/temp";

writeln("Task Count: ", dataParTasksPerLocale);

var s: stopwatch;

resetZarrProfiling();

s.restart();

for i in 1..1 do var A = readZarrArrayLocal(storePath, real(32), 4);

s.stop();
writeln("Wall Time: ", s.elapsed());

for (key,time) in zarrProfilingResults() {
  writeln(key, ": ", time);
}
