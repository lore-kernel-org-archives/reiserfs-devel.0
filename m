From: Oleg Drokin <green@namesys.com>
Subject: Re: error compiling reiserfsprogs
Date: Thu, 1 May 2003 10:25:27 +0400
Message-ID: <20030501062527.GA22815@namesys.com>
References: <00e001c30f5a$91f71bf0$0f02a8c0@observer> <200304302124.h3ULOi5J009954@turing-police.cc.vt.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13910-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200304302124.h3ULOi5J009954@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Valdis.Kletnieks@vt.edu
Cc: Network Operations <downtown@cwo.com>, reiserfs-list@namesys.com

Hello!

On Wed, Apr 30, 2003 at 05:24:44PM -0400, Valdis.Kletnieks@vt.edu wrote:
> > gcc -DHAVE_CONFIG_H -I. -I. -I../include     -g -O2 -Wall -c `test -f 'io.c'
> > || echo './'`io.c
> > In file included from /usr/include/bits/errno.h:25,
> >                  from /usr/include/errno.h:36,
> >                  from io.c:9:
> > /usr/include/linux/errno.h:4: asm/errno.h: No such file or directory
> Did you install whatever kernel-headers package your release of *GCC* (*not*
> the kernel itself) wants installed?  If not, do so.

Well, in fact kernel headers are supplied with glibc, otherwise I agree that error looks like
missing kernel headers installed.

Bye,
    Oleg
