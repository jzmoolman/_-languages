#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2024.1 (64-bit)
#
# Filename    : simulate.sh
# Simulator   : AMD Vivado Simulator
# Description : Script for simulating the design by launching the simulator
#
# Generated by Vivado on Sat Feb 08 20:36:38 MST 2025
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
echo "xsim led_toggle_project_TB_behav -key {Behavioral:sim_1:Functional:led_toggle_project_TB} -tclbatch led_toggle_project_TB.tcl -log simulate.log"
xsim led_toggle_project_TB_behav -key {Behavioral:sim_1:Functional:led_toggle_project_TB} -tclbatch led_toggle_project_TB.tcl -log simulate.log

