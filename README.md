# Event Graph Alignment

## Introduction

Scientific high performance computing (HPC) applications employ asynchronous executions of MPI calls to improve
scalability and performance. The asynchronous calls can lead to non-determinism (ND) in execution, particularly for
large exascale simulations. In order to ensure reproducibility and facilitate error detection, it is imperative to identify
the sources of non-determinism. Message ND that occurs when the order in which a process sends or receives MPI
communication, or executes MPI calls varies across different runs of the same application. We model the MPI calls
in the execution as an event graph. The regions of dissimilarity between two event graphs indicate the sources of
non-determinism in the MPI calls. Thus by aligning the nodes of the event graphs, we can identify sources of ND.
We show that traditional alignment techniques such as NetAlign and learning methodologies such as Graph
Autoencoders are not able to align graphs with high accuracy due to the nearly regular degree and large diameter
of event graphs. Therefore, we propose a meta graph heuristic that exploits structural properties of event graphs, by
combining the set of nodes representing sequences of MPI calls within the same processor as a meta node. We align
the meta graphs formed from these meta nodes, and then align the individual nodes within the meta nodes. Our results
over three different MPI applications highlight that our meta graph heuristic has better accuracy and scales to large
graphs compared to network alignment and graph auto encder methods.

## Dependencies

Once the repository has been cloned into your machine, enter the root directory of the project for setup.

```
. setup.sh
```

The dependencies for the project are in requirements.txt. The system must have python3 installed.

## Running Meta Graph Heuristic

Open
```
/meta-graph-heuristic/chain_matching.ipynb
```
This file implements the Meta Process-Graph heuristic. 
### Environment Setup
* Update the graph file I/O in block 3. 
* Use the hyperparameter settings in Block 5.
* For message race and amg2013: rev=False, norm_sens_high = False, lcs = False, num_proc = # of processes in the event graph
* For MCB Grid: rev = True, norm_sens_high = True, lcs = True, num_proc = # of processes in the event graph
```
Hyperparameters:
rev             true (runs backward pass) | false (runs forward pass)
norm_sens_high  true (Uses high sensitivity polynomial)
lcs             whether to use (true) Longest Common Substring or (false) String Matching for thresholding criterion
num_proc        Number of processes in the event graph. Needed to make accurate meta graph
```
## Benchmarks for GAE and NetAlign

### Graph Auto Encoder
Open
```
/GAE/GAE_updt.ipynb
```
GAE_updt.ipynb implements the graph auto-encoder benchmark. 
#### Hyperparameter Setup
In Block 2
* Set the graph I/O in nx.read_graphml("YOUR_GRAPHML_FILE")
* NUM_PROCS:  Number of processes
* NUM_EPOCHS: Number of training epochs
* NUM_EXPS:   Number of experiments

### NetAlign
Visit [https://www.cs.purdue.edu/homes/dgleich/codes/netalignmc/]

## Publication
The theory and the artifacts of this project has been explained in the paper "Application of Graph Alignment Techniques for Identifying Sources of Non-Determinism in MPI Simulations" D. Pandey, J. Marquez, S. Bhowmick, M. Taufer in the International Journal of High Performance Computing Applications (IJHPCA accepted).

## Acknowledgements
This work has been partially funded by NSF CCF grant #1900888 and #1900765.
