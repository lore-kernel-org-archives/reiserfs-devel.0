From: "Jeff Meyer" <jeffm@andersonlabs.com>
Subject: Re: kernel 2.4.27 reiserfs quotas patch
Date: Mon, 23 Aug 2004 11:46:14 -0500
Sender: news <news@sea.gmane.org>
Message-ID: <cgd735$pgm$1@sea.gmane.org>
References: <cgd0l9$6o0$1@sea.gmane.org> <200408231731.52174.christian.mayrhuber@gmx.net>
Reply-To: "Jeff Meyer" <jeffm@andersonlabs.com>
Return-path: <reiserfs-list-return-20462-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Thanks,

I have tried using these patches and I cannot build my kernel with them.  I
get the following error when compile the kernel:

In file included from journal.c:42:
/usr/src/linux-2.4.27/include/linux/module.h:22:34: linux/modversions.h: No
such file or directory
make[3]: *** [journal.o] Error 1
make[3]: Leaving directory `/usr/src/linux-2.4.27/fs/reiserfs'
make[2]: *** [first_rule] Error 2
make[2]: Leaving directory `/usr/src/linux-2.4.27/fs/reiserfs'
make[1]: *** [_subdir_reiserfs] Error 2
make[1]: Leaving directory `/usr/src/linux-2.4.27/fs'
make: *** [_dir_fs] Error 2

I am running on gentoo linux with the vanilla kernel 2.4.27

Jeff

"Christian Mayrhuber" <christian.mayrhuber@gmx.net> wrote in message
news:200408231731.52174.christian.mayrhuber@gmx.net...
> On Monday 23 August 2004 16:54, Jeff Meyer wrote:
> > Does anyone know where I could find or even if they exist the patches to
> > use reiserfs with quotas for the 2.4.27 kernel?  I currently am using
> > reiserfs with quotas on kernel 2.4.26 utilizing the patches for kernel
> > 2.4.25.
> >
> >
> > Thanks,
> >
> > Jeff
>
> You can use Chris Masons patches from 2.4.25. These include quotas.
> ftp://ftp.suse.com/pub/people/mason/patches/data-logging/2.4.25/
>
> These currently have a fsync() bug (the same holds true for 2.6.7+)
> which does not lead to data loss.
> Chris Mason wrote he is preparing fixes for both 2.4.x and 2.6.x.
>
> -- 
> lg, Chris
>



