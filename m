From: Horst von Brand <vonbrand@inf.utfsm.cl>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 02 Sep 2004 18:00:44 -0400
Message-ID: <200409022200.i82M0ihC026321@laptop11.inf.utfsm.cl>
References: <rlrevell@joe-job.com>
Return-path: <reiserfs-list-return-21347-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Message from Lee Revell <rlrevell@joe-job.com> 
   of "Thu, 02 Sep 2004 16:01:17 -0400." <1094155277.11364.92.camel@krustophenia.net> 
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Revell <rlrevell@joe-job.com>
Cc: Pavel Machek <pavel@ucw.cz>, Spam <spam@tnonline.net>, Horst von Brand <vonbrand@inf.utfsm.cl>, Jamie Lokier <jamie@shareable.org>, David Masover <ninja@slaphack.com>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Lee Revell <rlrevell@joe-job.com> said:
> To: Pavel Machek <pavel@ucw.cz>
> Cc: Spam <spam@tnonline.net>, Horst von Brand <vonbrand@inf.utfsm.cl>,
>         Jamie Lokier <jamie@shareable.org>, David Masover <ninja@slaphack.com>,
>         Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk,
>         Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>,
>         Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org,
>         linux-kernel <linux-kernel@vger.kernel.org>,
>         Alexander Lyamin aka FLX <flx@namesys.com>,
>         ReiserFS List <reiserfs-list@namesys.com>
> X-Mailer: Ximian Evolution 1.4.6 
> Date: Thu, 02 Sep 2004 16:01:17 -0400
> 
> On Thu, 2004-09-02 at 15:49, Pavel Machek wrote:

[...]

> > You really need archive support in find. At the very least you need
> > option "enter archives" vs. "do not enter archives". Entering archives
> > automagically is seriously wrong.

I have used find(1) for quite some time now, and have never (or very
rarely) missed this.

> But is it efficient to make every application that reads files have to
> know how to get inside a tar file, just to read its contents?

Totally ridiculous, especially if you factor in .gz, .bz2, .zip, .a,
.whatever.new.format.they.come.up.with.tomorrow. But then again, this would
presumably reside in a (shared) library, so it isn't so bad...

>                                                                That
> seems like a massive duplication of effort.

Right. tar, gzip, bunzip, et al are already around.

>                                              Better to have the contents
> accessible via a separate stream, in the same namespace.  Fix it once in
> the kernel vs. fix it in umpteen apps.

Dead wrong. It is better to fix it in userspace (via a library, if
required; could call random unpacking etc programs at will, even be
configured on a user-by-user basis through ~/.wacky-file-handling or
environment) than force this junk into the kernel. Kernel code is _always_
resident, extremely security critical, and hard to get right. Besides, not
everybody will want to carry this around, and so it will forever stay a
"weird Linux kernel configuration only" feature, i.e., useless in practice.

> The key point here is that the expressive power of the system is greatly
> reduced by having a fragmented namespace.  Of course there are any
> number of ways for an app to find out what is in a tar file, but
> exporting all of that information in a unified namespace is nontrivial
> and much more interesting.

I don't see how it is "nontrivial": "tar tf some.tar" is quite enough to
find out what is inside, in a customary format.

Placing random junk in the kernel doesn't magically make it fast, right, or
useful. Quite a lot of work is required for that, much more than for
getting the same in userland.
-- 
Dr. Horst H. von Brand                   User #22616 counter.li.org
Departamento de Informatica                     Fono: +56 32 654431
Universidad Tecnica Federico Santa Maria              +56 32 654239
Casilla 110-V, Valparaiso, Chile                Fax:  +56 32 797513
