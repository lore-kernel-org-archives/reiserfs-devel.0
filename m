From: Oleg Drokin <green@namesys.com>
Subject: Re: fsck in background?
Date: Tue, 8 Apr 2003 18:28:24 +0400
Message-ID: <20030408182824.A17750@namesys.com>
References: <3E8818CD.1000500@dotcom.pl> <20030331144609.B1430@namesys.com> <3E929926.3020705@dotcom.pl>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13615-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E929926.3020705@dotcom.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: myciel <myciel@dotcom.pl>
Cc: reiserfs-list@namesys.com

Hello!

On Tue, Apr 08, 2003 at 11:40:54AM +0200, myciel wrote:
> >We have a patch that significantly speeds things up.
> >In the similar case 28+ years estimated for pass 0 turned into 208 hours 
> >total
> >operations after speedup patch was applied.
> >We plan to include it into reiserfsprogs 3.6.6-pre1, but if you need that 
> >urgently,
> >tell us.
> thanks for answer, so please let me know where I can get the patch.

It is now included into reiserfsprogs 3.6.6-pre1, you can get it from
ftp://ftp.namesys.com/pub/reiserfsprogs/pre/reiserfsprogs-3.6.6-pre1.tar.gz

> And I have another question - again maybe this is not good idea, but:
> if we can fsck of snapshot (without error fixing), so maybe
> it would be possible to store output data from readonly fscking
> and just feed reiserfsck in rw mode to avoid scanning whole fs during 
> repairing,
> and fix only corrupted places found during readonly scan?

Well, this is still pretty complicated.
Nodes might have been shifted around compared to the snapshot we did the checking on.

Bye,
    Oleg
