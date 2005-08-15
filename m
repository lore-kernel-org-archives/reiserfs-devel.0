From: "Stephen C. Tweedie" <sct@redhat.com>
Subject: Re: [-mm PATCH 2/32] fs: fix-up schedule_timeout() usage
Date: Mon, 15 Aug 2005 19:37:14 +0100
Message-ID: <1124131033.1888.438.camel@sisko.sctweedie.blueyonder.co.uk>
References: <20050815180514.GC2854@us.ibm.com>
	 <20050815180804.GE2854@us.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25492-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050815180804.GE2854@us.ibm.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nishanth Aravamudan <nacc@us.ibm.com>
Cc: sfrench@samba.org, okir@monad.swb.de, Trond Myklebust <trond.myklebust@fys.uio.no>, reiserfs-dev@namesys.com, urban@teststation.com, xfs-masters@oss.sgi.com, Nathan Scott <nathans@sgi.com>, Andrew Morton <akpm@osdl.org>, samba-technical@lists.samba.org, linux-kernel <linux-kernel@vger.kernel.org>, reiserfs-list@namesys.com, samba@samba.org, linux-xfs@oss.sgi.com, Stephen Tweedie <sct@redhat.com>

Hi,

On Mon, 2005-08-15 at 19:08, Nishanth Aravamudan wrote:

> Description: Use schedule_timeout_{,un}interruptible() instead of
> set_current_state()/schedule_timeout() to reduce kernel size.

> +++ 2.6.13-rc5-mm1-dev/fs/jbd/transaction.c	2005-08-10 15:03:33.000000000 -0700
> @@ -1340,8 +1340,7 @@ int journal_stop(handle_t *handle)
> -			set_current_state(TASK_UNINTERRUPTIBLE);
> -			schedule_timeout(1);
> +			schedule_timeout_uninterruptible(1);

This chunk at least is fine.

--Stephen

