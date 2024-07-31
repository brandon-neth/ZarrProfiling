use Zarr;
use Time;

const chunkShape = (1,100,136,23);
const storePath = "/pscratch/sd/s/sbachman/chapel_experiments/offline_BGC/Zarr/ZARR_STORES/Iceland1_avg.20120402000000.zarr0/temp";

var A = readZarrArrayLocal(storePath, real(32), 4);

writeZarrArrayLocal("compression0", A, chunkShape, bloscLevel=0);
writeZarrArrayLocal("compression5", A, chunkShape, bloscLevel=5);
writeZarrArrayLocal("compression9", A, chunkShape, bloscLevel=9);

