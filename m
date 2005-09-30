From: Gregory Maxwell <gmaxwell@gmail.com>
Subject: Re: latest 2.6.13 reiser4 patch
Date: Fri, 30 Sep 2005 16:20:20 -0400
Message-ID: <e692861c0509301320p13dfe1faq9f020589ee4ef06c@mail.gmail.com>
References: <000901c5c542$31765840$0300a8c0@JUICE1>
Reply-To: Gregory Maxwell <gmaxwell@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26364-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <000901c5c542$31765840$0300a8c0@JUICE1>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Artur_Mak=F3wka?= <juice@ursynow.2a.pl>
Cc: reiserfs-list@namesys.com

On 9/29/05, Artur Mak=F3wka <juice@ursynow.2a.pl> wrote:
> Will it work also with 2.6.13.2 kernel  ? or is it only for 2.6.13 ( or
> 2.6.13.1 )
>
> i couldnt find any information about this on page, and i want to be sure.=
..

I used it fine with 2.6.13.2... but my wireless card isn't supported
there. (it's been included in 2.6.14x, so it was never patches against
2.6.13.. I tried backporting my wireless driver but there were a lot
of changes in both directions).  The patch also applies cleanly
against 2.6.14-rc1/2 but 2.6.14-rc1/2 panic on initrd uncompress for
me, and I can't troubleshoot it because the backtrace scrolls my
screen and I can't do a serial console on my laptop. :(

In any case I tested reiser4 out some on 13.2, and the only bug I hit
was a panic on unmount.
