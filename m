From: "Steve Pratt" <slpratt@us.ibm.com>
Subject: Re: EVMS Reiser FSIM
Date: Mon, 3 Jun 2002 16:03:32 -0500
Message-ID: <OFB5110BE1.9C046DEC-ON85256BCD.00735354@pok.ibm.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10491-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com


Oleg Drokin wrote:
>On Mon, Jun 03, 2002 at 02:04:30PM -0500, Steve Pratt wrote:

>> Apply the 2.4.18 common-files patch from either the 1.0.0 or 1.0.1
release
>> to your 2.4.18 kernel.  Then add the /usr/src/linux/drivers/evms
directory
>> and the /usr/src/linux/include/linux/evms directory from the CVS files

>I also copied all the other files that were in there (config.in for
>menuconfig, genhd.c from drivers/block, do_mounts.c from init, etc),
>was that unneeded?

No, this is the part that got you in trouble, do not copy these extra files
from CVS, they are in the evms-linux-2.4.18-common-files.patch (you did
apply this right?). get this file from the tarball for 1.0.0 or 1.0.1.


>That produces:
>ksyms.c:319: `root_device_name' undeclared here (not in a function)
>ksyms.c:319: initializer element is not constant
>ksyms.c:319: (near initialization for `__ksymtab_root_device_name.value')

>After I add a extern definition of that, there are other errors,
>dut after some time and compile errors fixed still I get failed linkage
because
>fsync_inode_buffers (or something like that) is undeclared.

>> Let me know if you still have any problems.

>Ok, if you say I do only need to copy /usr/src/linux/drivers/evms and
>/usr/src/linux/include/linux/evms contents, that won't provide me with
>menu selection for EVMS, so con you please give me full list of
files/subdirs
>that I should copy off the cvs to clean 2.4.18 (or whatever else) tree.

Yes, this should give you the menu selection because hte common-files patch
will fix up the config.in to enclude the one that will be copied when you
copy the drivers/evms directory.

Let me know if this still doesn't work.

Steve




