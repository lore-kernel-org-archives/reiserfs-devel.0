From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: reiser4 and swsusp2 (patch)
Date: Tue, 10 Feb 2004 21:17:10 +0300
Message-ID: <16425.8230.691511.488155@laputa.namesys.com>
References: <200402101738.22694.filipe@rnl.ist.utl.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16746-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200402101738.22694.filipe@rnl.ist.utl.pt>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Filipe Almeida <filipe@rnl.ist.utl.pt>
Cc: reiserfs-list@namesys.com, swsusp-devel@lists.sourceforge.net

Filipe Almeida writes:
 > Hi,
 > This is my attempt at a patch to make reiser4 work with swsusp2. I made half a 
 > dozen suspend/resume operations under heavy disk activity and everything 
 > seems to be working. These tests were made with reiser4 as root filesystem.
 > 
 > I am neither familiar with reiser4 or swsusp internals, so there may be some 
 > obvious errors in the attached diff that I am unaware of.
 > 
 > This and the original swsusp/pmdisk patch are available here:
 > http://mega.ist.utl.pt/~filipe/patches/

Do they require some additional patches? I don't see SWSUSP_* macros in
the stock 2.6.2.

 > 
 > Regards,
 > Filipe Almeida
 > http://mega.ist.utl.pt/~filipe/
 > --- old/linux-2.6.2/fs/reiser4/ktxnmgrd.c	2004-02-10 17:15:43.910461848 +0000
 > +++ linux-2.6.2/fs/reiser4/ktxnmgrd.c	2004-02-10 17:18:58.319907120 +0000

[...]

 >  
 >  		/* wake up all threads doing umount. See ktxnmgrd_detach(). */
 >  		kcond_broadcast(&ctx->loop);
 >  
 > -		if (result != -ETIMEDOUT && result != 0) {
 > -			/* some other error */
 > -			warning("nikita-2443", "Error: %i", result);

I don't quite understand why you are removing this warning. There is no
way to tell normal wakeup from one caused by suspend or what?


 > +		if (result != -ETIMEDOUT && result != 0)
 >  			continue;
 > -		}
 >  

Nikita.
