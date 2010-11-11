From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCHSET] block: clean up bdev claim/release handling
Date: Thu, 11 Nov 2010 18:14:48 +0100
Message-ID: <4CDC2488.1030801@kernel.org>
References: <1288628129-12811-1-git-send-email-tj@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1288628129-12811-1-git-send-email-tj@kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: axboe@kernel.dk, hch@infradead.org, linux-kernel@vger.kernel.org, petero2@telia.com, schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, jack@suse.cz, akpm@linux-foundation.org, adilge

Hello,

I just appended two patches to the series.  These two are the
blkdev_get_by_*() cleanup patches suggested in the fourth patch which
Christoph liked.

I updated the git tree accordingly and added acked-by's.

  git://git.kernel.org/pub/scm/linux/kernel/git/tj/misc.git cleanup-bd_claim

Jens, if you want the whole series resent, please let me know.

Thanks.

-- 
tejun
