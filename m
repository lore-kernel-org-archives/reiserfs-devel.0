From: Francesco Biscani <biscani@pd.astro.it>
Subject: Re: reiser4 corruption problem (maybe related to "Broken reiser4 FS")
Date: Fri, 27 Aug 2004 13:30:32 +0200
Message-ID: <200408271330.32348.biscani@pd.astro.it>
References: <412E6EFC.3070600@dermichi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20909-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <412E6EFC.3070600@dermichi.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Michael Weissenbacher <webmaster@dermichi.com>

Hi,

On Friday 27 August 2004 01:15, Michael Weissenbacher wrote:
> criminal mnt # uname -a
> Linux criminal 2.6.8.1-mm4 #4 Wed Aug 25 01:34:48 CEST 2004 i686 AMD
> Athlon(tm) XP 2400+ AuthenticAMD GNU/Linux
> the distro is gentoo and i use reiser4progs1.0.1

This may be a long shot, but from the readme on kernel.org it seems that 
2.6.8.1-mm4 could have random breakage:

"- This kernel has an x86 patch which alters the copy_*_user() functions so
  they will return -EFAULT on a fault rather than the number of bytes which
  remain to be copied.  This is a bit of an experiment, because this seems to
  be the preferred API for those functions.   It's a see-what-breaks thing.

  And things will break.  If weird behaviour is observed, please revert
  usercopy-return-EFAULT.patch and send a report."

So maybe you could try 2.6.9-rc1-mm1 amd see if the problem persists. I've 
heard other users having problems with that particular -mm release and 
reiser4.

> thanks,
> michael weissenbacher

Regards,

  Francesco
