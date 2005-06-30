From: Edward Shishkin <edward@namesys.com>
Subject: Re: [PATCH] reiser BUG in 2.6.13-rc1
Date: Thu, 30 Jun 2005 22:49:45 +0400
Message-ID: <42C43EC9.7090700@namesys.com>
References: <20050630101157.GI2243@suse.de> <42C42EFD.8050306@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24851-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42C42EFD.8050306@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Jens Axboe <axboe@suse.de>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com, Andrew Morton <akpm@osdl.org>, Vladimir Saveliev <vs@namesys.com>

Hans Reiser wrote:

>Jens Axboe wrote:
>
>  
>
>>Hi,
>>
>>Reiser is derefencing an uninitialized pointer, causing an oops on boot.
>>
>>Signed-off-by: Jens Axboe <axboe@suse.de>
>>
>>diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
>>--- a/fs/reiserfs/super.c
>>+++ b/fs/reiserfs/super.c
>>@@ -1053,10 +1053,9 @@ static void handle_barrier_mode(struct s
>>
>>static void handle_attrs( struct super_block *s )
>>{
>>-	struct reiserfs_super_block * rs;
>>+	struct reiserfs_super_block * rs = SB_DISK_SUPER_BLOCK (s);
>>
>>	if( reiserfs_attrs( s ) ) {
>>-		rs = SB_DISK_SUPER_BLOCK (s);
>>		if( old_format_only(s) ) {
>>			reiserfs_warning(s, "reiserfs: cannot support attributes on 3.5.x disk format" );
>>			REISERFS_SB(s) -> s_mount_opt &= ~ ( 1 << REISERFS_ATTRS );
>>
>> 
>>
>>    
>>
>Thanks Jens.
>
>Edward, how is the fedora boot bug finding going? Is this it by any chance?
>
>Hans
>  
>

FC4-test3 with root on reiserfs has been successfully booted with 
another miniinstall CD,
so it seems that something wrong in grub.
Unfortunately FC was installed on the workstation which currently is 
used for
intensive benchmarking, so the following is still in todo-list:
- hacking grub
- investigating reiserfs+selinux

Thanks,
Edward.

