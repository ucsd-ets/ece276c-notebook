#!/usr/bin/env bash

xvfb-run -s "-screen 0 1400x900x24" jupyter notebook "$@"