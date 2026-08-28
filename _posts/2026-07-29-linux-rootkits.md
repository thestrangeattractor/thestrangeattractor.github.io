---
layout: post
title: "Linux Kernel Rootkit Detection Methods"
date: 2026-07-29 00:00:00 +0000
category: "Linux Forensics"
read_time: "10 min read"
---

Linux rootkits have evolved from simple LD_PRELOAD hijacks to sophisticated kernel modules 
that directly manipulate system call tables. This post covers practical techniques for 
detecting and analyzing kernel-level compromise on Linux systems.

<!--more-->

## Types of Linux Rootkits

Understanding the rootkit type is the first step to detection:

* **Userland rootkits** — LD_PRELOAD, ptrace-based, shared library injection
* **Kernel module (LKM) rootkits** — Loadable kernel modules that patch syscall tables
* **BPF-based rootkits** — eBPF programs that hook kernel functions
* **Firmware/BIOS rootkits** — Persistent across OS reinstalls (rare but real)

## Detection Techniques

### 1. System Call Table Integrity

Compare the current syscall table against a known-good baseline:

```bash
# Check for hooked syscalls
cat /proc/kallsyms | grep sys_call_table
# Compare with known hash or baseline
```

### 2. Kernel Module Verification

```bash
# List loaded modules
lsmod
# Check module signatures
modinfo <module_name>
```

### 3. Live Response with Volatility

For memory dumps, Volatility's Linux plugins can reveal:

* Hidden kernel modules
* Modified system call handlers
* Unlinked processes

### 4. eBPF-Based Monitoring

Ironically, the same technology used by rootkits can be used to detect them. 
eBPF programs can monitor for:

* Unexpected kernel module loads
* Syscall table modifications
* Hidden processes via kernel-level enumeration

## The Shadow in the Kernel

Kernel-level detection is challenging because the rootkit has the same privilege 
level as your detection tools. This is why offline analysis of memory dumps and 
hardware-assisted monitoring (Intel PT, ARM CoreSight) are becoming essential 
for high-assurance environments.
