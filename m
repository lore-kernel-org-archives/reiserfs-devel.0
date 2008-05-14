From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [BUG] 2.6.26-rc2-mm1 - kernel BUG at
 fs/reiserfs/journal.c:1414!
Date: Wed, 14 May 2008 11:01:45 -0700
Message-ID: <20080514110145.93b7f780.akpm@linux-foundation.org>
References: <20080514010129.4f672378.akpm@linux-foundation.org>
	<482AF14F.9060708@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <482AF14F.9060708@linux.vnet.ibm.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Cc: linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, Andy Whitcroft <apw@shadowen.org>, Jeff Mahoney <jeffm@suse.com>

On Wed, 14 May 2008 19:33:59 +0530 Kamalesh Babulal <kamalesh@linux.vnet.ibm.com> wrote:

> While running the dbench benchmark on the reiserfs filesystem,
> over the x86_64 box booted with the 2.6.26-rc2-mm1 kernel. The
> Kernel BUG() is seen on the console.
> 
> ------------[ cut here ]------------
> kernel BUG at fs/reiserfs/journal.c:1414!

This?

--- a/fs/reiserfs/journal.c~reiserfs-convert-j_flush_sem-to-mutex-fix
+++ a/fs/reiserfs/journal.c
@@ -1412,7 +1412,7 @@ static int flush_journal_list(struct sup
 	/* if flushall == 0, the lock is already held */
 	if (flushall) {
 		mutex_lock(&journal->j_flush_mutex);
-	} else if (!mutex_trylock(&journal->j_flush_mutex)) {
+	} else if (mutex_trylock(&journal->j_flush_mutex)) {
 		BUG();
 	}
 

