From: Hans Reiser <reiser@namesys.com>
Subject: Re: fsck in background?
Date: Mon, 31 Mar 2003 21:14:07 +0400
Message-ID: <3E88775F.5070302@namesys.com>
References: <3E8818CD.1000500@dotcom.pl> <20030331144609.B1430@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13491-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030331144609.B1430@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: myciel <myciel@dotcom.pl>, reiserfs-list@namesys.com

Oleg Drokin wrote:

>Hello!
>
>On Mon, Mar 31, 2003 at 12:30:37PM +0200, myciel wrote:
>
>  
>
>>Yes, I know this sounds strange, but if one have 1T filesystem full of 
>>small files,
>>reiserfsck estimates duration to be of order of months,
>>    
>>
>
>We have a patch that significantly speeds things up.
>In the similar case 28+ years estimated for pass 0 turned into 208 hours total
>

As I said before, 208 hours is unacceptable and Vitaly needs to do more 
work on it. If Vitaly doesn't know how to fix it, then I need to review 
his algorithms in detail.

>operations after speedup patch was applied.
>We plan to include it into reiserfsprogs 3.6.6-pre1, but if you need that urgently,
>tell us.
>
>  
>
>>so I'm curious if maybe fscking in background is planned? - idea is not new
>>and bsd guys say that they have it  for freebsd 5.0 in ffs.
>>    
>>
>
>This is not possible for reiserfs, I think.
>reiserfs have non-constant metadata location , so while you can certainly
>check fs consistency of some snapshot, you cannot fix it because all the real data
>might have ben shifted to other blocks, old blocks might have been already freed and so on.
>
It can be done, but I don't have the funding/staff for it.

>
>Bye,
>    Oleg
>
>
>  
>


-- 
Hans


