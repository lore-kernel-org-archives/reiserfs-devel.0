From: Matt Eaton <x360@divinehawk.com>
Subject: RE: reiser4 bug
Date: Tue, 11 Apr 2006 01:58:56 -0700
Message-ID: <20060411015856.d2a7074aeb6533c31cef74e88f6c8b5a.0503f8721d.wbe@email.secureserver.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28477-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: matt@divinehawk.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Weissenbacher <webmaster@dermichi.com>
Cc: Alexander Zarochentsev <zam@namesys.com>, reiserfs-list@namesys.com

The patch posted works for me. I would concur with Michael on this one.

For some reason openoffice triggered it with my problem. This is a bad
area to have data loss and I imagine I wouldn't be the first to lose a
document from this bug. It doesn't leave an inconsistent filesystem,
but it does lock the current filesystem down (and prevents your
document from being saved).

Would definitely recommend you guys release a reiser4-for-2.6.16-2 patch
and zap -1.

Thanks for the quick reply though with the fix -- saved me additional
troubles.

Regards,
Matthew


> -------- Original Message --------
> Subject: Re: reiser4 bug
> From: Michael Weissenbacher <webmaster@dermichi.com>
> Date: Tue, April 11, 2006 4:27 am
> To: reiserfs-list@namesys.com
> Cc: Alexander Zarochentsev <zam@namesys.com>
> 
> Hi,
> > it is known problem. Fixed in 2.6.17-rc1-mm2 
> > (reiser4-have-get_exclusive_access-restart-transaction.patch).
> as i've been burned by this bug, too i would suggest making a new patch 
> for 2.6.16 including
> reiser4-have-get_exclusive_access-restart-transaction.patch
> or at least put a warning there that the version is unstable. i'm sure 
> most people go straight for the vanilla kernel patch and don't bother 
> with mm-kernels. this puts reiser4 in a bad light imo.
> 
> kind regards,
> Michael
> -- 
> /============================================================\
> |       Michael Weissenbacher <webmaster@dermichi.com>       |
> |                  http://www.dermichi.com/                  |
> |       Email users are divided into two classes;            |
> |       1) Those who have effective spam-blocking            |
> |       2) Those who wish they did                           |
> \============================================================/

