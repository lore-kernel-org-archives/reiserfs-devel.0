From: Vince <fuzzy77@free.fr>
Subject: Re: fsck.reiser4 infinite loop
Date: Tue, 16 Mar 2004 17:01:37 +0100
Message-ID: <405724E1.9070103@free.fr>
References: <405597B6.1000906@free.fr> <200403161654.48374.vitaly@namesys.com> <4057158D.5090201@free.fr> <200403161815.34110.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17249-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200403161815.34110.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: Reiserfs mail-list <Reiserfs-List@namesys.com>

Vitaly Fertman wrote:
> 
> I see the problem, although not sure that the attached patch will 
> fix it correctly. If it does not, I need to have a look at the metadata.

Good guess, the problem is fixed.

-------------------------------------------------------
***** fsck.reiser4 finished at Tue Mar 16 16:48:09 2004
Closing fs...done

52 fatal corruptions were detected in FileSystem. Run with --build-fs 
option to fix them.
--------------------------------------------------------

And then fsck.reiser4 --build-fs had no problem fixing the partition.

> p.s. waiting for other bug reports :)

Don't worry, I'll send them as soon as they arise -- although I hope I 
had enough of them for today 8-)

Anyway, thank you for your quick answers & fixes :-)

Vince
