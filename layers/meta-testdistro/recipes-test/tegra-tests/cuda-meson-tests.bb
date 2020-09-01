# Copyright (C) 2020 Matt Madison <madison@legion>
# Released under the MIT License (see COPYING.MIT for the terms)
DESCRIPTION = "Test"
LICENSE = "CLOSED"
DEPENDS = "${@' '.join(['cuda-meson-test-%02d' % i for i in range(1,13)])}"
