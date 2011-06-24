From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] fixlet: Remove fs_excl from struct task.
Date: Fri, 24 Jun 2011 18:02:41 -0400
Message-ID: <20110624220240.GA6455@infradead.org>
References: <1308949107-1962-1-git-send-email-teravest@google.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1308949107-1962-1-git-send-email-teravest@google.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Justin TerAvest <teravest@google.com>
Cc: jaxboe@fusionio.com, viro@zeniv.linux.org.uk, jeffm@suse.de, tytso@google.com, mingo@elte.hu, peterz@infradead.org, hch@infradead.org, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org

On Fri, Jun 24, 2011 at 01:58:27PM -0700, Justin TerAvest wrote:
> fs_excl is a poor man's priority inheritance for filesystems to hint to
> the block layer that an operation is important. It was never clearly
> specified, not widely adopted, and will not prevent starvation in many
> cases (like across cgroups).
> 
> I talked to Ted Ts'o about this, and he said that it used to used more
> frequently in the 2.4 and prior versions of Linux, back when we were
> first converting from the Big Kernel Lock to having subsystem level
> locks, and so it made sense to use fs_excl when a process owned the
> global fs mutex and was waiting for an I/O to complete, but it's no
> longer used much at all, and filesystems have better ways to mark an I/O
> request as high priority.

That's not quite true, it was added in Linux 2.6.13 in commit
22e2c507c301c3dbbcf91b4948b88f78842ee6c9:

	[PATCH] Update cfq io scheduler to time sliced design

The users back then where the same as today: a few reiserfs journal
callsites and lock_super.  In addition to the lock_super uses in various
fringe filesystems still left today it was also used around ->put_super
(aka umount) and ->write_super, which at the point had already lost the
grunt work of sync action to ->sync_fs.

That beeing said I never liked it and asked for a removal a while ago,
but Jens still wanted to keep it.  As far as I'm concerned we should
kill it gently, and if any regressions arise fix them with a bio flag.
