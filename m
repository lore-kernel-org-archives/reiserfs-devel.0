From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: datalogging and quota patches port to 2.4.21-pre6
Date: Sat, 22 Mar 2003 00:58:45 +0100
Message-ID: <3E7BA735.5090604@mb.tu-ilmenau.de>
References: <20030320181301.A7170@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13326-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 03/20/2003 04:13 PM, Oleg Drokin wrote:
> Hello!
> 
>    Ok, so I ported Chris' patches to 2.4.21-pre6 (should appear on your
>    kernel.org mirror soon, have appeared in bk already).
> 
>    Patches are at
>    ftp://namesys.com/pub/reiserfs-for-2.4/testing/data-logging-and-quota-2.4.21-pre6
>    They are intend to replace similar named patches from Chris' ftp directory at
>    ftp://ftp.suse.com/pub/people/mason/patches/data-logging/2.4.21
> 
>    Also if you want to try these patches with 2.4.21-pre5-ac3,
>    you only need to apply my 2.4.21-pre6 versions of 05-2.4.21-pre6-data-logging-36.diff.gz
>    and 08-2.4.21-pre6-reiserfs-quota-26.diff.gz (but I have not tried this configuration yet).
> 
>    Enjoy.
> 
> Bye,
>     Oleg
> 

Hi Oleg,

GRIN !!!  I really would like to enjoy these, but you seem to be far 
away in future. Still no "official" patch seems to be out -- at least 
for me on here. (Yes, I'll wait and would not use bk.)

Have your previously pending patches been included into 2.4.21-pre6
(they are: 02-trivial1.diff
            03-more-mount-checks.diff
            01-journal-overflow-fix.diff
  from    ftp://ftp.namesys.com/pub/reiserfs-for-2.4/testing :
           iget5_locked_for_2.4.21-pre5-datalogging.diff.gz
  and posted to our ML @ "Wed, 12 Mar 2003 10:46:42 +0300" :
             direct-io-fix-II.diff
) ?

My question only results from beeing unable to get them all applied to 
2.4.21-pre5 with data-logging without rejects and me feeling unsafe to 
adjust them manually.

Thanks,

Manuel


--
If we'll never find peace, freedom and democracy with our souls -- how 
can our world? We only need to begin. Yes, first step first, in peace...

