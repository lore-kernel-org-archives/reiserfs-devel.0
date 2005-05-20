From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH] Fix quota transaction size
Date: Thu, 19 May 2005 20:19:59 -0400
Message-ID: <200505192020.00466.mason@suse.com>
References: <20050519094015.GC1871@atrey.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20050519094015.GC1871@atrey.karlin.mff.cuni.cz>
Content-Disposition: inline
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Kara <jack@suse.cz>
Cc: reiserfs-list@namesys.com, linux-fsdevel@vger.kernel.org, George Ronkin <gronkin@nerdvana.com>, akpm@osdl.org

On Thursday 19 May 2005 05:40, Jan Kara wrote:
>   Hello,
>
>   attached patch improves the estimates on the number of credits needed
> for a quota operation. This is needed as currently quota overflows the
> maximum size of a transaction if 1KB blocksize is used. Please apply.

Thanks Jan,

It would make more sense to only allocate for the quota if quotas are in use.  
When you have 10 or more concurrent procs unlinking things, they end up 
waiting for each other because they are trying to reserve so many blocks in 
the transaction.  So, a smaller reservation allows for better concurrency 
when quotas are off.

-chris
