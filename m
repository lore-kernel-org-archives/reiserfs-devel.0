From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: fsck.reiser4 can't fix 1 fixable corruption
Date: Wed, 28 Apr 2004 13:09:37 +0400
Message-ID: <200404281309.37465.vitaly@namesys.com>
References: <200404201733.51809.rmeijer@internet.gr> <20040423012224.GA18666@raptus.homelinux.org> <408BE7FE.3040602@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18267-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <408BE7FE.3040602@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>, Domenico Andreoli <cavok@tiscali.it>
Cc: reiserfs-list@namesys.com

On Sunday 25 April 2004 20:31, Hans Reiser wrote:
> Domenico Andreoli wrote:
> >On Thu, Apr 22, 2004 at 11:30:52AM -0700, Hans Reiser wrote:
> >>Domenico Andreoli wrote:
> >>>how hard is to have reiser4 support built in grub?
> >>
> >>Yury told me it was done....  Yury....
> >
> >FYI, i had to enable also libaal memomry manager (configure option
> >--enable-memory-manager) to build the right stand alone library for grub
> >reiser4 stage1.5, without it linker complains on missing malloc and free.
> >
> >updated libaal and reiser4progs packages together with a reiser4 enabled
> >grub package are available at http://people.debian.org/~cavok/reiser4/.
> >
> >hmmm... btw, i've never been able to use a stage1.5, any hint?
> >
> >cheers
> >domenico
> >
> >-----[ Domenico Andreoli, aka cavok
> > --[ http://filibusta.crema.unimi.it/~cavok/gpgkey.asc
> >   ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50
>
> Vitaly, please install your system using grub, write down every step as
> you do it, and create a web page.  Hint: try to eliminate the need for
> reading your instructions.  I would like to see your instructions
> consist of:
>
> 1: install grub by doing XXX
>
> 2: install reiser4 by doing YYY
>
> Use grub normally and it works.

ok, I will.

> I haven't followed the details of your conversation with Domenico, but
> it looks way more complicated for him than it should be.  Please fix.

Probably this is complicated due to some bug, probably in progs. 
Although if I understand correctly grub works for Domenico without 
stage1_5, right?

-- 
Thanks,
Vitaly Fertman

