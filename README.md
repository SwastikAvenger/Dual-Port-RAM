# Introduction to RAM
RAM (Random Access Memory) is the primary volatile memory in a computing system. It serves as a high-speed, temporary workspace where the processor stores data it 
needs to access quickly. The term **random access** means the processor can read or write to any individual memory location directly in the same amount of time, 
regardless of its physical position. Internally, RAM is organized as an array of storage cells, where each cell holds a bit of data. This array is managed by row 
and column decoders, allowing specific memory locations (addresses) to be targeted. 

## Types of RAM
Before diving into the code, let us clear up two important classifications of RAM. The Random Access Memory, based on the data input and data output port, is broadly
classified into two types - 
1. Single Port RAM
2. Dual Port RAM

### Single Port RAM
A Single-Port RAM features exactly one memory access port. This means it shares a single set of address lines, data lines, and control signals for both reading and 
writing operations. It can perform Read and Write Operations but not both simultaneously. This makes it consume less power and lesser floor area, but with limited
throughput. It creates a performance bottleneck in systems where simultaneous data production and consumption are required.

### Dual Port RAM
A Dual-Port RAM on the other hand, provides us with two different ports, one for reading data and one for writing data. Both the ports can have their own clock or they
can use the same clock, but operate independently. The Read and Write operations operate independently and are gated by the Read Enable and Write Enable respectively.
A Dual-Port RAM significantly increases data throughput. It is ideal for bridging different clock domains (Asynchronous FIFOs) or handling simultaneous data tasks, 
such as a CPU writing video data while a graphics controller reads it. But there is larger silicon area (roughly double the routing and control logic of single-port)
and higher power consumption.

#### Understanding the Code
The provided code generates a 8 x 16 Dual Port RAM. Here, the RAM has 16 different locations, and each location can store upto 8 bits of data. The Write Logic has the 
write clock, write enable and the data write port (input port, 8-bit wide). The Read Logic has the read clock, read enable and the data read port (output port, 8-bit 
wide). Internal registers have been initialised to keep a count of the memory address for the write and read operation seperately. At every positive edge of the write 
read clock, if the write and/or read enable is high, then the corresponding write and/or read operation takes place independently. The size of the DPRAM can be 
modified to match the system requirements. Also, here we have labelled and used two different clocks, one for read port, one for write. If required, one can use the
same clock to drive both the input and output logic. 

This code is free to use for a reference. Feel free to use this code as reference to build your own Dual Port RAM.
