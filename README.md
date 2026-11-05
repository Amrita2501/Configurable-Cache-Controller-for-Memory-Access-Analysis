<<<<<<< HEAD
# Configurable Cache Controller for Memory Access Analysis

## Overview

This project implements and evaluates configurable cache architectures using Verilog RTL. The work focuses on cache hit/miss behavior, associativity, workload analysis, memory latency impact, and IPC estimation through simulation-driven performance evaluation.

The project was developed using open-source tools including Icarus Verilog, GTKWave, Python, Pandas, and Matplotlib.

---

## Features

### Direct-Mapped Cache

* Tag comparison logic
* Valid bit management
* Cache hit/miss detection
* Performance statistics collection

### 2-Way Set Associative Cache

* Two cache ways per set
* LRU-based replacement behavior
* Reduced conflict misses
* Improved cache utilization

### Performance Analysis

* Sequential workload analysis
* Random workload analysis
* Conflict workload analysis
* Hit rate and miss rate calculation
* Memory latency modeling
* IPC estimation
* Bottleneck classification

---

## Cache Organization

### Direct-Mapped Cache

* Cache Size: 4 KB
* Cache Line Size: 64 Bytes
* Number of Cache Lines: 64

Address Format:

| Tag     | Index  | Offset |
| ------- | ------ | ------ |
| 20 bits | 6 bits | 6 bits |

### 2-Way Set Associative Cache

* Cache Size: 4 KB
* Cache Line Size: 64 Bytes
* Number of Sets: 32
* Ways per Set: 2

Address Format:

| Tag     | Index  | Offset |
| ------- | ------ | ------ |
| 21 bits | 5 bits | 6 bits |

---

## Workloads

### Sequential Access Pattern

Simulates contiguous memory accesses.

### Random Access Pattern

Simulates accesses with poor spatial and temporal locality.

### Conflict Access Pattern

Simulates multiple addresses mapping to the same cache set, creating conflict misses.

---

## Results

### Direct-Mapped Cache

| Metric   | Value |
| -------- | ----- |
| Accesses | 6     |
| Hits     | 0     |
| Misses   | 6     |
| Hit Rate | 0%    |

### 2-Way Set Associative Cache

| Metric   | Value  |
| -------- | ------ |
| Accesses | 6      |
| Hits     | 4      |
| Misses   | 2      |
| Hit Rate | 66.67% |

### Observation

The 2-way set associative cache significantly reduced conflict misses by allowing multiple blocks to coexist within the same set.

---

## Performance Analysis

Memory Model:

* Cache Hit Latency = 1 Cycle
* Memory Miss Latency = 50 Cycles

IPC Estimation:

* Sequential IPC = 0.980
* Random IPC = 0.971
* Conflict IPC = 0.971
* 2-Way Cache IPC = 0.990

---

## Waveforms

### Direct-Mapped Cache

screenshots/waveform_basic_cache.png

### 2-Way Set Associative Cache

screenshots/waveform_2way_cache.png

---

## Tools Used

* Verilog
* Icarus Verilog
* GTKWave
* Python
* Pandas
* Matplotlib
* Ubuntu WSL

---

## Future Improvements

* Multi-level cache hierarchy
* Memory controller model
* DRAM latency model
* Refresh-aware memory behavior
* Multi-core cache coherence analysis
=======
# Configurable-Cache-Controller-for-Memory-Access-Analysis
Designed and implemented configurable Direct-Mapped and 2-Way Set-Associative cache architectures using Verilog RTL. Evaluated cache performance by analyzing hit/miss rates, conflict misses, memory latency, IPC, and workload bottlenecks through simulation, GTKWave waveform analysis, and Python-based performance evaluation.

