From: Vitaly Fertman <vitaly@namesys.com>
Subject: reiserfsprogs-3.6.4
Date: Fri, 25 Oct 2002 17:05:05 +0400
Message-ID: <200210251705.05437.vitaly@namesys.com>
References: <200209171723.09026.vitaly@namesys.com> <200210011406.32568.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11772-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200210011406.32568.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


Hi all,

The new release 3.6.4 of reiserfsprogs can be downloaded from 
out ftp site. It did not get any change against 3.6.4-pre3.
 
-- 

Thanks,
Vitaly Fertman


On Tuesday 01 October 2002 14:06, Vitaly Fertman wrote:
> Hi all,
>
> This new reiserfsprogs pre release includes (against pre2)
> - full bitmap correction was added to fix-fixable (not only
>   adding blocks which are reachable through the tree to
>   on-disk bitmap)
>
> Fixed bugs:
> - improved journal parameters checking before rebuilding
>   the tree.
>
> This package is going to be a new release, but was not well
> tested by our testers yet.
>
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
> > Fixed bugs:
> >
> > during conversion tails to indirect items on pass2 and back conversion
> >   on semantic pass.
> > not proper cleaning flags in item headers.
> > during relocation of shared objects.
> > new block allocating on pass2 (very rare case).
> >
> > Changes went into 3.6.4-pre1:
> >
> > Correction of nlinks on fix-fixable was disabled, because
> >   fix-fixable zeroes nlinks on the first pass and wants to
> >   increment them on semantic pass. But semantic pass is skipped
> >   if there are fatal corruptions.
> > Exit codes were fixed.
> > Warning/error messages were changed to more user friendly form.
> >
> > Changes which got into 3.6.3-pre1, but were not included into the
> > release:
> >
> > Great speedups for pass2 of reiserfsck.

