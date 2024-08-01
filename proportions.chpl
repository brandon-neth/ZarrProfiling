use Zarr;
use Time;
use Map;
const chunkShape = (1,100,136,23);
const storePath = "/pscratch/sd/s/sbachman/chapel_experiments/offline_BGC/Zarr/ZARR_STORES/Iceland1_avg.20120402000000.zarr1/v";
writeln("storePath: ", storePath);

var s: stopwatch;


s.restart();
var A = readZarrArrayLocal(storePath, real(32), 4);
s.stop();
var firstWallTime = s.elapsed();
var firstRes: map(string, real);
for (key,time) in zarrProfilingResults() {
  firstRes[key] = time;
}

var firstSum = 0.0;
for (key,time) in zarrProfilingResults() do firstSum += time;

for (key,time) in zarrProfilingResults() {
  writeln(key, " Fraction: ", time / firstSum);
}



/*
s.restart();
var B = readZarrArrayLocal(storePath, real(32), 4);
s.stop();
var secondWallTime = s.elapsed();

var totalTime

for (key,time) in zarrProfilingResults() {
  writeln(key, ": ", firstRes[key], " -> ", time, " | ", firstRes[key] / time);
}

writeln("Total: ", firstWallTime, " -> ", secondWallTime, " | ", firstWallTime / secondWallTime);
*/
