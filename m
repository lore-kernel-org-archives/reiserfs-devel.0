From: Christian Jaeger <christian.jaeger@ethlife.ethz.ch>
Subject: reiserfsck does not work on LVM snapshots
Date: Tue, 23 Mar 2004 03:50 +0100
Message-ID: <E1B5c0R-00060F-00@deer.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-17396-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello,

I noticed that one cannot reiserfsck lvm snapshot devices (and neither can =
we --check mounted partitions, sadly). Details below.

Thanks for any improvements,
Christian.


Debian testing,
reiserfsprogs                 3.6.13-1
linux 2.4.25(kernel.org) + grsecurity 1.9.14 + vserver 1.3.8
athlon processor

# lvcreate --snapshot -L1G -n snap1  /dev/mirrorvg/mirrorroot
# reiserfsck --check --no-journal-available snap1=20
reiserfsck 3.6.13 (2003 www.namesys.com)

*************************************************************
** If you are using the latest reiserfsprogs and  it fails **
** please  email bug reports to reiserfs-list@namesys.com, **
** providing  as  much  information  as  possible --  your **
** hardware,  kernel,  patches,  settings,  all reiserfsck **
** messages  (including version),  the reiserfsck logfile, **
** check  the  syslog file  for  any  related information. **
** If you would like advice on using this program, support **
** is available  for $25 at  www.namesys.com/support.html. **
*************************************************************

Will read-only check consistency of the filesystem on snap1
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you do):Y=
es
Filesystem with default journal found, --no-journal-available is ignored
###########
reiserfsck --check started at Tue Mar 23 03:29:10 2004
###########

reiserfs_reopen: could not reopen device: Permission denied
Aborted

no kernel message (except from grsecurity about signal 6 sent to (reiserfsc=
k:20195)).

