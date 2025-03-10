#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2024.1 (64-bit)
#
# Filename    : simulate.sh
# Simulator   : AMD Vivado Simulator
# Description : Script for simulating the design by launching the simulator
#
# Generated by Vivado on Tue Feb 11 09:52:34 MST 2025
# SW Build 5076996 on Wed May 22 18:36:09 MDT 2024
#
# Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
# Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
#
# usage: simulate.sh
#
# ****************************************************************************
set -Eeuo pipefail
# simulate design
echo "xsim ram_2port_tb_behav -key {Behavioral:sim_1:Functional:ram_2port_tb} -tclbatch ram_2port_tb.tcl -log simulate.log"
xsim ram_2port_tb_behav -key {Behavioral:sim_1:Functional:ram_2port_tb} -tclbatch ram_2port_tb.tcl -log simulate.log

