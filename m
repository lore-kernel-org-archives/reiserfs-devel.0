From: eazgwmir@umail.furryterror.org (Zygo Blaxell)
Subject: Re: About direntries pointing to nowhere on reiserfs problem in 2.4
Date: 27 Feb 2003 23:15:41 -0500
Message-ID: <b3mnpd$1ho$1@satsuki.furryterror.org>
References: <20030220175309.A23616@namesys.com>
Return-path: <reiserfs-list-return-12963-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

In article <20030220175309.A23616@namesys.com>,
Oleg Drokin  <green@namesys.com> wrote:
>   So we solved that with patch below (Zygo, others who think they have this problem,
>   please check).

...

>===== fs/reiserfs/inode.c 1.42 vs edited =====
>--- 1.42/fs/reiserfs/inode.c	Thu Feb 13 15:42:42 2003
>+++ edited/fs/reiserfs/inode.c	Thu Feb 20 17:23:24 2003

OK, I did the following:

	patch kernel

	install patched kernel

	umount filesystem

	reiserfsck 3.6.5-pre1 --fix-fixable the filesystem

	forgot to note the last few things reiserfsck said

	reboot machine

	verify that patched kernel is running

	wait a few days

	read "unlink: Permission denied" in logs

I'm wondering if I'm still seeing the bug, or just the lingering
after-effects of the bug that might still be hiding in the filesystem.

Is fix-fixable able to correct link counts?  If not, presumably I need
to do a full rebuild-tree in order to correct any incorrect link counts
that may still be present on the filesystem?

-- 
Zygo Blaxell (Laptop) <zblaxell@feedme.hungrycats.org>
GPG = D13D 6651 F446 9787 600B AD1E CCF3 6F93 2823 44AD
