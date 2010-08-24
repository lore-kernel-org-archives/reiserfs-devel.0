From: David Rientjes <rientjes@google.com>
Subject: Re: [patch 1/5] mm: add nofail variants of kmalloc kcalloc and
 kzalloc
Date: Tue, 24 Aug 2010 13:08:28 -0700 (PDT)
Message-ID: <alpine.DEB.2.00.1008241307190.21242@chino.kir.corp.google.com>
References: <alpine.DEB.2.00.1008240340010.18908@chino.kir.corp.google.com> <1282656558.2605.2742.camel@laptop>
Mime-Version: 1.0
Return-path: <linux-ext4-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=google.com; s=beta;
	t=1282680520; bh=tsYUwV9tTLoL2sh7KDCKhOLBbAM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type;
	b=sH0OsnJCsj0JTW0NUqE+hEpbXy3kHwNJUsWJMLrcsrOJ8YK7OfxsoYwkNRRjZ5k3m
	 8Xp7FTynH8IAo0er177UA==
In-Reply-To: <1282656558.2605.2742.camel@laptop>
Sender: linux-ext4-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Neil Brown <neilb@suse.de>, Alasdair G Kergon <agk@redhat.com>, Chris Mason <chris.mason@oracle.com>, Steven Whitehouse <swhiteho@redhat.com>, Jens Axboe <jaxboe@fusionio.com>, Jan Kara <jack@suse.cz>, Frederic Weisbecker <fweisbec@gmail.com>, linux-raid@vger.kernel.org, linux-btrfs@vger.kernel.org, cluster-devel@redhat.com, linux-ext4@vger.kernel.org, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 24 Aug 2010, Peter Zijlstra wrote:

> > These were added as helper functions for documentation and auditability.
> > No future callers should be added.
> 
> git grep GFP_NOFAIL isn't auditable enough?
> 

I'm trying to remove that bit, and __GFP_REPEAT, to simplify and remove 
several branches from the page allocator.

> might as well declare these functions depricated if you really want to
> do this.
> 
> FWIW I think mason said he'd fix btrfs to not suck like this 'soon'.
> 

Great!
