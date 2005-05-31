From: "Christian" <evilninja@gmx.net>
Subject: Re: Reiserfs 1300G partition on lvm problem ...
Date: Tue, 31 May 2005 19:31:38 +0200 (CEST)
Message-ID: <57566.195.126.66.126.1117560698.squirrel@housecafe.dyndns.org>
References: <1117392967.29669.ezmlm@namesys.com>           
    <429A1742.8030504@mh.be>
    <200505292137.j4TLbarw017197@turing-police.cc.vt.edu>
    <429AAFDC.4050208@mh.be> <429C6BE8.4090906@teleformix.com>
    <429C7153.8000008@mh.be> <429C7E46.9090507@teleformix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-24239-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <429C7E46.9090507@teleformix.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dan Oglesby <doglesby@teleformix.com>
Cc: reiserfs-list@namesys.com

On Tue, May 31, 2005 17:09, Dan Oglesby said:
>
> So far, I haven't seen any bad blocks written to my output file.  I'm
> not in front of the machine (remote location), so I can't see what's on
> the console, where I'm actually running the command.

use screendump(1) to see what's on the console. it comes in a package
called "console-tools" here.

> with the power outage in a sane manner.  The last reiserfsck failed
> after a day of running, so I'm thinking if I have a problem, it's
> towards the end of my array.  Time will tell.

sorry if i missed the rest of the thread: please make sure you're using
the latest version of reiserfsprogs.

...my 2 cents,
Christian.
-- 
make bzImage, not war

