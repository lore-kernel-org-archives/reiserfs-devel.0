From: Filipe Almeida <filipe@rnl.ist.utl.pt>
Subject: Re: reiser4 and swsusp2 (patch)
Date: Tue, 10 Feb 2004 18:41:09 +0000
Message-ID: <200402101841.09132.filipe@rnl.ist.utl.pt>
References: <200402101738.22694.filipe@rnl.ist.utl.pt> <16425.8230.691511.488155@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16747-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16425.8230.691511.488155@laputa.namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: reiserfs-list@namesys.com, swsusp-devel@lists.sourceforge.net

Hi,

On Tuesday 10 February 2004 18:17, Nikita Danilov wrote:
> Filipe Almeida writes:
>  > I am neither familiar with reiser4 or swsusp internals, so there may be
>  > some obvious errors in the attached diff that I am unaware of.
>  >
>  > This and the original swsusp/pmdisk patch are available here:
>  > http://mega.ist.utl.pt/~filipe/patches/
>
> Do they require some additional patches? I don't see SWSUSP_* macros in
> the stock 2.6.2.


Yes. this patches are for swsusp2 at swsusp.sourceforge.net.
See my previous mail for the patches against the current 2.6 swsusp.

>
>  > Regards,
>  > Filipe Almeida
>  > http://mega.ist.utl.pt/~filipe/
>  > --- old/linux-2.6.2/fs/reiser4/ktxnmgrd.c	2004-02-10 17:15:43.910461848
>  > +0000 +++ linux-2.6.2/fs/reiser4/ktxnmgrd.c	2004-02-10
>  > 17:18:58.319907120 +0000
>
> [...]
>
>  >  		/* wake up all threads doing umount. See ktxnmgrd_detach(). */
>  >  		kcond_broadcast(&ctx->loop);
>  >
>  > -		if (result != -ETIMEDOUT && result != 0) {
>  > -			/* some other error */
>  > -			warning("nikita-2443", "Error: %i", result);
>
> I don't quite understand why you are removing this warning. There is no
> way to tell normal wakeup from one caused by suspend or what?
>

Not that I know of. But the people at the swsusp ml should know if that is 
possible or not (CC'd).

My previous patch against current 2.6 pmdisk and swsusp doesnt remove this 
warnings. I havent figured out a way to do the same with swsusp2. Please 
check them at:

http://mega.ist.utl.pt/~filipe/patches/reiser4-2004.02.06-swsusp.diff

Regards,
Filipe Almeida
