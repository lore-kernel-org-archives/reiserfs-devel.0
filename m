From: Francesco Biscani <biscani@pd.astro.it>
Subject: Re: System freeze: __iounmap: bad address dfd00000
Date: Tue, 31 Aug 2004 10:40:40 +0200
Message-ID: <200408311040.40444.biscani@pd.astro.it>
References: <1093735779.41311563b892b@webmail.pd.astro.it> <9e473391040830181941d62ed0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-21149-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <9e473391040830181941d62ed0@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com, Jon Smirl <jonsmirl@gmail.com>
Cc: linux-kernel@vger.kernel.org

On Tuesday 31 August 2004 03:19, Jon Smirl wrote:
> On Sun, 29 Aug 2004 01:29:39 +0200, biscani@pd.astro.it
>
> <biscani@pd.astro.it> wrote:
> > Aug 28 18:43:00 kurtz __iounmap: bad address dfd00000
>
> That address looks like it might be a video card. cat /proc/iomem or
> lspci -v will tell you the owner and give you a clue where to look for
> problems.

I had come to the same conclusion. I upgraded to the latest drm kernel driv=
ers=20
(DRI cvs) and the message disappeared. It was a mistake to associate it wit=
h=20
IO-activity. Shame on me.

On the other side, I'm using kernel -ck5, which includes reiser4 and does n=
ot=20
suffer from the problem I described. I'm waiting for the next -mm release t=
o=20
see if it gets fixed there too.

BTW, thanks to all you people at xorg, you are doing a wonderful job :-)

Regards,

=2D-=20
Dr. Francesco Biscani

Dipartimento di Astronomia
Universit=E0 di Padova

biscani@pd.astro.it
