From: Andrew Morton <akpm@osdl.org>
Subject: Re: [PATCH] Fix of quota deadlock on pagelock
Date: Fri, 19 Nov 2004 14:46:40 -0800
Message-ID: <20041119144640.0887cdf0.akpm@osdl.org>
References: <20041119095515.GD15189@atrey.karlin.mff.cuni.cz>
	<20041119100434.GF15189@atrey.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22438-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20041119100434.GF15189@atrey.karlin.mff.cuni.cz>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Kara <jack@suse.cz>
Cc: linux-fsdevel@vger.kernel.org, reiserfs-list@namesys.com


What prevents vfs_quota_off() from racing with unmount?

If you look at, say, sync_filesystems() you'll see that we take ->s_umount
and then test ->s_root to check that we didn't race with an unmount
attempt.

