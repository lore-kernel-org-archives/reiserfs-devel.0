From: Horst von Brand <vonbrand@inf.utfsm.cl>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Tue, 20 Sep 2005 14:17:38 -0400
Message-ID: <200509201817.j8KIHcMK001086@laptop11.inf.utfsm.cl>
References: <ninja@slaphack.com>
Return-path: <reiserfs-list-return-26143-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Message from David Masover <ninja@slaphack.com> 
   of "Tue, 20 Sep 2005 09:41:36 EST." <43301FA0.7030906@slaphack.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>
Cc: Pavel Machek <pavel@suse.cz>, Hans Reiser <reiser@namesys.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, thenewme91@gmail.com, Christoph Hellwig <hch@infradead.org>, Denis Vlasenko <vda@ilport.com.ua>, chriswhite@gentoo.org, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

David Masover <ninja@slaphack.com> wrote:
> Pavel Machek wrote:
> >>V3 is obsoleted by V4 in every way.  V3 is old code that should be
> >>marked as deprecated as soon as V4 has passed mass testing.   V4 is far
> >>superior in its coding style also.  Having V3 in and V4 out is at this
> >> point just stupid.

> > Really? Last time I checked, even V3's fsck was not too great. [In
> > fact I never could make it run stable enough to even _test_ it
> > properly].
> > Do you have working fsck for V4?

> Already saved me once.  But then, I should have had backups.

And if you haven't? Backing up 200+ GiB is no peanuts...

> And personally, if it was my FS, I'd stop working on fsck after it was
> able to "check".  That's what it's for.  To fix an FS, you wipe it and
> restore from backups.

Remind me /never/ to go near a filesystem you are in any way involved with.
-- 
Dr. Horst H. von Brand                   User #22616 counter.li.org
Departamento de Informatica                     Fono: +56 32 654431
Universidad Tecnica Federico Santa Maria              +56 32 654239
Casilla 110-V, Valparaiso, Chile                Fax:  +56 32 797513
