From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfsprogs-3.6.4-pre2
Date: Wed, 18 Sep 2002 13:30:13 +0400
Message-ID: <200209181330.13271.vitaly@namesys.com>
References: <200209171723.09026.vitaly@namesys.com> <3D87DD22.9050706@mb.tu-ilmenau.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11506-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3D87DD22.9050706@mb.tu-ilmenau.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Cc: reiserfs-list <reiserfs-list@namesys.com>

> On 09/17/2002 03:23 PM, Vitaly Fertman wrote:
> > Hi all,
> >
> > A new reiserfsprogs pre release is available at
> > ftp.namesys.com/pub/reiserfsprogs/pre/reiserfsprogs-3.6.4-pre2.tar.gz
> >
> > Changes went into 3.6.4-pre2:
> >
> > fix-fixable sets correct item formats in item headers if needed.
> > rebuild got some extra checks for invalid tails on pass0.
> > fsck check does not complain on wrong file sizes if safelink exists.
> > check dma mode/spead of harddrive and warn the user if it descreased
> >   -- it could happen due to some hardware problem.
> >
> > Bugs:
> >
> > during conversion tails to indirect items on pass2 and back conversion
> >   on semantic pass.
> > not proper cleaning flags in item headers.
> > during relocation of shared objects.
> > new block allocating on pass2 (very rare case).
>
> Hi Vitaly!
>
> Does this mean these "Bugs" are
>   [a] only in 3.6.4-pre2, so: newly "created"
>   [b] in 3.6.4-pre2 and the previous -pres
>   [c] or even in the 3.6.3 release,too
> ???
>
> No, I'm not in doubt of reiserfscks development efforts in general, just
> want to know for sure.

Sorry for being not clear, those were found and fixed bugs, of course.
I do not like to put in public anything with known bugs, so there is no 
such yet. And it seems that all of them were introduced before 3.6.3 and 
a few (not critical though) even existed over the long time.

-- 

Thanks,
Vitaly Fertman
