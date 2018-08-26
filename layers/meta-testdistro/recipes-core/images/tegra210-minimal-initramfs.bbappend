SSTATE_SKIP_CREATION_task-image-complete = "0"
do_image_complete[vardepsexclude] += "rm_work_rootfs"
IMAGE_POSTPROCESS_COMMAND = ""
IMAGE_FSTYPES_remove = "tegraflash"
