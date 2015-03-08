From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH] reiserfs: fix several reiserfs_warning calls
Date: Sun, 08 Mar 2015 19:32:15 -0400
Message-ID: <54FCDBFF.1000207@suse.com>
References: <1425638473-31398-1-git-send-email-nicolas.iooss_linux@m4x.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1425638473-31398-1-git-send-email-nicolas.iooss_linux@m4x.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nicolas Iooss <nicolas.iooss_linux@m4x.org>, reiserfs-devel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 3/6/15 5:41 AM, Nicolas Iooss wrote:
> Since commit 45b03d5e8e67 ("reiserfs: rework reiserfs_warning"), 
> reiserfs_warning takes an id and a format as arguments, not a
> single format argument.  However 4 calls still follow the old
> interface. Update them.
> 
> This bug was initially found by adding __printf(4, 5) attribute to 
> __reiserfs_warning and using "gcc -Wformat=2" when building the 
> kernel.
> 
> Fixes: 45b03d5e8e67 ("reiserfs: rework reiserfs_warning") 
> Signed-off-by: Nicolas Iooss <nicolas.iooss_linux@m4x.org>
Acked-by: Jeff Mahoney <jeffm@suse.com>

> --- fs/reiserfs/bitmap.c  | 4 ++-- fs/reiserfs/journal.c | 4 ++-- 
> fs/reiserfs/procfs.c  | 4 ++-- 3 files changed, 6 insertions(+), 6
> deletions(-)
> 
> diff --git a/fs/reiserfs/bitmap.c b/fs/reiserfs/bitmap.c index
> dc198bc64c61..1d02f184863d 100644 --- a/fs/reiserfs/bitmap.c +++
> b/fs/reiserfs/bitmap.c @@ -1423,8 +1423,8 @@ struct buffer_head
> *reiserfs_read_bitmap_block(struct super_block *sb,
> 
> bh = sb_bread(sb, block); if (bh == NULL) -		reiserfs_warning(sb,
> "sh-2029: %s: bitmap block (#%u) " -		                 "reading
> failed", __func__, block); +		reiserfs_warning(sb, "sh-2029", +
> "bitmap block (#%u) reading failed", block); else { if
> (buffer_locked(bh)) { int depth; diff --git a/fs/reiserfs/journal.c
> b/fs/reiserfs/journal.c index 9d6486d416a3..bb08e81ef9ec 100644 ---
> a/fs/reiserfs/journal.c +++ b/fs/reiserfs/journal.c @@ -2643,8
> +2643,8 @@ static int journal_init_dev(struct super_block *super, 
> if (IS_ERR(journal->j_dev_bd)) { result =
> PTR_ERR(journal->j_dev_bd); journal->j_dev_bd = NULL; -
> reiserfs_warning(super, -				 "journal_init_dev: Cannot open '%s':
> %i", +		reiserfs_warning(super, NULL, +				 "Cannot open '%s':
> %i", jdev_name, result); return result; } diff --git
> a/fs/reiserfs/procfs.c b/fs/reiserfs/procfs.c index
> 621b9f381fe1..e6a1b2c34ef6 100644 --- a/fs/reiserfs/procfs.c +++
> b/fs/reiserfs/procfs.c @@ -436,7 +436,7 @@ int
> reiserfs_proc_info_init(struct super_block *sb) add_file(sb,
> "journal", show_journal); return 0; } -	reiserfs_warning(sb,
> "cannot create /proc/%s/%s", +	reiserfs_warning(sb, NULL, "cannot
> create /proc/%s/%s", proc_info_root_name, b); return 1; } @@ -465,7
> +465,7 @@ int reiserfs_proc_info_global_init(void) if
> (proc_info_root == NULL) { proc_info_root =
> proc_mkdir(proc_info_root_name, NULL); if (!proc_info_root) { -
> reiserfs_warning(NULL, "cannot create /proc/%s", +
> reiserfs_warning(NULL, NULL, "cannot create /proc/%s", 
> proc_info_root_name); return 1; }
> 


- -- 
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.22 (Darwin)

iQIcBAEBAgAGBQJU/Nv+AAoJEB57S2MheeWyFX0QAIxVQtvUQ2IC7kdaEqtTSmz+
0isl/6OqZa+JA4jSG1GmVbhhY/yS9qCImdEozAyuNF1gJIsUzcrN/lyPzFWnnJDm
LD7DOKvcLp1PnZ7UsqBEjwy8vZ3YXNL9CbVxczij5Dx3z1PXnPGaLi6okf6vT2M1
vqp2ZwKfEvDZzN0cvt2fmkO9k1GQaUhOUkzjnZy1I6MCmPd3dF9hcr93g0/BlTWD
DeVS7Y+gjFP8eA3l2KJWrBbDHK59M3RCOpVdVhIyCu73dcJs94ZZBn8jCXN3kfpv
33xb/MWZE+vnNCo4PkmJCngKZN8gu/OW2nna1c0yzUlKkRMcipHKDB7RDxPAeeXL
2nz3LMv2MP94DCDdpxVjZi2I+2REHWAaxi62IMxEiOl9X7aVuZrn+UH5R/6E5/vp
H39yFVHFaKBLI8pLGdcnObcDNKPr7nFEzwvS4ngiYntcH4F8K9SBun+EgwB6gYLq
xQQXxDdNxfWGZCELz8Q8ZJQkM2seeOu2ImUkaxI+MUycrUKvkwz7ECtOdUQMlbUN
8EqSfiHrP62JZ5XrNdlm/uIvKaFyq8PwUZNXQtl28Op6PrP6CAIpe5/5q+95L18f
TDTMyiVOO52B6C3wLheQnfswN3b2/xwebd84BIUmYPPdwWRbVH6t5GvBFkExMIH9
kqefbLXOQDaBLzhaxIvt
=/bVH
-----END PGP SIGNATURE-----
