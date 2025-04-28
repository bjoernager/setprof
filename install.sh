#!/usr/bin/env sh

module="${1}"
base_dir="${2}"

error() {
	echo "error: ${1}"
	echo
}

help() {
	echo "usage:"
	echo "    ./install.sh <module> <base_directory>"
	echo
	echo "modules:"
	echo "    base       the \`setprof\` executable"
	echo "    systemd    systemd services"
	echo
	echo "For the \`base\` module, \`base_directory\` corresponds to the executable directory"
	echo "(e.g. \"/usr/bin/\"). For \`systemd\`, it instead corresponds to the systemd direc-"
	echo "tory (e.g. \"/usr/lib/systemd/\")."
}

if [ -z "${module}" ]
then
	error "missing module"
	help

	exit 2
fi

if [ -z "${base_dir}" ]
then
	error "missing base directory"
	help

	exit 2
fi

notify() {
	echo "${@}"
	"${@}"
}

echo "installing \`${module}\` module..."
echo

if [ "${module}" = "base" ]
then
	notify mkdir -pm755 "${base_dir}"

	notify install -m755 "setprof" "${base_dir}/setprof"
elif [ "${module}" = "systemd" ]
then
	notify mkdir -pm755 "${base_dir}/system"

	notify install -m644 "systemd/setprof-3d.service"   "${base_dir}/system/setprof-3d.service"
	notify install -m644 "systemd/setprof-idle.service" "${base_dir}/system/setprof-idle.service"
	notify install -m644 "systemd/setprof-vr.service"   "${base_dir}/system/setprof-vr.service"
else
	echo "unknown module \`${module}\`"
fi
