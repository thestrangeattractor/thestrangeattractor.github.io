---
layout: post
title: "Detecting EDR Evasion Techniques in the Wild"
date: 2026-08-18 00:00:00 +0000
category: "Research"
read_time: "8 min read"
---

Modern endpoint detection and response (EDR) tools have become a cornerstone of defensive security, 
but adversaries have developed increasingly sophisticated methods to blind, bypass, or disable them. 
In this post, we examine real-world EDR evasion techniques observed in recent campaigns and discuss 
how defenders can detect and mitigate them.

<!--more-->

## Common Evasion Categories

EDR evasion techniques generally fall into several categories:

* **Unhooking** — Removing or replacing EDR user-mode hooks in system DLLs
* **Direct syscalls** — Bypassing monitored APIs by calling the kernel directly
* **EDR blindfolding** — Manipulating callback routines or event subscriptions
* **Process herpaderping / ghosting** — Hiding malicious code behind legitimate-looking process images

## Detecting the Detectors

The irony of EDR evasion is that the act of evading often generates its own telemetry. 
When an attacker unhooks `ntdll.dll` or starts making direct syscalls, they create behavioral 
anomalies that can be detected through:

* **Kernel callback monitoring** — Registering custom callbacks for process/thread creation
* **ETW (Event Tracing for Windows) subscriptions** — Capturing events that EDR might miss
* **Memory integrity checks** — Periodically validating known-good hook states

Stay vigilant — the arms race never stops.
