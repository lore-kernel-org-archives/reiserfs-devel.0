From: Oleg Drokin <green@namesys.com>
Subject: Re: Error Code 255 and "Permission Denied"
Date: Mon, 6 May 2002 22:06:50 +0400
Message-ID: <20020506220650.A3660@namesys.com>
References: <scd67207.037@gwd.albion.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10263-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <scd67207.037@gwd.albion.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Christiansen <christiansen@albion.edu>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, May 06, 2002 at 12:07:26PM -0400, Daniel Christiansen wrote:

> Make sure to get latest reiserfsprogs (v3.x.1b) from namesys ftp site.
> I did this and installed it.  But, of course, my rescue disk has the old
> 3.x.0j version not the new 3.x.1b version.  How can I use the new
> version?

Copy the new version to your rescue floppy.

> > Other indications of a problem:  I ran the dmesg program from /bin and
> > got "Warning log replay starting on readonly filesystem" and lots of
> > "i/o failure trying to find stat data" messages.
> Your filesystem was corrupted by something. Do you have Windows on that
> box,
> too?
> I have windows on the first drive, which I rarely use, and a vfat
> windows partition on the second drive so that I could transfer files.
> I'm not sure, but I think my problems started after a power outage.

Hm. Do you have write cache enabled on your harddrive? That may explain
your problems (and yes, most of drive manufacturers do enable write caching
by default).

> Get latest reiserfsprogs package and run reiserfsck --rebuild-tree.
> I presume I'm supposed to remount my / drive as read only.  I'm not sure
> how to do that.  I'll try to find out.

No. simple remounting won't help, you need to boot off some rescue media and run
reiserfsck on completely unmounted partition.

Bye,
    Oleg
