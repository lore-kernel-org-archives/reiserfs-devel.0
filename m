From: Ookhoi <ookhoi@humilis.net>
Subject: Re: ReiserFS causes CPU high usage?!
Date: Fri, 28 Feb 2003 13:24:23 +0100
Message-ID: <20030228132422.B24291@humilis>
References: <200302280011.14488.liviu.voicu@huji.ac.il> <20030228105145.C1234@namesys.com> <200302281403.43093.liviu.voicu@huji.ac.il>
Reply-To: ookhoi@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12976-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200302281403.43093.liviu.voicu@huji.ac.il>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Voicu Liviu <liviu.voicu@huji.ac.il>
Cc: reiserfs-list@namesys.com, Oleg Drokin <green@namesys.com>

Voicu Liviu wrote (ao):
> So, you will not suggest me convert my Pentium2 300 Mhz from ext3 to
> ReiserFS will you?
> I really wanna try it but I am afraid that the FS will kill my CPU.

I use reiserfs on a p-mmx 200MHz, and it runs fine. Also when I renice
processes (like kernel compile).

> > > I have to fix the CPU usage icon_sad.gif I makes me crazy...simple
> > > emerge loads the CPU to 90 ~ 95%

Your problem sounds strange. Kan you show a top snapshot before and
after the renice?

Btw, dunno about your os, but for example debian start X with nice level
-10, which makes it a bit more responsive when there are little cpu
cycles left.

> Did not checked this in kernel...will you suggest me try vanilla
> kernel (2.4.20 from kernel.org) without all those patches I have
> applyed? Maybe this will help or not?

Try with or without patches, and show the list your .config settings if
the problem still exists.
