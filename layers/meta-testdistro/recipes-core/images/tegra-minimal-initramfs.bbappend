SSTATE_SKIP_CREATION_task-image-complete = "0"
SSTATE_SKIP_CREATION_task-image-qa = "0"
do_image_complete[vardepsexclude] += "rm_work_rootfs"
IMAGE_POSTPROCESS_COMMAND = ""
INITRD_FSTYPES ??= "${INITRAMFS_FSTYPES}"
IMAGE_FSTYPES_forcevariable = "${INITRD_FSTYPES}"
IMAGE_ROOTFS_SIZE = "32768"
ROOTFS_POSTPROCESS_COMMAND_remove = "mender_update_fstab_file;"
ROOTFS_POSTPROCESS_COMMAND_remove = "mender_create_scripts_version_file;"

inherit nopackages
