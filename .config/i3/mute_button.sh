#!/bin/bash

amixer -q sset Master toggle

amixer sget Master | grep -q -P '^\s+Mono: .* \[on\]'
master_result=$?

amixer sget Speaker | grep -q -P '^\s+Mono: .* \[on\]'
speaker_result=$?

[[ $master_result -eq $speaker_result ]] || amixer -q sset Speaker toggle
