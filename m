From: "Steve Pratt" <slpratt@us.ibm.com>
Subject: Re: EVMS Reiser FSIM
Date: Mon, 3 Jun 2002 14:04:30 -0500
Message-ID: <OFAF88027B.2A7CA274-ON85256BCD.00682DD5@pok.ibm.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10489-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com


Oleg Drokin: wote:

>I've spent some time today trying to get current EVMS version to run and
see
>what is it (live) but failed miserably.
>2.4.18 kernel files for 2.4.18 cannot be compiled at all and are horribly
>broken in some ways.
>2.5.11 kernel files can be compiled with 2.5.11, but then evmsgui
complained
>that while kernel's ioctl is version 11, evms gui is expecting ioctl
version 10.

>Any advices on how can outside man look into current state of things on
evms
>without waiting for new release for several weeks?

Yes, until you mentioned this, I hadn't realized how much were in a state
of change.  The problem you are seeing (I think) is due to some changes
being made in 2.4.19 that affect our common kernel files (there aren't
many, but enough).  Here is what you need to do:

Apply the 2.4.18 common-files patch from either the 1.0.0 or 1.0.1 release
to your 2.4.18 kernel.  Then add the /usr/src/linux/drivers/evms directory
and the /usr/src/linux/include/linux/evms directory from the CVS files
(They are all new on a clean kernel).  Use the Engine as is from CVS.

2.5 is still in rough shape due to all the block layer changes and the
effects they have on EVMS.  I don't recommend using it just yet.


Let me know if you still have any problems.

Steve


