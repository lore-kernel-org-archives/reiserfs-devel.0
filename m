From: myciel <myciel@dotcom.pl>
Subject: Re: fsck in background?
Date: Tue, 08 Apr 2003 11:40:54 +0200
Message-ID: <3E929926.3020705@dotcom.pl>
References: <3E8818CD.1000500@dotcom.pl> <20030331144609.B1430@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13612-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030331144609.B1430@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Oleg Drokin wrote:

>We have a patch that significantly speeds things up.
>In the similar case 28+ years estimated for pass 0 turned into 208 hours total
>operations after speedup patch was applied.
>We plan to include it into reiserfsprogs 3.6.6-pre1, but if you need that urgently,
>tell us.
>  
>

thanks for answer, so please let me know where I can get the patch.
And I have another question - again maybe this is not good idea, but:
if we can fsck of snapshot (without error fixing), so maybe
it would be possible to store output data from readonly fscking
and just feed reiserfsck in rw mode to avoid scanning whole fs during 
repairing,
and fix only corrupted places found during readonly scan?

rafal



