From: Adam Nielsen <a.nielsen@optushome.com.au>
Subject: Re: BUG: Replaying ReiserFS log causes hard lockup
Date: Sat, 27 Mar 2004 09:06:06 +1000
Message-ID: <20040327090606.74545bd3.a.nielsen@optushome.com.au>
References: <20040325204836.07bcf910.a.nielsen@optushome.com.au>
	<1080213348.1976.277.camel@tribesman.namesys.com>
	<1080219262.14742.146.camel@watt.suse.com>
	<20040326220107.333b23e8.a.nielsen@optushome.com.au>
	<20040326223443.2e5011fa.a.nielsen@optushome.com.au>
	<40645060.7050707@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17517-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40645060.7050707@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: reiserfs-list@namesys.com

> It may be a driver problem, but it could also be a shortcoming in the
> way ReiserFS currently handles write errors in the journal.

I suppose that depends on how the driver handles the situation. 
Presumably the best way to handle an active drive being disconnected
would simply be to block, so that anything accessing the disk (e.g.
ReiserFS) would sit there forever and a day waiting for the drive to
come back online - and when the drive does come back, everything could
continue where it left off.

If the driver doesn't do that however, then ReiserFS would be put in a
situation where the drive suddenly disappeared and it would have to work
out how to cope with it.

> Even when all you're doing is reading from the disk, you're still
> writing a little bit (unless you've mounted with
> -onoatime,nodiratime). ReiserFS can't deal at all with the device
> going away when it's performing journal operations. Since updating the
> atime for a file requires altering the metadata, it uses the journal.
> If I had to guess, I'd say that you'd see ReiserFS panic in your logs,
> with something along the lines of "journal-###: buffer write failed".
> A panic will make all further access to the filesystem hang.

That makes sense, but I think the fault lies higher up.  Once the drive
disconnects, I don't think ReiserFS even gets a chance to complain.  I'm
not sure which logs you're referring to, but if I run "cat /proc/kmsg"
while I'm dd-ing data off the drive, I don't get any messages at all,
even after unplugging the drive (and trying to access the filesystem.) 
Oh, I just noticed that I do eventually receive an "ata1: DMA timeout,
stat 0x1" message - which does sound like it should be something handled
in the driver.

> I'm in the final stages of a patch that will allow ReiserFS to handle
> journal io-errors more gracefully. The result will be, rather than
> panicking the system on journal write, the filesystem will be forced
> read-only and all active transactions will be aborted and released.
> The filesystem will umount'able, and on re-mount will appear similar
> to as if a power failure had occured. However, since it did abort on
> an io-error, I'd recommend a reiserfsck on the aborted partition.

That sounds good, however I'm reluctant to run reiserfsck for a while
yet, as the computer has previously locked up while simply reading data
from the drive (e.g. dd if=/dev/sda1)  I don't want to risk doing more
damage to the data (if it locks up in the middle of reiserfsck) until
I'm sure the kernel can fully cope with a drive disconnect (if that is
indeed the root cause of all these problems.)

Cheers,
Adam.
