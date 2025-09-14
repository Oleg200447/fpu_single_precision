# FPU Pipelined Processor Simulation

This is an educational project aimed at exploring the **pipelined architecture of processors**. In this project, the processor is described in a **structured format**.  

The project was inspired by early **mathematical coprocessors (FPUs)**, such as the **Intel 8087**, which used a **register stack** to store operands.  

---

## Pipelined Architecture

The processor implements a pipelined architecture with the following main stages:

1. **Instruction decoding**  
2. **Operand selection**  
3. **Operation execution**  
4. **Writing results to memory**  

### Functional Scheme
<img width="837" height="646" alt="Functional Scheme" src="https://github.com/user-attachments/assets/67f42b40-6b55-4390-a547-42d17871546f" />

---

## Supported Operations

The processor can perform the following operations:

- **Addition**
- **Subtraction**
- **Multiplication**

### Instruction Set
The complete list of instructions is shown below:

**Addition**

0000: ST(0) = ST(0) + ST(1)      ++TOP   command: 00000000  
0001: ST(0) = ST(0) + [RAM]      ++TOP   command: 00000001  16-bit-mmr  
0010: ST(a) = ST(a) + ST(0)             command: 00000010  3-bit(a) 00000  

**Subtraction**

0011: ST(0) = ST(0) - ST(1)      ++TOP   command: 00000011  
0100: ST(0) = ST(0) - [RAM]      ++TOP   command: 00000100  16-bit-mmr  
0101: ST(a) = ST(a) - ST(0)             command: 00000101  3-bit(a) 00000  

**Multiplication**

0110: ST(0) = ST(0) * ST(1)      ++TOP   command: 00000110  
0111: ST(0) = ST(0) * [RAM]      ++TOP   command: 00000111  16-bit-mmr  
1000: ST(a) = ST(a) * ST(0)             command: 00001000  3-bit(a) 00000  

**Other Operations**

1001: ST(0) = ST(0)               ++TOP   command: 00001001  
1010: ST(0) = [RAM]               ++TOP   command: 00001010  16-bit-mmr  
1011: ST(0) = ST(a)               ++TOP   command: 00001011  3-bit(a) 00000  
1100: [RAM] = ST(0)                     command: 00001100  16-bit-mmr  
1101: ST(a) = ST(0)                     command: 00001101  3-bit(a) 00000 

---
