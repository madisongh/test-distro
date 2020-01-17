DIGSIG_SERVER ??= "http://127.0.0.1:9999"
DIGSIG_SERVER[vardepvalue] = ""
DIGSIG_REST_ENDPOINT ??= ""
DIGSIG_DEPS = "curl-native:do_populate_sysroot"

digsig_post() {
    [ -n "${DIGSIG_REST_ENDPOINT}" ] || exit 1
    curl --silent --fail -X POST "$@" "${DIGSIG_SERVER}${DIGSIG_REST_ENDPOINT}"
}
