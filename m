From: berthiaume_wayne@emc.com
Subject: RE: Error messages.
Date: Wed, 5 Mar 2003 16:31:06 -0500
Message-ID: <93F527C91A6ED411AFE10050040665D0049C079C@CORPUSMX1>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13093-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andewid@tnonline.net
Cc: reiserfs-list@namesys.com

	Are you running a slave/master drive configuration on the channel
that is failing? The error indicates that you have a command pending and are
trying to stuff another one on the drive. We had been seeing a similar issue
while testing IDE write barrier patches against lk 2.4.19 and needed to back
port a patch for ide.c from lk 2.4.20. Not sure it's the same issue for you.
Regards,
Wayne

email:       Berthiaume_Wayne@emc.com

"One man can make a difference, and every man should try."  - JFK


-----Original Message-----
From: Anders Widman [mailto:andewid@tnonline.net]
Sent: Wednesday, March 05, 2003 4:18 PM
To: reiserfs-list@namesys.com
Subject: Re: Error messages.


>         Anders, you need the subsequent lines for the error to determine
> what the status error is. The 0x58 is a staatus error. It could be a
status
> timeout, seek error, etc. The subsequent line generally tells you what it
> is. The faact you have noticed the errors diminished with DMA off or at
the
> lower speeds seems to indicate possible timeouts.

The errors come even without DMA enabled.

Right now most of them contain "drive not ready for command".

>         To solve it - good hardware. Really! For instance, there is a
Maxtor
> tool that allows you to examine the probational logs of the drive - areas
of
> the disk that are suspected as bad. These are areas that aren't
necessarily
> logged as a bad block but are on "probation" for the next write. They can
> cause these error messages to occur. Unfortunately, I don't believe the
tool
> is available to the general populace. Sorry.

Well,  you  can  check  smart  levels  and thresholds and they are not
violated  yet.  Also, I do not believe that all 4 computer systems are
broken.  Especially  when  I  have run Windows on them for a long time
without any problems at all.

