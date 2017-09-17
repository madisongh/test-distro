do_preconfigure_append() {
    # Linaro patches these in, which interferes with the modifications done for the ${B} copy
    cmd = d.expand("sed -i -e'/^#define STANDARD_STARTFILE_PREFIX/d' ${S}/gcc/defaults.h")
    subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
}
