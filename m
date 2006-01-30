From: Gabor HALASZ <halasz.g@freemail.hu>
Subject: bogus i_mode
Date: Mon, 30 Jan 2006 12:41:04 +0100
Message-ID: <43DDFB50.9050208@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27934-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi!

Hi! I got the next message:

Jan 30 12:16:11 sk8n kernel: init_special_inode: bogus i_mode (0)
Jan 30 12:16:11 sk8n kernel: ReiserFS: dm-46: warning: vs-13075: 
reiserfs_read_locked_inode: dead inode read from disk [1184 1920 0x0 
SD]. This is likely to be race with knfsd. Ignore

But I haven't knfsd, I'm using a userspace nfs server, but currently no 
clients connected and no exports on dm-46 (this is my /var volume). 
Kernel 2.6.15, Amd Opteron, Debian Amd64 Sid. What can I do?! Fsck? Ignore?


-- 
Gabor HALASZ <halasz.g@freemail.hu>
