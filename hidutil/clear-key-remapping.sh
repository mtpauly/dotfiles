#!/usr/bin/env bash
set -euo pipefail

hidutil property --matching '{"VendorID":0,"ProductID":0}' --set '{"UserKeyMapping":[]}'
