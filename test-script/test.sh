#!/bin/bash

CUR_SCRIPT_DIR=$(dirname "$0")

dart run $CUR_SCRIPT_DIR/../bin/eu_tire_label.dart generate \
    --qrcode "http://eprel.eu/624150" \
    --trademark "MICHELINE" \
    --tire-size "P215/65 R15" \
    --tire-type "WINTER" \
    --tire-class 1 \
    --fuel-efficiency B \
    --wet-grip E \
    --rolling-noise 2 \
    --rolling-noise-db 72 \
    --snow-grip --ice-grip --format EU2020 \
    --output "$CUR_SCRIPT_DIR/tire-label-EU-2020-740.svg"