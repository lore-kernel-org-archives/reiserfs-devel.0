From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: BUG umounting to shut down
Date: Thu, 19 Jan 2006 18:34:04 -0700
Message-ID: <1137720844.6573.79.camel@tribesman.namesys.com>
References: <1137637037.10929.86.camel@gentoo>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27797-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1137637037.10929.86.camel@gentoo>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jake Maciejewski <maciejej@msoe.edu>
Cc: reiserfs-list@namesys.com

Hello

On Wed, 2006-01-18 at 20:17 -0600, Jake Maciejewski wrote:
> I was shutting down my amd64 system with reiser4-for-2.6.14-1.patch.gz
> on 2.6.14.2 when I got the output below. I haven't had the problem
> before and probably couldn't reproduce it easily. I can provide more
> details if requested, but I left out the contents of all the registers
> because I was transcribing from digital photos.
> 
> Kernel BUG at fs/reiser4/fsdata.c:149

I believe that
ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.15/reiser4-for-2.6.15-1.patch.gz has this problem fixed. Would you please try to upgrade?
Note that changes are substantial, please, be careful.

> invalid operand: 0000 [1] PREEMPT
> ...
> Pid: 2691, comm: umount Tainted: P	2.6.14.2-1 #1
> ...
> Call Trace:<ffffffff801d58c9>{done_fs_info+9} <ffffffff801ce6fd>{reiser4_put_super+221}
> 	<ffffffff8017aae2>{generic_shutdown_super+162} <ffffffff8017bc2d>{kill_block_super+45}
> 	<ffffffff8017aa0f>{deactivate_super+111} <ffffffff801937e8>{sys_umount+664}
> 	<ffffffff801665fd>{do_munmap+669} <ffffffff8010e339>{error_exit+0}
> 	<ffffffff8010da46>{system_call+126}
> 
> Code: 0f 0b 68 d7 b9 34 80 c2 95 00 66 66 66 90 48 8b bb d0 03 00
> RIP <ffffffff801ceea2>{done_super_d_info+18} RSP <ffff810002957e38>
>  Badness in do_exit at kernel/exit.c:799
> 
> Call Trace:<ffffffff8013223c>{do_exit+76} <ffffffff802645a5>{do_unblank_screen+21}
> 	<ffffffff8010f131>{die+81} <ffffffff8010f3f1>{do_invalid_op+145}
> 	<ffffffff801ceea2>{done_super_d_info+18} <ffffffff8032c3e0>{thread_return+0}
> 	<ffffffff8010e339>{error_exit+0} <ffffffff801a9760>{proc_destroy_inode+0}
> 	<ffffffff801ceea2>{done_super_d_info+18} <ffffffff801d58c9>{done_fs_info+9}
> 	<ffffffff801ce6fd>{reiser4_put_super+221} <ffffffff8017aae2>{generic_shutdown_super+162}
> 	<ffffffff8017bc2d>{kill_block_super+45} <ffffffff8017aa0f>{deactivate_super+111}
> 	<ffffffff801937e8>{sys_umount+664} <ffffffff801665fd>{do_munmap+669}
> 	<ffffffff8010e339>{error_exit+0} <ffffffff8010da46>{system_call+126}
> 
> <4>reiser4[umount(26912)]: release_unix_file (fs/reiser4/plugin/file/file.c:2733)[vs-44]:
> WARNING: out of memory?
> <4>reiser4[umount(26912)]: release_unix_file (fs/reiser4/plugin/file/file.c:2733)[vs-44]:
> WARNING: out of memory?
> <4>reiser4[umount(26912)]: release_unix_file (fs/reiser4/plugin/file/file.c:2733)[vs-44]:
> WARNING: out of memory?
> <4>reiser4[umount(26912)]: release_unix_file (fs/reiser4/plugin/file/file.c:2733)[vs-44]:
> WARNING: out of memory?
> /etc/init.d/halt.sh: line 86: 26912 Segmentation fault	umount -f -r "${x}" >&/dev/null
> 
> 

