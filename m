From: Oleg Drokin <green@namesys.com>
Subject: Re: Error Code 255 and "Permission Denied"
Date: Mon, 6 May 2002 15:21:01 +0400
Message-ID: <20020506152101.A904@namesys.com>
References: <scd52321.066@gwd.albion.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10251-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <scd52321.066@gwd.albion.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Christiansen <christiansen@albion.edu>
Cc: reiserfs-list@namesys.com

Hello!

On Sun, May 05, 2002 at 12:18:28PM -0400, Daniel Christiansen wrote:

> The message in the logfile was"Node (8272) with wrong level (0) found in
> the tree (should be 1)." [There was also a message on the screen of
> "pass_through_tree: unable to read 2949119 block on device 0x4."]  The
> --fix-fixable option didn't seem to do anything.
> [Although, if I recall correctly, there was a message having to do with
> resizing that I didn't understand.]

Can you find out that message in your logs? It may be important one.

> I started to use the --rebuild-tree option but was dissuaded by the
> message about only using it if I was desperate.  Perhaps I need to take
> a deep breath and use this option.

Make sure to get latest reiserfsprogs (v3.x.1b) from namesys ftp site.

> Other indications of a problem:  I ran the dmesg program from /bin and
> got "Warning log replay starting on readonly filesystem" and lots of
> "i/o failure trying to find stat data" messages.

Your filesystem was corrupted by something. Do you have Windows on that box,
too?

> "kernel: is_tree_node: node level 0 does not match to the expected one 1
> kernel: vs-5150: search_by_key: invalid format found in block 8272.
> Fsck?"

This message confirms damaged blocks theory.

> I would appreciate any suggestions as to how fix my problem.

Get latest reiserfsprogs package and run reiserfsck --rebuild-tree.

Bye,
    Oleg
