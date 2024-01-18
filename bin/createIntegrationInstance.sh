#!/bin/bash
usage() {
    echo "Usage : " $(basename "$0") "-b <byol> -m <message_packs> -s <shape> -t <type> <Compartment_OCID> <Instance_Name>" >&2
    echo "         Create an OIC instance with the name in the given compartment OCID" >&2
    echo "         Compartment_OCID is the compartment from which to list instances" >&2
    echo "         -b byol (Bring your own license) is true (BPM Suite licenses for ENTERPRISE and SOA Suite licenses for STANDARD) or false" >&2
    echo "         -m message_packs is number of message packs" >&2
    echo "         -s shape is DEVELOPMENT or PRODUCTION" >&2
    echo "         -t type (edition) is STANDARD or ENTERPRISE" >&2
    echo "         Command docs https://docs.oracle.com/en-us/iaas/tools/oci-cli/3.37.1/oci_cli_docs/cmdref/integration/integration-instance/create.html" >&2
    exit 2
}
OPTIONS=
EDITION=ENTERPRISE
BYOL=false
MP=1
while getopts ":t:b:m:hs:" OPT ; do
    case "${OPT}" in
        b) ;&
        m) ;&
        s) ;&
        t)
            if [[ $OPTARG == -* ]] ;
                then
                    echo "Value expected for -$OPT" >&2
                    usage
            fi
            ;;
    esac
    case "${OPT}" in
        b)
            BYOL=$OPTARG
            ;;
        h)
            usage
            ;;
        m)
            MP=$OPTARG
            ;;
        s)
            OPTIONS="$OPTIONS --shape $OPTARG"
            ;;
        t)
            EDITION=$OPTARG
            ;;
        ?)
            echo "Unknown option " $OPTARG >&2
            usage
            ;;
        :)
            echo "Value expected for " $OPT >&2
            usage
            ;;
    esac
done
shift "$(($OPTIND -1))"
case $# in
    0)
        echo "Missing compartment and name" >&2
        usage
        ;;
    1)
        echo "Missing name" >&2
        usage
        ;;
esac
if [ $# -ne 2 ]
    then
        echo "Too many arguments" >&2
        usage
fi
oci integration integration-instance create --compartment-id $1 --display-name $2 --is-byol $BYOL --message-packs $MP --type $EDITION $OPTIONS