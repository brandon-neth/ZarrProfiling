use Subprocess;
use List;
var outs: list(string);
for version in ["before", "after"] {
  for numReads in [1,10] {
    const command = ["./" + version, "-nl3", "--numReads="+numReads:string];
    writeln(" ".join(command));
    var sub = spawn(command,stdout=pipeStyle.pipe);
    var output = sub.stdout.readAll(string);
	outs.pushBack(output);
	writeln(output);
  }
  
}
