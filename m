From: "Daniel Christiansen" <christiansen@albion.edu>
Subject: Re: Error Code 255 and "Permission Denied"
Date: Mon, 06 May 2002 15:12:09 -0400
Message-ID: <scd69d55.074@gwd.albion.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10265-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Everything seems to work by using the 3.x.1b version of reisfsck with
--rebuild-tree.  Thank you very much, Oleg, for taking the time to solve
my problem.

I don't know anything about the "write cache enabled" issue below.  Is
this something I have to change with a jumper, a bios setting, or a
software configuration?

Thanks again.

> > Other indications of a problem:  I ran the dmesg program from /bin
and
> > got "Warning log replay starting on readonly filesystem" and lots of
> > "i/o failure trying to find stat data" messages.
> Your filesystem was corrupted by something. Do you have Windows on
that
> box,
> too?
> I have windows on the first drive, which I rarely use, and a vfat
> windows partition on the second drive so that I could transfer files.
> I'm not sure, but I think my problems started after a power outage.

Hm. Do you have write cache enabled on your harddrive? That may explain
your problems (and yes, most of drive manufacturers do enable write
caching
by default).





