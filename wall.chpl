use Zarr;
use Time;

const chunkShape = (1,100,136,23);
config const numReads = 10;

coforall loc in Locales do on loc {
  const storePath = "/pscratch/sd/s/sbachman/chapel_experiments/offline_BGC/Zarr/ZARR_STORES/Iceland1_avg.20120402000000.zarr" + here.id:string + "/temp";

  var s: stopwatch;
  s.restart();

  for i in 1..numReads do var A = readZarrArrayLocal(storePath, real(32), 4);
  
  writeln("Average Wall Time, Locale ", here.id, ": ", s.elapsed() / numReads);
}

if zarrProfiling then
  for (key, time) in zarrProfilingResults() do writeln(key, ":", time);

