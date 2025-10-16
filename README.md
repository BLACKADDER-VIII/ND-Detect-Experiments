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

chain_matching.ipynb: This file implements the Meta Process-Graph heuristic. Update the graph file I/O in block 3. Use the hyperparameter settings in Block 5.
For message race and amg2013: rev=False, norm_sens_high = False, lcs = False, num_proc = # of processes in the event graph
For MCB Grid: rev = True, norm_sens_high = True, lcs = True, num_proc = # of processes in the event graph

GAE_updt.ipynb implements the graph auto-encoder benchmark. Set the graph I/O in block 2 and the hyperparameters for number of processes (NUM_PROCS), number of training epochs (NUM_EPOCHS) and number of experiments (NUM_EXPS).
