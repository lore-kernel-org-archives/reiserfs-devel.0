From: "Jeff Meyer" <jeffm@andersonlabs.com>
Subject: Re: kernel 2.4.27 reiserfs quotas patch
Date: Mon, 23 Aug 2004 13:39:27 -0500
Sender: news <news@sea.gmane.org>
Message-ID: <cgddnf$btk$1@sea.gmane.org>
References: <cgd0l9$6o0$1@sea.gmane.org> <200408231731.52174.christian.mayrhuber@gmx.net> <cgd735$pgm$1@sea.gmane.org> <20040823171337.GB29452@atrey.karlin.mff.cuni.cz>
Reply-To: "Jeff Meyer" <jeffm@andersonlabs.com>
Return-path: <reiserfs-list-return-20464-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Problem fixed!!! You need to enable loadable module support selected in the
kernel.  Sorry!!!


"Jan Kara" <jack@ucw.cz> wrote in message
news:20040823171337.GB29452@atrey.karlin.mff.cuni.cz...
>   Hello,
>
> > I have tried using these patches and I cannot build my kernel with them.
I
> > get the following error when compile the kernel:
> >
> > In file included from journal.c:42:
> > /usr/src/linux-2.4.27/include/linux/module.h:22:34: linux/modversions.h:
No
> > such file or directory
>   That seems quite strange and probably not related to the patch - can
> you try following?
> backup .config
> make mrproper
> copy back .config
> make oldconfig
> make bzImage
>
> Honza
>



