From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: reiserfsprogs-3.6.4-pre2
Date: Wed, 18 Sep 2002 03:55:46 +0200
Message-ID: <3D87DD22.9050706@mb.tu-ilmenau.de>
References: <200209171723.09026.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11502-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 09/17/2002 03:23 PM, Vitaly Fertman wrote:
> Hi all,
> 
> A new reiserfsprogs pre release is available at
> ftp.namesys.com/pub/reiserfsprogs/pre/reiserfsprogs-3.6.4-pre2.tar.gz
> 
> Changes went into 3.6.4-pre2:
> 
> fix-fixable sets correct item formats in item headers if needed.
> rebuild got some extra checks for invalid tails on pass0.
> fsck check does not complain on wrong file sizes if safelink exists.
> check dma mode/spead of harddrive and warn the user if it descreased 
>   -- it could happen due to some hardware problem.
> 
> Bugs:
> 
> during conversion tails to indirect items on pass2 and back conversion 
>   on semantic pass.
> not proper cleaning flags in item headers.
> during relocation of shared objects.
> new block allocating on pass2 (very rare case).
> 


Hi Vitaly!

Does this mean these "Bugs" are
  [a] only in 3.6.4-pre2, so: newly "created"
  [b] in 3.6.4-pre2 and the previous -pres
  [c] or even in the 3.6.3 release,too
???

No, I'm not in doubt of reiserfscks development efforts in general, just 
want to know for sure.

Thanks,

Manuel



> Changes went into 3.6.4-pre1:
> 
> Correction of nlinks on fix-fixable was disabled, because
>   fix-fixable zeroes nlinks on the first pass and wants to
>   increment them on semantic pass. But semantic pass is skipped
>   if there are fatal corruptions.
> Exit codes were fixed.
> Warning/error messages were changed to more user friendly form.
> 
> Changes which got into 3.6.3-pre1, but were not included into the 
> release:
> 
> Great speedups for pass2 of reiserfsck.
> 
> Thanks,
> Vitaly Fertman
> 

