From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: Status of data-logging for 2.5.x?
Date: Thu, 26 Sep 2002 16:19:57 +0200
Message-ID: <200209261619.58019.Dieter.Nuetzel@hamburg.de>
References: <20020925174802.UKLL16629.rwcrmhc51.attbi.com@rwcrwbc55> <1032976747.13899.66.camel@tiny> <3D92AFE6.9040708@mb.tu-ilmenau.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11553-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3D92AFE6.9040708@mb.tu-ilmenau.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>, Chris Mason <mason@suse.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Am Donnerstag, 26. September 2002 08:57 schrieb Manuel Krause:
> On 09/25/2002 07:59 PM, Chris Mason wrote:
> > On Wed, 2002-09-25 at 13:48, jordan.breeding@attbi.com wrote:
> >>Hello,
> >>
> >>  Does anyone know the current status of the data-
> >>logging patches being ported to 2.5.x?  Thanks.
> >
> > They are finally ported to 2.4.20-pre7 (in testing now on my local
> > box).
>
> I'm very excited about that fact!

I appreciate this, too.
Thank you Chris.
I'll put this all together with 2.4.x-ckX (-AA, preemption, O(1), ll).

> Can you supply some gamma patches on your ftp (e.g. in directoy "gamma"=
)
>
> Thanks, for your great work, so far, you read, I contributed some
> re-testing for your code, so I really like to test the next stage(!!!),
>
> > 2.5.x is a few weeks away but it is very high up there on my
> > list.

Can't wait for this.

Jens Axboe has a new "deadline io scheduler" ready for 2.5.38+ (it is in=20
2.5.38-BK).

Terrific numbers!

> > Am Mittwoch, 25. September 2002 17:20 schrieben Sie:
> > Due to recent "problems" (well the vm being just too damn good at kee=
p
> > disks busy these days), it's become even more apparent that our curre=
nt
> > io scheduler just cannot cope with some work loads. Repeated starvart=
ion
> > of reads is the most important one. The Andrew Morton Interactive
> > Workload (AMIW) [1] rates the current kernel poorly, on my test machi=
ne
> > it completes in 1-2 minutes depending on your luck. 2.5.38-BK does a =
lot
> > better, but mainly because it's being extremely unfair. This deadline=
 io
> > scheduler finishes the AMIW in anywhere from ~0.5 seconds to ~3-4
> > seconds, depending on the io load.

http://marc.theaimsgroup.com/?l=3Dlinux-kernel&m=3D103297463302181&w=3D2

-Dieter

BTW 2.4.20-pre8 is out...;-)
