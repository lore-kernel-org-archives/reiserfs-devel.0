From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiserfs3 bug? 2.4.32
Date: Fri, 21 Apr 2006 11:47:35 +0400
Message-ID: <1145605656.6211.39.camel@tribesman.namesys.com>
References: <4433D69B.6010406@cs.yorku.ca>  <44478C50.7060600@cs.yorku.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28518-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44478C50.7060600@cs.yorku.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jason Keltz <jas@cs.yorku.ca>
Cc: Chris Mason <mason@suse.com>, reiserfs-list@namesys.com

Hello

On Thu, 2006-04-20 at 09:27 -0400, Jason Keltz wrote:
> On April 5, I had sent an email to the list about a problem that we were 
> having on our systems that seemed to be reiserfs related. 
> Unfortunately, I didn't get any response.  I'm trying one more time with 
> other information in the hope that someone might be able to assist us in 
> solving this problem.
> 
> We're having problems with our file server crashing every 6-30 days.

Does it crash or lockup? When a system crashes it usually outputs some
information to console. Does it do that in your case?
If it does not - please describe system behavour after crash: is it
lockuped completely or just some process get blocked?

>  I 
> can't remember the last time it stayed up longer than 30 days.  I've 
> recently installed kdb in order to get more debugging information in the 
> hopes that I might be able to get assistance in solving this problem.
> The server crashed for the second time yesterday since I got kdb 
> installed (18 days since the last time).  I've attached some minimal 
> output from kdb (kreiserfsd process, rpc.mountd, lockd, and then 2 nfsd 
> processes).   Any assistance would be appreciated.
> 
> I e-mailed Neil Brown of NFS server fame, and he confirmed that the 
> problem was not an NFS server problem, but a reiserfs one.
> 
> Neil gave me this excellent description of the problem:
> 
> The deadlock is happening in flushing out the journal.  Any process
> that tries to write will need to wait for that journal flush to
> complete, which it won't.

Hmm, 

> One nfsd thread is blocked waiting to write.  It holds a read lock on
> the nfsd exports table.
> There is an 'rpc.mountd' process that is trying to get a write lock on
> the exports table.  It will block until the read lock is released.
> The other nfsd threads are trying to get a read lock.  That won't
> succeed until mountd gets it's write lock and releases it.
> 
> Thus all but one nfsd threads are blocked by mountd which is blocked
> by the remaining nfsd which is blocked by kreiserfsd.
> 
> Special things about our nfs server:
> 
> The server runs stock kernel 2.4.32 with kdb patch and reiserfs quota patch.
> NFS filesystems being exported are all reiserfs3.
> It is a dual processor system running the SMP kernel.
> All exported filesystems are on a 3ware raid card.
> 
> The kdb logs:
> 
> Apr 19 13:39:36 0xf67fc000      247        1  0    1   D  0xf67fc370 
> kreiserfsd
> Apr 19 13:39:36 ESP        EIP        Function (args)
> Apr 19 13:39:36 0xf67fde98 0xc011b144 schedule+0x2b4 (0xc0452e40, 0x0, 
> 0xf67fc000, 0xc91f8a10, 0xc91f8a10)
> Apr 19 13:39:36                                kernel .text 0xc0100000 
> 0xc011ae90 0xc011b3d0
> Apr 19 13:39:36 0xf67fdee0 0xc014680e __wait_on_buffer+0x6e (0xc91f89c0, 
> 0x1601, 0xf67fdf30, 0x1, 0xeeee4000)
> Apr 19 13:39:36                                kernel .text 0xc0100000 
> 0xc01467a0 0xc0146840
> Apr 19 13:39:36 0xf67fdf08 0xf8943e79 [reiserfs]flush_commit_list+0x3e9 
> (0xf69ab800, 0xeae57b20, 0x0)
> Apr 19 13:39:36                                reiserfs .text 0xf8921060 
> 0xf8943a90 0xf8943f60
> Apr 19 13:39:36 0xf67fdf48 0xf8943a41 [reiserfs]flush_older_commits+0x91 
> (0xf69ab800, 0xeae570a0, 0xebc80578, 0xf8ac6000, 0xf
> 6a2373c)
> Apr 19 13:39:37                                reiserfs .text 0xf8921060 
> 0xf89439b0 0xf8943a90
> Apr 19 13:39:37 0xf67fdf68 0xf8943b24 [reiserfs]flush_commit_list+0x94
> Apr 19 13:39:37                                reiserfs .text 0xf8921060 
> 0xf8943a90 0xf8943f60
> Apr 19 13:39:37 0xf67fdfa8 0xf894801d [reiserfs]flush_async_commits+0x3d 
> (0xf69ab800, 0xd17ebee0, 0xf67fdfd8, 0xf67fdfdc, 0x2
> 0)
> Apr 19 13:39:37                                reiserfs .text 0xf8921060 
> 0xf8947fe0 0xf8948020
> Apr 19 13:39:37 0xf67fdfb8 0xf894652b 
> [reiserfs]reiserfs_journal_commit_thread+0x1db
> Apr 19 13:39:37                                reiserfs .text 0xf8921060 
> 0xf8946350 0xf89465f0
> Apr 19 13:39:37 0xf67fdff4 0xc010741e arch_kernel_thread+0x2e
> Apr 19 13:39:37                                kernel .text 0xc0100000 
> 0xc01073f0 0xc0107430
> 
> Apr 19 13:39:47 0xeeffe000      993        1  0    0   S  0xeeffe370 
> rpc.mountd
> Apr 19 13:39:47 ESP        EIP        Function (args)
> Apr 19 13:39:47 0xeefffe04 0xc011b144 schedule+0x2b4 (0x0, 0xeeffe000, 
> 0xf8d30164, 0xee98ff88, 0xeeffe000)
> Apr 19 13:39:47                                kernel .text 0xc0100000 
> 0xc011ae90 0xc011b3d0
> Apr 19 13:39:48 0xeefffe4c 0xc011b78f interruptible_sleep_on+0x4f
> Apr 19 13:39:48                                kernel .text 0xc0100000 
> 0xc011b740 0xc011b7d0
> Apr 19 13:39:48 0xeefffe6c 0xf8d24d8a [nfsd]exp_writelock+0x5a
> Apr 19 13:39:48                                nfsd .text 0xf8d1d060 
> 0xf8d24d30 0xf8d24e30
> Apr 19 13:39:48 0xeefffe74 0xf8d244e6 [nfsd]exp_export+0x76 (0xdff64004, 
> 0xbfffd000, 0x814, 0xc0151015, 0xcf62dc20)
> Apr 19 13:39:48                                nfsd .text 0xf8d1d060 
> 0xf8d24470 0xf8d24880
> Apr 19 13:39:48 0xeefffed4 0xf8d1da4e [nfsd]handle_sys_nfsservctl+0x23e 
> (0x3, 0xbfffd000, 0x0, 0xeeffe000)
> Apr 19 13:39:48                                nfsd .text 0xf8d1d060 
> 0xf8d1d810 0xf8d1dc90
> Apr 19 13:39:48 0xeeffffac 0xc0160ed6 sys_nfsservctl+0x76 (0x3, 
> 0xbfffd000, 0x0, 0x420dabf7, 0x2)
> Apr 19 13:39:48                                kernel .text 0xc0100000 
> 0xc0160e60 0xc0160f4b
> Apr 19 13:39:48 0xeeffffc4 0xc0108f1f system_call+0x33
> Apr 19 13:39:48                                kernel .text 0xc0100000 
> 0xc0108eec 0xc0108f24
> 
> Apr 19 13:40:11 0xeef70000     1021        1  0    1   D  0xeef70370  lockd
> Apr 19 13:40:11 ESP        EIP        Function (args)
> Apr 19 13:40:12 0xeef71f60 0xc011b144 schedule+0x2b4 (0x0, 0xeef70000, 
> 0xeee93f88, 0xf8d30164, 0xeef70000)
> Apr 19 13:40:12                                kernel .text 0xc0100000 
> 0xc011ae90 0xc011b3d0
> Apr 19 13:40:12 0xeef71fa8 0xc011b8af sleep_on+0x4f
> Apr 19 13:40:12                                kernel .text 0xc0100000 
> 0xc011b860 0xc011b8f0
> Apr 19 13:40:12 0xeef71fc8 0xf8d24d0a [nfsd]exp_readlock+0x2a 
> (0xc28ed2e0, 0xeefa7000, 0x7fffffff, 0xeef70000, 0x4789)
> Apr 19 13:40:12                                nfsd .text 0xf8d1d060 
> 0xf8d24ce0 0xf8d24d30
> Apr 19 13:40:12 0xeef71fcc 0xf8d10149 [lockd]lockd+0x1c9
> Apr 19 13:40:12                                lockd .text 0xf8d0e060 
> 0xf8d0ff80 0xf8d10260
> Apr 19 13:40:12 0xeef71ff4 0xc010741e arch_kernel_thread+0x2e
> Apr 19 13:40:12                                kernel .text 0xc0100000 
> 0xc01073f0 0xc0107430
> 
> almost every nfsd was like this:
> 
> Apr 19 13:39:49 0xef00a000      998        1  0    1   D  0xef00a370  nfsd
> Apr 19 13:39:49 ESP        EIP        Function (args)
> Apr 19 13:39:49 0xef00bf38 0xc011b144 schedule+0x2b4 (0x0, 0xef00a000, 
> 0xeed05f88, 0xee997f88, 0x337)
> Apr 19 13:39:49                                kernel .text 0xc0100000 
> 0xc011ae90 0xc011b3d0
> Apr 19 13:39:49 0xef00bf80 0xc011b8af sleep_on+0x4f
> Apr 19 13:39:49                                kernel .text 0xc0100000 
> 0xc011b860 0xc011b8f0
> Apr 19 13:39:49 0xef00bfa0 0xf8d24d0a [nfsd]exp_readlock+0x2a 
> (0xc28ed260, 0xf002d800, 0x7530, 0xb4fae97, 0xef00a000)
> Apr 19 13:39:49                                nfsd .text 0xf8d1d060 
> 0xf8d24ce0 0xf8d24d30
> Apr 19 13:39:49 0xef00bfa4 0xf8d1d3a8 [nfsd]nfsd+0x1a8
> Apr 19 13:39:49                                nfsd .text 0xf8d1d060 
> 0xf8d1d200 0xf8d1d580
> Apr 19 13:39:49 0xef00bff4 0xc010741e arch_kernel_thread+0x2e
> Apr 19 13:39:49                                kernel .text 0xc0100000 
> 0xc01073f0 0xc0107430
> and one like this:
> 
> Apr 19 13:40:33 0xeeee4000     1043        1  0    0   D  0xeeee4370  nfsd
> Apr 19 13:40:33 ESP        EIP        Function (args)
> Apr 19 13:40:33 0xeeee5920 0xc011b144 schedule+0x2b4 (0x1, 0xeeee4000, 
> 0xeae57b44, 0xeae57b44, 0x14ca5af6)
> Apr 19 13:40:33                                kernel .text 0xc0100000 
> 0xc011ae90 0xc011b3d0
> Apr 19 13:40:33 0xeeee5968 0xc01079b3 __down+0x83
> Apr 19 13:40:33                                kernel .text 0xc0100000 
> 0xc0107930 0xc0107a10
> Apr 19 13:40:33 0xeeee598c 0xc0107b5c __down_failed+0x8 (0xf69ab800, 
> 0xeae57b20, 0xeeee59c4, 0x0, 0xf7fda438)
> Apr 19 13:40:33                                kernel .text 0xc0100000 
> 0xc0107b54 0xc0107b60
> Apr 19 13:40:34 0xeeee599c 0xf894969c [reiserfs].text.lock.journal+0x5
> Apr 19 13:40:34                                reiserfs .text 0xf8921060 
> 0xf8949697 0xf89497f0
> Apr 19 13:40:34 0xeeee599c 0xf8943b3a [reiserfs]flush_commit_list+0xaa 
> (0xf69ab800, 0xeae57b20, 0x1, 0x0)
> Apr 19 13:40:34                                reiserfs .text 0xf8921060 
> 0xf8943a90 0xf8943f60
> Apr 19 13:40:34 0xeeee59dc 0xf8943417 [reiserfs]get_list_bitmap+0x77 
> (0xf69ab800, 0xe2279840, 0x1, 0x2, 0x0)
> Apr 19 13:40:34                                reiserfs .text 0xf8921060 
> 0xf89433a0 0xf8943450
> Apr 19 13:40:34 0xeeee5a00 0xf89491a1 [reiserfs]do_journal_end+0x7d1 
> (0xeeee5a74, 0xf69ab800, 0x1, 0x2, 0xf69ab800)
> Apr 19 13:40:34                                reiserfs .text 0xf8921060 
> 0xf89489d0 0xf89495a0
> Apr 19 13:40:34 0xeeee5a64 0xf894753a [reiserfs]do_journal_begin_r+0x14a
> Apr 19 13:40:34                                reiserfs .text 0xf8921060 
> 0xf89473f0 0xf8947670
> Apr 19 13:40:34 0xeeee5aa8 0xf89477f2 
> [reiserfs]journal_begin_Rsmp_c8218e28+0x72 (0xeeee5e54, 0xf69ab800, 
> 0x384, 0x0, 0x2)
> Apr 19 13:40:35                                reiserfs .text 0xf8921060 
> 0xf8947780 0xf8947850
> Apr 19 13:40:35 0xeeee5acc 0xf89471f2 
> [reiserfs]reiserfs_restart_transaction+0x92 (0xeeee5e54, 0x384, 
> 0x2ec7ca2, 0x1, 0x168ec
> )
> Apr 19 13:40:35 [0]more>
> Apr 19 13:40:36                                reiserfs .text 0xf8921060 
> 0xf8947160 0xf8947240
> Apr 19 13:40:36 0xeeee5af4 0xf893e9f2 
> [reiserfs]prepare_for_delete_or_cut+0x622 (0xeeee5e54, 0xd6c0f580, 
> 0xeeee5dd4, 0xeeee5d
> b4, 0xeeee5bb8)
> Apr 19 13:40:36                                reiserfs .text 0xf8921060 
> 0xf893e3d0 0xf893ebc0
> Apr 19 13:40:36 0xeeee5b6c 0xf893fc08 
> [reiserfs]reiserfs_cut_from_item+0xd8 (0xeeee5e54, 0xeeee5dd4, 
> 0xeeee5db4, 0xd6c0f580,
> 0x0)
> Apr 19 13:40:36                                reiserfs .text 0xf8921060 
> 0xf893fb30 0xf89401d0
> Apr 19 13:40:36 0xeeee5d84 0xf894050e [reiserfs]reiserfs_do_truncate+0x29e
> Apr 19 13:40:36                                reiserfs .text 0xf8921060 
> 0xf8940270 0xf89407d0
> Apr 19 13:40:36 0xeeee5e28 0xf893f6ad 
> [reiserfs]reiserfs_delete_object+0x3d (0xeeee5e54, 0xd6c0f580, 0x24, 
> 0xd6c0f5ec, 0xf69a
> b800)
> Apr 19 13:40:36                                reiserfs .text 0xf8921060 
> 0xf893f670 0xf893f6f0
> Apr 19 13:40:37 0xeeee5e44 0xf8929727 
> [reiserfs]reiserfs_delete_inode+0x107 (0xd6c0f580, 0xffffffff, 0x0)
> Apr 19 13:40:37                                reiserfs .text 0xf8921060 
> 0xf8929620 0xf89297b0
> Apr 19 13:40:37 0xeeee5e88 0xc015f12a iput+0x17a
> Apr 19 13:40:37                                kernel .text 0xc0100000 
> 0xc015efb0 0xc015f2e0
> Apr 19 13:40:37 0xeeee5ea4 0xc015ca25 d_delete+0xa5
> Apr 19 13:40:37                                kernel .text 0xc0100000 
> 0xc015c980 0xc015ca40
> Apr 19 13:40:37 0xeeee5eb8 0xc0153a85 vfs_unlink+0x185
> Apr 19 13:40:37                                kernel .text 0xc0100000 
> 0xc0153900 0xc0153be0
> Apr 19 13:40:37 0xeeee5ed4 0xf8d23a35 [nfsd]nfsd_unlink+0x125 
> (0xeeef4c00, 0xeeef4804, 0xffffc000, 0xeeee006c, 0xa)
> Apr 19 13:40:37                                nfsd .text 0xf8d1d060 
> 0xf8d23910 0xf8d23b50
> Apr 19 13:40:37 0xeeee5f10 0xf8d2888d [nfsd]nfsd3_proc_remove+0x7d 
> (0xeeef4c00, 0xeeef4a00, 0xeeef4800)
> Apr 19 13:40:37                                nfsd .text 0xf8d1d060 
> 0xf8d28810 0xf8d28920
> Apr 19 13:40:38 0xeeee5f48 0xf8d1d64e [nfsd]nfsd_dispatch+0xce 
> (0xeeef4c00, 0xeeee0018, 0xeeee5f8c, 0x94, 0x98)
> Apr 19 13:40:38                                nfsd .text 0xf8d1d060 
> 0xf8d1d580 0xf8d1d765
> Apr 19 13:40:38 [0]more>
> Apr 19 13:40:38 0xeeee5f64 0xf8cfe2cf 
> [sunrpc]svc_process_Rsmp_877fc141+0x45f (0xc28ed260, 0xeeef4c00, 0x7530, 
> 0xb4f38b8, 0xe
> eee4000)
> Apr 19 13:40:38                                sunrpc .text 0xf8cf6060 
> 0xf8cfde70 0xf8cfe3f5
> Apr 19 13:40:39 0xeeee5fa4 0xf8d1d41f [nfsd]nfsd+0x21f
> Apr 19 13:40:39                                nfsd .text 0xf8d1d060 
> 0xf8d1d200 0xf8d1d580
> Apr 19 13:40:39 0xeeee5ff4 0xc010741e arch_kernel_thread+0x2e
> Apr 19 13:40:39                                kernel .text 0xc0100000 
> 0xc01073f0 0xc0107430
> 
> Thanks for any help you can provide...
> 
> Jason Keltz
> 

