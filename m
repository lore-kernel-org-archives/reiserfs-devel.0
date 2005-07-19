From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH 1/5] reiserfs: use more consistent printk formatting
Date: Mon, 18 Jul 2005 20:42:16 -0400
Message-ID: <42DC4C68.8030603@suse.com>
References: <20050718174144.GA23817@locomotive.unixthugs.org> <42DC03D8.3030604@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25190-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42DC03D8.3030604@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hans Reiser wrote:
> Jeff Mahoney wrote:
> 
>>The output format between a warning/error/panic/info/etc changes with
>>which one is used.
>>
>>The following patch makes the messages more internally consistent, but also
>>more consistent with other Linux filesystems.
>>
>>Signed-off-by: Jeff Mahoney <jeffm@suse.com>
>>diff -ruNpX dontdiff linux-2.6.13-rc3/fs/reiserfs/prints.c linux-2.6.13-rc3.errors/fs/reiserfs/prints.c
>>--- linux-2.6.13-rc3/fs/reiserfs/prints.c	2005-07-13 13:57:32.000000000 -0400
>>+++ linux-2.6.13-rc3.errors/fs/reiserfs/prints.c	2005-07-14 16:36:47.000000000 -0400
>>@@ -269,10 +269,10 @@ void reiserfs_warning(struct super_block
>>{
>>	do_reiserfs_warning(fmt);
>>	if (sb)
>>-		printk(KERN_WARNING "ReiserFS: %s: warning: %s\n",
>>-		       reiserfs_bdevname(sb), error_buf);
>>+		printk(KERN_WARNING "REISERFS warning (device %s): %s\n",
>>+		       sb->s_id, error_buf);
>>	else
>>-		printk(KERN_WARNING "ReiserFS: warning: %s\n", error_buf);
>>+		printk(KERN_WARNING "REISERFS warning: %s\n", error_buf);
>> 
>>
> why are you changing it to the harder to read all upper case?  It is
> known from various studies that all uppercase is harder for users to read.

My argument is that it makes the subsystem more prominent in a quick
visual search, and is easier on the eyes than the mixed case variant.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQFC3ExoLPWxlyuTD7IRAnYUAKCUN2YK5VSK50jcQgD8y+UfKmvjEQCfYBGE
fk+gGoOC9WlFHJ3+AlDwEdI=
=qYIP
-----END PGP SIGNATURE-----
