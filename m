From: "evilninja@gmx.net" <evilninja@gmx.net>
Subject: Re: More Slowdown
Date: Thu, 17 Nov 2005 01:46:41 +0100
Message-ID: <437BD2F1.2030509@gmx.net>
References: <1132093347.6347.7.camel@bauerbob.hirsch.lan> <1132098269.7652.6.camel@teratron.lan.etheus.net> <437A811B.5000509@slaphack.com> <200511160240.45212.biscani@pd.astro.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26993-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200511160240.45212.biscani@pd.astro.it>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com
Cc: Francesco Biscani <biscani@pd.astro.it>

Francesco Biscani schrieb:
> What are the implications of doing something like this? Is "sync" going to 
> stop working or isn't it using this function?

sync(8) won't stop working, because it's using sync(2):

% strace -T sync 2>&1 | grep sync
execve("/bin/sync", ["sync"], [/* 20 vars */]) = 0
sync()                                  = 0 <0.213305>


...but can someone explain to me: what's the difference between sync(2) 
and fsync(2) ? why are there 2 systemcalls, why is fsync(2) expensive 
and (mis?)used so often by applications and sync(2) is cheap (not?) and 
used only by sync(8)? the manpages say:

fsync, fdatasync -
	synchronize a file's complete in-core state with that on disk

sync -
	commit buffer cache to disk

but both syscalls do not guarantee  data  integrity anyway, because 
"modern disks have large caches".

thank you,
Christian.
-- 
BOFH excuse #453:

Spider infestation in warm case parts
