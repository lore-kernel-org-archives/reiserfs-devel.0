From: David Masover <ninja@slaphack.com>
Subject: Re: wrt: checking reiserfs/4 partitions on boot
Date: Sat, 02 Sep 2006 13:25:36 -0500
Message-ID: <44F9CCA0.4000605@slaphack.com>
References: <edcccd$6t2$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29795-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <edcccd$6t2$1@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Peter <sw98234@hotmail.com>
Cc: reiserfs-list@namesys.com

Peter wrote:
> On the namesys.com FAQ page, it is recommended that 0 0 be placed at the
> end of the fstab lines for reiserfs partitions. I have two questions:
> 
> 1) does this recommendation also apply for reiser4?
> 2) why is this recommendation made? Is it unnecessary to routinely check
> reiser partitions? I understand that in the event of an abnormal shutdown,
> fsck will be forced, correct?

I think the idea is that in the event of an abnormal shutdown, you 
simply replay the journal.  With Reiser4, the likelihood of having to 
run fsck should be even less.  Probably isn't now, but should be.
