From: "David Dabbs" <david@dabbs.net>
Subject: mongo.pl PHASE_* options question
Date: Thu, 22 Jul 2004 15:28:10 -0500
Message-ID: <20040722203115.2922715E03@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19751-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: reiserfs-list@namesys.com


I=92d like to reproduce the mongo tests as shown at=20

	http://www.namesys.com/benchmarks/v4marks.html

The page presents the mongo options used to generate the results, but =
not
all of these are documented at=20

	http://www.namesys.com/benchmarks/mongo_readme.html

,and they are not mentioned in the mongo distribution README.


FSTYPE=3D ext3 | reiserfs | reiser4
MKFS=3D mkfs.<FSTYPE>

DEV=3D/dev/hda2   (or whatever disk device)=20
DIR=3D/mnt/testfs (mountpoint you must create)
FILE_SIZE=3D4000=20
BYTES=3D512000000=20
#
# To have results free from buffer cache influence,=20
# settings must satisfy=20
#
#    BYTES * REP_COUNTER > ramsize
#

MOUNT_OPTIONS=3D<fs-specific mount options passed to MKFS command>

NPROC=3D1
REP_COUNTER=3D1=20
SYNC=3Doff=20
WRITE_BUFFER=3D131072=20
GAMMA=3D0.2=20

DD_MBCOUNT=3D768

#
# these are not documented
#
PHASE_COPY=3Dcp=20
PHASE_OVERWRITE=3Doff=20
PHASE_APPEND=3Doff=20
PHASE_READ=3Dfind=20
PHASE_DELETE=3Drm=20
PHASE_MODIFY=3Doff


A quick scan of mongo.pl code that validates options shows that the =
PHASE_*
options are not present, so it is safe to assume that the PHASE* options =
are
defunct. If this is the case, perhaps these options should be removed =
from
the page.

David


# description of all valid options which can be in an input file is a
# hash array each element of it has the following form:=20
# "key" =3D> ["default value", flags, comment string]

%OPTIONS =3D (
"FSTYPE"  =3D> [ undef, $SHOULD_BE_SET, "filesystem type"],
"DIR"     =3D> [ undef, $SHOULD_BE_SET, "fs mount point"],
"MKFS"    =3D> [ undef, 0, "mkfs command"],
"DEV"     =3D> [ undef, $SHOULD_BE_SET, "device file name"],
"JOURNAL_DEV"  =3D> [ undef, 0, "journal device file name"],
"JOURNAL_SIZE" =3D> [ undef, 0, "journal size in 4K blocks"],
"MOUNT_OPTIONS" =3D> [ undef, 0, "mount options"],
"BYTES" =3D> [ undef, $SHOULD_BE_SET, "file set size (in bytes) created =
by all
instances of reiser_fract_tree in one pass, "],
"FILE_SIZE" =3D> [ undef, $SHOULD_BE_SET, "median file size (a
reiser_fract_tree parameter)"],
"REP_COUNTER" =3D> [3, 0, "number of passes for each mongo phase"],
"NPROC" =3D> [3, 0, "munber of processes running simultaneously"],
"WRITE_BUFFER" =3D> [4096, 0, "read/write buffer size parameter for =
mongo
utilities"],=20
"GAMMA" =3D> ["0.0", 0, "the exponent of core distribution in
reiser_fract_tree"],
"SYNC" =3D> [off, 0, "using O_SYNC/fsync options to iozone"],
"DD_MBCOUNT" =3D> [undef, 0, "size of largefile in megabytes"]
=A0
=A0



