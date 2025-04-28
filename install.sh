#!/usr/bin/env sh

base_dir="${1}"

help() {
	echo "usage:"
    echo "    ./install.sh <base_directory>"
}

if [ -z "${base_dir}" ]
then
    echo "missing base directory"
	echo

	help

	exit 2
fi

notify() {
	echo "${@}"
	"${@}"
}

notify mkdir -pm755 "${base_dir}/usr/lib/systemd/system"
notify mkdir -pm755 "${base_dir}/usr/bin"

notify install -m644 "systemd/setprof-3d.service"   "${base_dir}/usr/lib/systemd/system/setprof-3d.service"
notify install -m644 "systemd/setprof-idle.service" "${base_dir}/usr/lib/systemd/system/setprof-idle.service"
notify install -m644 "systemd/setprof-vr.service"   "${base_dir}/usr/lib/systemd/system/setprof-vr.service"
notify install -m755 "setprof"                      "${base_dir}/usr/bin/setprof"
