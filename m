From: Sander <sander@humilis.net>
Subject: Re: Last reiser4 snapshot is at: http://www.namesys.com/snapshots/2004.02.06/
Date: Fri, 6 Feb 2004 15:30:05 +0100
Message-ID: <20040206143005.GA31096@favonius>
References: <16419.38404.592630.141335@laputa.namesys.com> <20040206140319.GC30481@favonius> <16419.41118.153096.216109@laputa.namesys.com>
Reply-To: sander@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16714-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <16419.41118.153096.216109@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: sander@humilis.net, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>

Nikita Danilov wrote (ao):
> Sander writes:
>  > Btw, can you please make a snapshot against the -mm tree? I think
>  > that would help to get it included in that tree.
> 
> Well, making two snapshots is kind of "double trouble", because both
> has to be tested and bug reports for them have to be handled. What we
> can do, on the other hand, is to make a decision to switch to the -mm
> series completely. But this is for Hans to decide.

IMVHO, that would be a good thing.

> Are you actually having any problems with applying/running snapshot on
> top of -mm?

Yes, but I haven't looked into them yet. This is on 2.6.2 with -mm1
applied:

 $ patch -p1 -s -i ../all.diff
Reversed (or previously applied) patch detected!  Assume -R? [n] n
Apply anyway? [n] n
2 out of 2 hunks ignored -- saving rejects to file fs/Makefile.rej
1 out of 1 hunk FAILED -- saving rejects to file arch/i386/kernel/entry.S.rej
1 out of 2 hunks FAILED -- saving rejects to file include/asm-i386/unistd.h.rej
3 out of 3 hunks FAILED -- saving rejects to file ./include/asm-i386/thread_info.h.rej
1 out of 1 hunk FAILED -- saving rejects to file ./arch/i386/kernel/init_task.c.rej

Thank you.

With kind regards, Sander

-- 
Humilis IT Services and Solutions
http://www.humilis.net
