From: "Daniel Christiansen" <christiansen@albion.edu>
Subject: Re: Error Code 255 and "Permission Denied"
Date: Mon, 06 May 2002 12:07:26 -0400
Message-ID: <scd67207.037@gwd.albion.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10262-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

>>> Oleg Drokin <green@namesys.com> 05/06/02 07:21 AM >>>

Make sure to get latest reiserfsprogs (v3.x.1b) from namesys ftp site.

I did this and installed it.  But, of course, my rescue disk has the old
3.x.0j version not the new 3.x.1b version.  How can I use the new
version?

> Other indications of a problem:  I ran the dmesg program from /bin and
> got "Warning log replay starting on readonly filesystem" and lots of
> "i/o failure trying to find stat data" messages.

Your filesystem was corrupted by something. Do you have Windows on that
box,
too?

I have windows on the first drive, which I rarely use, and a vfat
windows partition on the second drive so that I could transfer files.

I'm not sure, but I think my problems started after a power outage.


> "kernel: is_tree_node: node level 0 does not match to the expected one
1
> kernel: vs-5150: search_by_key: invalid format found in block 8272.
> Fsck?"

This message confirms damaged blocks theory.

> I would appreciate any suggestions as to how fix my problem.

Get latest reiserfsprogs package and run reiserfsck --rebuild-tree.

I presume I'm supposed to remount my / drive as read only.  I'm not sure
how to do that.  I'll try to find out.


Thanks for the help.

Dan


Bye,
    Oleg

