# processor_vhdl

### What is a Microcode?
Microcode is a computer hardware technique that interposes a layer of organisation between the CPU hardware and the programmer-visible instruction set architecture of the computer. As such, the microcode is a layer of hardware-level instructions that implement higher-level machine code instructions or internal state machine sequencing in many digital processing elements.

Microcode typically resides in special high-speed memory and translates machine instructions, state machine data or other input into sequences of detailed circuit-level operations. It separates the machine instructions from the underlying electronics so that instructions can be designed and altered more freely. It also facilitates the building of complex multi-step instructions, while reducing the complexity of computer circuits. Writing microcode is often called microprogramming and the microcode in a particular processor implementation is sometimes called a microprogram. 

### Implentation
I implemented a Microcoded Instruction Set Processor. This processor can perform basic arithmetic, logic and shifting operations as well as conditional and unconditional branching. Users can enter their machine code into memory and the micro-controller will perform these instructions.

Here is a schematic of the processor I implemented:

![Processor](https://github.com/EZCodes/Computer_Architecture_Processor/blob/master/Diagram.PNG)


