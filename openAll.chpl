use Zarr;
use Time;
use Map;
use FileSystem;
use Path;
use IO;
use List;
const chunkShape = (1,100,136,23);
const storePath = "/pscratch/sd/s/sbachman/chapel_experiments/offline_BGC/Zarr/ZARR_STORES/Iceland1_avg.20120402000000.zarr1/v";
writeln("storePath: ", storePath);

var s: stopwatch;


s.restart();
var filenames: list(string);
for filename in listDir(storePath) do filenames.pushBack(filename);

forall filename in filenames {
  var path = joinPath(storePath, filename);
  var f = open(path, ioMode.r);
  var r = f.reader(deserializer = new binarySerializer(), locking=false);
  const c = r.readAll(bytes);
}

s.stop();
var firstWallTime = s.elapsed();
writeln("Opening Files First Walltime: ", firstWallTime);


//writeln("Total: ", firstWallTime, " -> ", secondWallTime, " | ", firstWallTime / secondWallTime);
