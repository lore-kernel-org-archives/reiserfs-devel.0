From: "Horst H. von Brand" <vonbrand@inf.utfsm.cl>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org regarding reiser4 inclusion
Date: Tue, 01 Aug 2006 10:28:18 -0400
Message-ID: <200608011428.k71ESIuv007094@laptop13.inf.utfsm.cl>
References: <bernd-schubert@gmx.de>
Return-path: <reiserfs-list-return-29394-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Message from Bernd Schubert <bernd-schubert@gmx.de> 
   of "Mon, 31 Jul 2006 23:14:37 +0200." <200607312314.37863.bernd-schubert@gmx.de> 
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernd Schubert <bernd-schubert@gmx.de>
Cc: reiserfs-list@namesys.com, Jan-Benedict Glaw <jbglaw@lug-owl.de>, Clay Barnes <clay.barnes@gmail.com>, Rudy Zijlstra <rudy@edsons.demon.nl>, Adrian Ulrich <reiser4@blinkenlights.ch>, vonbrand@inf.utfsm.cl, ipso@snappymail.ca, reiser@namesys.com, lkml@lpbproductions.com, jeff@garzik.org, tytso@mit.edu, linux-kernel@vger.kernel.org

Bernd Schubert <bernd-schubert@gmx.de> wrote:
> On Monday 31 July 2006 21:29, Jan-Benedict Glaw wrote:
> > The point is that it's quite hard to really fuck up ext{2,3} with only
> > some KB being written while it seems (due to the
> > fragile^Wsophisticated on-disk data structures) that it's just easy to
> > kill a reiser3 filesystem.

> Well, I was once very 'luckily' and after a system crash (*) e2fsck put
> all files into lost+found. Sure, I never experienced this again, but I
> also never experienced something like this with reiserfs. So please, stop
> this kind of FUD against reiser3.6.

It isn't FUD. One data point doesn't allow you to draw conclusions.

Yes, I've seen/heard of ext2/ext3 failures and data loss too. But at least
the same number for ReiserFS. And I know it is outnumbered 10 to 1 or so in
my sample, so that would indicate at a 10 fold higher probability of
catastrophic data loss, other factors mostly the same.

> While filesystem speed is nice, it also would be great if reiser4.x would be 
> very robust against any kind of hardware failures.

Can't have both.
-- 
Dr. Horst H. von Brand                   User #22616 counter.li.org
Departamento de Informatica                     Fono: +56 32 654431
Universidad Tecnica Federico Santa Maria              +56 32 654239
Casilla 110-V, Valparaiso, Chile                Fax:  +56 32 797513
