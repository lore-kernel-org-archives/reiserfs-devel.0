From: "Steve Pratt" <slpratt@us.ibm.com>
Subject: Re: EVMS Reiser FSIM
Date: Tue, 4 Jun 2002 10:02:00 -0500
Message-ID: <OFF33CCB39.8842A3DF-ON85256BCE.0050E23C@pok.ibm.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10502-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com


Oleg Drokin wrote:
Hello!

>On Mon, Jun 03, 2002 at 04:03:32PM -0500, Steve Pratt wrote:

>> Let me know if this still doesn't work.

>Ok, now I am able to compile and boot the kernel, and evms gui starts up.

Progress.

>But now the problem is all the screens except plugin lists are empty.

Not good.

>Whenever I select some operation from the menu (create, convert or
whatever),
>I am represented with empty window that says "No items were found matching
>the search criteria" (sometimes the window is persent instantly, sometimes
>there is a windo with some items, but when I choose one of the items
>and press "Next" button, the empty window appears).

Yes, if there are no disks found, then there really isn't much to
configure.

>I read the FAQ and since I run non-devfs enabled kernel, I run
>evms_devnode_fixup. First time it failed:

This is actually done by the Engine every time you open the GUI or other
interface.

># ./evms_devnode_fixup
>evms_devnode_fixup -- updating the EVMS device node tree...
>evms_devnode_fixup -- ERROR: return code from evms_update_evms_dev_tree()
was -9.

Strange.

>Second time it succeed:
># ./evms_devnode_fixup
>evms_devnode_fixup -- updating the EVMS device node tree...
>evms_devnode_fixup -- Finished.

OK.

>But still not a single entry in evsmgui tool.

Yes, this won't have helped the problem.

># ./evms_gather_info

> info deleted.....

>What should I do to get something to appear in the disks/slices/whatever
>lists so I can play with it?

I need the kernel log and the Engine log (/var/log/evmsEngine.log) to be
sure what is going on, but my first guess would be that either you did not
select all of the right components in the kernel, or if you did that you
might have built them as modules and not loaded them. Specifically it looks
like the local device manager is missing.

We recommend compiling all EVMS runtime plug-in that you plan to use
directly into your kernel.  It avoid the hassle of dealing with init
ramdisks and lodaing modules at the right time.  If you are really set on
using modules, please read the 'Using EVMS with an Init-Ramdisk' section of
the HowTo.

As for which modules you should select, you must select the 'local device
manager'. On IA32 machine you almost always want the 'DOS partition
manager'  This is all you really need, although if you are just playing
around I would recommend building everything (except maybe AIX and OS/2 and
clustering).


Summary: please verify that at least 'local device manager' and 'DOS
partition manager' are built statically into the kernel, if not reconfigure
kernel and retry.  If they are, then send me the kernel and Engine logs and
I will see what is wrong.

Steve


