From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: datalogging and quota patches port to 2.4.21-pre6
Date: Sat, 22 Mar 2003 20:07:33 +0100
Message-ID: <3E7CB475.5040502@mb.tu-ilmenau.de>
References: <20030320181301.A7170@namesys.com> <3E7BA735.5090604@mb.tu-ilmenau.de> <20030322102931.A7246@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13335-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 03/22/2003 08:29 AM, Oleg Drokin wrote:
> Hello!
> 
> On Sat, Mar 22, 2003 at 12:58:45AM +0100, Manuel Krause wrote:
> 
>>GRIN !!!  I really would like to enjoy these, but you seem to be far 
>>away in future. Still no "official" patch seems to be out -- at least 
>>for me on here. (Yes, I'll wait and would not use bk.)
>>Have your previously pending patches been included into 2.4.21-pre6
>>(they are: 02-trivial1.diff
>>           03-more-mount-checks.diff
>>           01-journal-overflow-fix.diff
>> from    ftp://ftp.namesys.com/pub/reiserfs-for-2.4/testing :
>>          iget5_locked_for_2.4.21-pre5-datalogging.diff.gz
>> and posted to our ML @ "Wed, 12 Mar 2003 10:46:42 +0300" :
>>            direct-io-fix-II.diff
>>) ?
> 
> Only patches that are visible at 
> ftp://ftp.namesys.com/pub/reiserfs-for-2.4/2.4.20-pending
> were included into 2.4 tree.
> iget5_locked patch is in testing right now.
> direct-io-fix-II.diff have triggered some old long known minor metadata
> updating problems in case of unexpected crash and I am looking how to resolve
> that and trying various stuff.
> 
>>My question only results from beeing unable to get them all applied to 
>>2.4.21-pre5 with data-logging without rejects and me feeling unsafe to 
>>adjust them manually.
> 
> Well, if you apply all of those patches from
> ftp://ftp.namesys.com/pub/reiserfs-for-2.4/2.4.20-pending on clean 2.4.20
> (or whatever is needed for 2.4.21-pre5 only frpm
> ftp://ftp.namesys.com/pub/reiserfs-for-2.4/2.4.21-pre5.pending)
> and then apply data logging patches as if you have 2.4.21-pre6,
> and then iget5_locked stuff, it should work.


Thank you Oleg for the information and the hint.

When following your directions these patches apply fine and the kernel 
works pretty well, too.

Thanks again,

Manuel

