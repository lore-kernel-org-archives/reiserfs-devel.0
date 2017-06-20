From: <doiggl@velocitynet.com.au>
Subject: Can someone add-enable 'fstransform' source code to cater for 'reiser4' filesystems please.
Date: Tue, 20 Jun 2017 23:04:09 +1000
Message-ID: <b31495bcabc64e9712570656f7f62383@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org
Cc: Massimiliano Ghilardi <paperinik@users.sf.net>

Hello,
Can someone add-enable 'fstransform' source code to cater for 'reiser4'
filesystems please.

these file systems done already[1].

source:
fstransform-0.9.3-src.tar.bz2 
https://build.opensuse.org/package/show/filesystems/fstransform

I  can copy source and arrange a build  from revised source code if
needed.

spec:https://build.opensuse.org/package/view_file/filesystems/fstransform/fstransform.spec?expand=1

example build
log:https://build.opensuse.org/build/filesystems/openSUSE_Leap_42.2/x86_64/fstransform/_log


- If someone can add 'reiser4 file' system to fstransform utility.
I can get that that Compiled at https://build.opensuse.org/
It would prove very useful.

Thanks,
--Glenn

[1]
#
# fstransform  --list-source-file-systems
minix
ext2
ext3
ext4
reiserfs
jfs
xfs

# fstransform  --list-target-file-systems
minix
ext2
ext3
ext4
reiserfs
jfs
xfs

# /usr/sbin/fstransform --help
Usage: /usr/sbin/fstransform [OPTION]... DEVICE NEW-FILE-SYSTEM-TYPE
Transform file system inside DEVICE to NEW-FILE-SYSTEM-TYPE,
preserving its contents and without need for backup

Options:
  --help                        Print this help and exit
  --new-size=SIZE               Set new file system length. default:
device length
  --old-file-system=OLD-TYPE    Override current (old) file system type
autodetection
  --force-untested-file-systems Transform also untested file systems
(DANGEROUS)
  --list-source-file-systems    Print list of file systems supported as
source
  --list-target-file-systems    Print list of file systems supported as
target
  --reversible[=yes|no]   Create zero-file, fsremap will do a reversible
transformation
                                default: no
  --no-questions          Never ask any question or confirmation
  --show-time[=yes|=no]   Show current time before each message. default:
yes
  --loop-file=LOOP-FILE   Override loop-file path
  --loop-mount-point=PATH Override loop-file mount point
  --zero-file=ZERO-FILE   Override zero-file path
  --cmd-CMD-NAME=CMD-PATH Set external command CMD-NAME to use. default:
autodetected
  --opts-fsmove=OPTS      Pass OPTS as additional options to 'fsmove'
  --opts-fsremap=OPTS     Pass OPTS as additional options to 'fsremap'
  --opts-mkfs=OPTS        Pass OPTS as options to 'mkfs'. default: '-q'
  --opts-fsck-source=OPTS Override 'fsck' options for old file system.
default: '-p -f'
  --opts-fsck-target=OPTS Override 'fsck' options for new file system.
default: '-p -f'
  --x-OPTION=VALUE        Set internal, undocumented option. For
maintainers only.

  

