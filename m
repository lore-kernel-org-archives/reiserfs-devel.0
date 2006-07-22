From: Christian Trefzer <ctrefzer@gmx.de>
Subject: portage tree (Was: Re: reiser4 status (correction))
Date: Sat, 22 Jul 2006 17:40:30 +0200
Message-ID: <20060722154005.GB21976@hermes.uziel.local>
References: <44BFFCB1.4020009@namesys.com> <44C043B5.3070501@slaphack.com> <44C093D2.1040703@namesys.com> <1153514509.6659.41.camel@ipso.snappymail.ca> <44C141C4.1030802@slaphack.com> <1153517853.6659.56.camel@ipso.snappymail.ca> <44C157D2.5060202@slaphack.com> <1153525982.6659.108.camel@ipso.snappymail.ca> <44C191FD.4010302@slaphack.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VuQYccsttdhdIfIP"
Return-path: <reiserfs-list-return-29139-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <44C191FD.4010302@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: David Masover <ninja@slaphack.com>
Cc: Mike Benoit <ipso@snappymail.ca>, Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com, Alexander Zarochentcev <zam@namesys.com>, vs <vs@thebsh.namesys.com>

--VuQYccsttdhdIfIP
Content-Type: multipart/mixed; boundary="SWTRyWv/ijrBap1m"
Content-Disposition: inline


--SWTRyWv/ijrBap1m
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

The portage tree is such a fine testing object since it should be sort
of a "best case scenario" for reiser filesystems, and needs no real
backup in case of a screwup during tests.

I've been on Gentoo for years now, used reiser3 since the days when you
had to patch it into a 2.2 kernel and tried out reiser4 on my portage
tree first of all. During my comparison, reiser3 + notail resulted in
huge amounts of wasted disk space, obviously it is not very smart to use
up a whole 4k block for a file of only few bytes. reiser3 with packed
tails was a lot better, but still it was a remarkable difference from
there to reiser4, and I am only talking storage efficiency here which
directly translates to the amount of I/O necessary to get the same data
all the way to RAM and CPU. The reiser4 dev team did a great job there!

With reiser3, I made another observation wrt. fragmentation, most of
which should be alleviated by reiser4 and its delayed allocation. Over
time, doing package database updates and querying for pending updates to
the local machine became slower. Packing up everything in a tarball,
mkfs, mount with -onoatime, unpack usually fixed the "problem". Since
the performance reduction in reiser4 is a lot less (I can hardly tell if
it makes a difference before vs. after the backup/restore "repacking") I
hardly do it any more, but once in a while I still use my script
initially written for the comparison test.

Attached is the shell script I used for comparing various mount options
for ReiserFS v3 and later v4. It is capable of converting between
ext2|3, reiser3|4 and xfs, provided the target fs stores the data
efficiently enough that everything fits inside. (I had "interesting"
results when moving from reiser3 to ext3 for testing, esp. wrt. portage
tree ; )=20

The script falls short at handling arbitrary mount options, but may be
trivially edited to use any desired options for a single use. Reading
and understanding is recommended before feeding your viable data to it.
I hope somebody may find it useful, or at least inspiring. Any comments
appreciated!

Kind regards,
Chris

--SWTRyWv/ijrBap1m
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: attachment; filename=fsconvert
Content-Transfer-Encoding: quoted-printable

#!/bin/sh

# ! WARNING !
# As always, BE CAREFUL AND KNOW WHAT YOU DO WHEN RUNNING THIS PROGRAM!
# At best, read the code, understand what it does, and take appropriate
# precautions. Backups of valuable data are a requirement anyway, so go=20
# for it BEFORE you try this out!
#
#
# SYNOPSIS:
# fsconvert.sh <fstype> <compression method> <mountpoint>
#=20
# where fstype may be any of ext[2|3], reiser[fs|4] or xfs
# and compression method is a choice of compress, gzip or bzip2.
#
#
# USE:
# This script was initially intended to re-create old reiserfs 3=20
# filesystems for performance reasons, and can reasonably be considered
# useful when run once every year or two for any filesystem under heavy
# read/write load. Simply give the existing filesystem type as the fstype
# argument.
#
# Though it was written for that single purpose at first, it was recently
# adapted for filesystem type migration kind of operations, as it did
# never care about the fs type in the beginning and now takes the
# destination fs type as an argument.
#
# The script REQUIRES the concerned fs to be mounted, to have an entry in
# /etc/fstab, to have no further active mountpoints in a subdirectory,
# enough free disk space in $archdir to back up data and of course the
# required tools (mkfs.<fstype>, tar, compression tool of choice) to do
# all the magic.
#
# Please send any comment, modification, failure report etc. to
# ctrefzer AT gmx DOT de
#
# Have fun!
# Chris

# Changelog:
#
# 2005-10-03
# Enhanced commandline interface to support multiple target file system typ=
es
# and compression methods.
# Filesystems supported so far:
#  - ext2 / 3
#  - reiser 3 / 4
#  - xfs
#=20
# Compression methods which seemed appropriate:
#  - none (uncompressed archive for almost no CPU load)
#  - compress (quite fast even on old machines)
#  - gzip (realtime on new machines, yet impressive I/O reduction)
#  - bzip2 (in case of tight disk space, but takes ages wrt. the others)

### Configure here:

# where to store the archives:
archdir=3D"${PWD}/.fsconvert"


# Sane defaults for compression levels (and guidelines): use fast gzip on=
=20
# modern CPUs where GZIP -3 gives better compression than LZW, yet still at
# realtime, whereas BZIP2 should only be used when disk space is _really_
# critical - it will take forever. LZW (compress) is advised on not-so-rece=
nt
# machines to save some I/O without slowing things down. A nifty compromise
# may be GZIP -1 on P2/P3 class machines.

export GZIP=3D"-1"
export BZIP2=3D"-9"


### No modifications required below here!


### Some helper functions:

function e_report {
	echo -en "${1}..."
}

function e_done {
	# Paranoia is good! It's all about the data...
	sync
	echo " Done."
}

function e_fail {
	echo " FAILED!"
	exit ${1}
}

function e_usage {
	echo "USAGE: ${0} <fstype> <compressiontype> <mountpoint>"
	exit 1
}

if [ -z ${1} ]
then
	e_usage
else
	case ${1} in
		ext2 | ext3 | reiserfs | reiser4 | xfs )
			fstype=3D"${1}"
		;;
	=09
		* )
			e_usage
		;;
	esac
=09
	case ${2} in
		none | compress | gzip | bzip2 )
			compression=3D"${2}"
		;;
	=09
		* )
			e_usage
		;;
	esac
=09
	mountpoint=3D"`echo ${3} | sed -e\"s%/$%%\"`"
	device=3D"`cat /etc/fstab | grep -v ^# | grep "[^[:print:]]${mountpoint}[^=
[:print:]]" | awk '{print \$1}'`"
=09
	if [ -z "${device}" ]
	then
		echo "No device mounted to ${mountpoint} could be found in /etc/fstab!"
		exit 1
	fi
=09
	if [ "$(echo ${device} | wc -l )" !=3D "1" ]
	then
		echo "More than one device was found:"
		echo "${device}"
		exit 1
	fi
=09
	case ${compression} in
		none )
			suffix=3D"tar"
			tar_compression_flag=3D""
		;;
	=09
		compress )
			suffix=3D"tar.Z"
			tar_compression_flag=3D"--${compression}"
		;;
	=09
		gzip )
			suffix=3D"tar.gz"
			tar_compression_flag=3D"--${compression}"
		;;
	=09
		bzip2 )
			suffix=3D"tar.bz2"
			tar_compression_flag=3D"--${compression}"
		;;
	=09
		* )
			echo "Compression type ${compression} not implemented."
			e_fail 1
		;;
	=09
	esac
=09
	archfile=3D"`echo ${mountpoint} | sed -e\"s%/%_%g\"`"
	archive=3D"${archdir}/${archfile}.${suffix}"
	if [ "${fstype}" =3D=3D "xfs" ] && [ "${#mountpoint}" -gt "12" ]
	then
		# xfs labels are max. 12 chars long.
		label=3D"$(basename \"${mountpoint}\")"
	else
		# prefix of /mnt is stripped for use from live CD or initramfs
		label=3D"`echo ${mountpoint} | sed -e\"s%/mnt%/%\" | sed -e\"s%//%/%\"`"
	=09
	fi
=09
	echo -e "Mountpoint to archivate:\t${mountpoint}"
	echo -e "Device to re-format:\t\t${device}"
	echo -e "Compression type:\t\t${compression}"
	echo -e "Archive file:\t\t\t${archive}"
	echo -e "New filesystem type:\t\t${fstype}"
	echo -e "Filesystem label:\t\t${label}"
=09
	e_report "Re-mounting device readonly"
	mount -o remount,ro,noatime,nodiratime "${device}" "${mountpoint}" && e_do=
ne || e_fail 2
=09
	e_report "Preparing archive directory"
	mkdir -p "${archdir}" &&
	touch "${archive}" && e_done || e_fail 2
=09
	e_report "Creating archive"
	tar --create \
		--file "${archive}" \
		${tar_compression_flag} \
		--sparse \
		--one-file-system \
		--preserve-permissions \
		--atime-preserve \
		--absolute-names ${mountpoint} && e_done || e_fail 4
=09
	e_report "Un-mounting the device"
	umount "${mountpoint}" && e_done || e_fail 2
=09
#	e_report "Blanking the device"
#	dd if=3D/dev/zero of=3D"${device}" bs=3D4M &> /dev/null
#	e_done

	e_report "Creating the filesystem"
	case ${fstype} in
=09
		ext2 )
			mkfs.ext2 -q -O dir_index,filetype,sparse_super \
				-L "${label}" "${device}" && e_done || e_fail 8
		;;
	=09
		ext3 )
			mkfs.ext3 -q -O dir_index,filetype,sparse_super,has_journal -j \
				-L "${label}" "${device}" && e_done || e_fail 8
		;;
	=09
		reiserfs )
			mkfs.reiserfs -q --label=3D"${label}" "${device}" >&/dev/null && e_done =
|| e_fail 8
		;;
	=09
		reiser4 )
			mkfs.reiser4 -y --label=3D"${label}" "${device}" >&/dev/null && e_done |=
| e_fail 8
		;;
	=09
		xfs )
			mkfs.xfs -f -q -L "${label}" "${device}" >&/dev/null && e_done || e_fail=
 8
		;;
	=09
		* )
			echo "File system type ${fstype} not implemented."
			e_fail 1
		;;
	=09
	esac
=09
	e_report "Mounting the new filesystem"
	mount -t ${fstype} -o rw,noatime,nodiratime "${device}" "${mountpoint}" &&=
 e_done || e_fail 2
=09
	e_report "Unpacking data again"
	tar --extract \
		--file "${archive}" \
		${tar_compression_flag} \
		--sparse \
		--preserve-permissions \
		--atime-preserve \
		--absolute-names && e_done || e_fail 16
=09
	e_report "Making sure _everything_ gets committed to disk"
	mount -t ${fstype} -o remount,ro,noatime,nodiratime "${device}" "${mountpo=
int}" &&=20
	mount -t ${fstype} -o remount,rw,noatime,nodiratime "${device}" "${mountpo=
int}" &&=20
	e_done || e_fail 2
=09
	e_report "Removing archive"
	rm "${archive}" && e_done || e_fail 4
	rmdir "${archdir}" > /dev/null 2>&1
fi

exit 0

--SWTRyWv/ijrBap1m--

--VuQYccsttdhdIfIP
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.4 (GNU/Linux)

iQIVAwUBRMJG7anY3eLOiwZcAQos+BAAvubqpLDOt8Ig1poG/LO/B2Yo8QgSOK3S
GWkam9gg/PDtlB4kRekcwxYV0cYL+kL9WTUcM0rMXLVUaqincyz7kziWSu92KFT6
3mrYehaNA04FxmppZxSlcrDi5SChKMZqkxFfBibqd39TnjUygUS2ByhxkZzlZiJ5
DiFjmSKmpTdlQw7MHwhSwN9YUTaASKkNy2RagVffy2X4oFy3BcqeEyqVJuV8+Aq1
2VWL1xbTdY463OS+8UiglboIpmXkR5JwZq1Kr9agXwH3LlzDBeYs/7WgJB2hvBRN
N3AHMlJndmyjE63O6AULqcHxYhWDZhi9VSIPOixaB37nphuAQmoue9jZx4P2+KBm
oxLrbeJWS0Pi5p+mgBfgiQtQKdAERUf2Hr5+Yl0oeqkf2IXbNwagTpS2d6XQirMl
iePoj3nIAEyxEMFHC2p4phRxFZxXP4JX1xnFMgeNN6hY3FMF+jkNIK9bxh9DT30s
4iFAKJxwk/po4C2vmJv38qCJ5c46VDQ8M71/FydCJIivp1lsG79l9tUKi26pzLzC
VF3CXuuMO9NHEOSpoVO4fl3o5jxwBd1r+50wZIOz2I8amuuLO4WZHwqJ33f4GvP1
dh8GeFSzL1FJ0flUEUGfaeyvWmWEBTpcF5oIzfv9QClI98XGFXZItNjyMUSuAoTT
ybGqje9gyYQ=
=7AF9
-----END PGP SIGNATURE-----

--VuQYccsttdhdIfIP--

