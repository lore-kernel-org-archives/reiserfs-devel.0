From: Catalin BOIE <util@deuroconsult.ro>
Subject: 2.6.0test3mm2 reiserfs3.6.11 usb-storage
Date: Mon, 18 Aug 2003 15:27:51 +0300 (EEST)
Message-ID: <Pine.LNX.4.56.0308181527391.13602@hosting.rdsbv.ro>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15360-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi, List!

In my journey to discover kernel 2.6 I get this error trying to reiserfsck
/dev/sda1 (usb flash disk, 128 MB)

bash-2.05b# reiserfsck --check /dev/sda1
reiserfsck 3.6.11 (2003 www.namesys.com)

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

Will read-only check consistency of the filesystem on /dev/sda1
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you
do):Yes
Failed to open the journal device ((null)).

An strace tell me:
brk(0)                                  = 0x809c000
brk(0x809d000)                          = 0x809d000
_llseek(4, 8192, [8192], SEEK_SET)      = 0
read(4, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096)
= 4096
_llseek(4, 65536, [65536], SEEK_SET)    = 0
read(4, "\370|\0\0\214\24\0\0\325\5\0\0\22\0\0\0\0\0\0\0\0\2\0\0"...,
4096) = 4096
_llseek(4, 131035136, [131035136], SEEK_SET) = 0
read(4, "\377\377\377\377\377\377\377\377\377\377\377\377\377\377"...,
4096) = 4096
write(2, "Failed to open the journal devic"..., 44Failed to open the
journal device ((null)).
) = 44
fsync(4)                                = 0




I expect reiserfsck to treat this device as any other device.
Mount /dev/sda1 works.

Any advice, please?
Thank you!

P.S. More informations on request.

---
Catalin(ux) BOIE
catab@deuroconsult.ro
