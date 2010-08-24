From: David Rientjes <rientjes@google.com>
Subject: Re: [patch 1/5] mm: add nofail variants of kmalloc kcalloc and 
 kzalloc
Date: Tue, 24 Aug 2010 13:11:26 -0700 (PDT)
Message-ID: <alpine.DEB.2.00.1008241309170.21242@chino.kir.corp.google.com>
References: <alpine.DEB.2.00.1008240340010.18908@chino.kir.corp.google.com> <1282656558.2605.2742.camel@laptop> <4C73CA24.3060707@fusionio.com>
Mime-Version: 1.0
Return-path: <linux-btrfs-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=google.com; s=beta;
	t=1282680693; bh=o1y1/PeOYNLlsySdEm7JDm6oBjA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type;
	b=Wb77FPjFRw42/3OkDAgj0KSrCIJAVo9fifN4oS+viNx6UT51N57PJtMRuEDjuqgHZ
	 CtQ7ZJhwSDnvh1FmCj0lw==
In-Reply-To: <4C73CA24.3060707@fusionio.com>
Sender: linux-btrfs-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <jaxboe@fusionio.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, Neil Brown <neilb@suse.de>, Alasdair G Kergon <agk@redhat.com>, Chris Mason <chris.mason@oracle.com>, Steven Whitehouse <swhiteho@redhat.com>, Jan Kara <jack@suse.cz>, Frederic Weisbecker <fweisbec@gmail.com>, "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>, "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>, "cluster-devel@redhat.com" <cluster-devel@redhat.com>, "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>, "reiserfs-devel@vger.kernel.org" <reiserfs-devel@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, 24 Aug 2010, Jens Axboe wrote:

> Should be possible to warn at build time for anyone using __GFP_NOFAIL
> without wrapping it in a function.
> 

We could make this __deprecated functions as Peter suggested if you think 
build time warnings for existing users would be helpful.
