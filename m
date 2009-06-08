From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Build Log failure for Package reiser4-kmp
Date: Mon, 08 Jun 2009 03:04:03 -0400
Message-ID: <4A2CB7E3.80401@suse.com>
References: <12161.202.168.22.19.1244439532.squirrel@webmail.velocity.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <12161.202.168.22.19.1244439532.squirrel@webmail.velocity.net.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi Glenn -

I've updated the reiser4-kmp package to build against 2.6.30-rc8.

It requires an updated kernel as well. The changelog should contain:

- -------------------------------------------------------------------
Mon Jun  8 09:01:23 CEST 2009 - jeffm@suse.com

- - patches.suse/reiser4-set_page_dirty_notag: mm: Add
  set_page_dirty_notag() helper for reiser4.

- -Jeff

doiggl@velocitynet.com.au wrote:
> Hello,
> I have some questions.
> Question 1.
> Where is the place to check what kernel level the reiser 4 rpm module is
> compiled against.
> It is not easy to tell what kernel level is needed at the installation
> time of the rpm module.As an example I did install
> reiser4-kmp-default-0.1_2.6.27.13_3-27.17 on kernel 2.6.27.7-9-default
> x86_64.
> I cannot update the module to reiser4-kmp-default-0.1_2.6.27.7_9.1-27.3
> which I presume is the last successfully compiled one as I have not got
> the correct kernel installed.
> (output...)
> # rpm -ivhU reiser4-kmp-default-0.1_2.6.27.13_3-27.17.x86_64.rpm
> warning: reiser4-kmp-default-0.1_2.6.27.13_3-27.17.x86_64.rpm: Header V3
> DSA signature: NOKEY, key ID 74de2879
> error: Failed dependencies:
>         kernel(default:kernel) = c27d618420e5a365 is needed by
> reiser4-kmp-default-0.1_2.6.27.13_3-27.17.x86_64
>         kernel(default:kernel) = cb9e58600a4dd393 is needed by
> reiser4-kmp-default-0.1_2.6.27.13_3-27.17.x86_64
>         kernel(default:mm) = 86199f6cc0bdd6fa is needed by
> reiser4-kmp-default-0.1_2.6.27.13_3-27.17.x86_64
>         kernel(default:vmlinux) = 6535f6c0489f55c0 is needed by
> reiser4-kmp-default-0.1_2.6.27.13_3-27.17.x86_64
>         kernel(default:arch_x86_kernel) = 84463955bcd9679b is needed by
> reiser4-kmp-default-0.1_2.6.27.13_3-27.17.x86_64
>         kernel(default:fs) = 8a2ea2f7b702a737 is needed by
> reiser4-kmp-default-0.1_2.6.27.13_3-27.17.x86_64
>         kernel(default:fs) = f10b21074e25c0fd is needed by
> reiser4-kmp-default-0.1_2.6.27.13_3-27.17.x86_64
>         kernel(default:fs_debugfs) = 33cc6cf4c644fb99 is needed by
> reiser4-kmp-default-0.1_2.6.27.13_3-27.17.x86_64
>         kernel(default:block) = 8236e5907394d933 is needed by
> reiser4-kmp-default-0.1_2.6.27.13_3-27.17.x86_64
>         kernel(default:lib) = 0e4b7a90761724ad is needed by
> reiser4-kmp-default-0.1_2.6.27.13_3-27.17.x86_64
> 
> 
> Question 2.
> Is there a chance to get the reiser4 module compiling again to a working
> state as the build shows a compile failure on the prepare_write &
> commit_write lines.
> It would be greatly appreciated to use the module for more recent kernels.
> Thanks for your help Glenn
> 
> (last section of log..)
> https://build.opensuse.org/package/live_build_log?arch=x86_64&package=reiser4-kmp&project=drivers%3Afilesystems&repository=openSUSE_Factory
> .
> .
> make -C ../../../linux-2.6.30-rc6-git3-4
> O=/usr/src/linux-2.6.30-rc6-git3-4-obj/x86_64/debug/. modules
> CC [M] /usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/debug.o
> CC [M] /usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/jnode.o
> CC [M] /usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/znode.o
> CC [M] /usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/key.o
> CC [M] /usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/pool.o
> CC [M] /usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/tree_mod.o
> CC [M] /usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/estimate.o
> CC [M] /usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/carry.o
> CC [M] /usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/carry_ops.o
> /usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/carry_ops.c: In function
> 'find_left_neighbor':
> /usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/carry_ops.c:81: warning:
> suggest parentheses around operand of '!' or change '&' to '&&' or '!' to
> '~'
> /usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/carry_ops.c: In function
> 'find_right_neighbor':
> /usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/carry_ops.c:205: warning:
> suggest parentheses around operand of '!' or change '&' to '&&' or '!' to
> '~'
> CC [M] /usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/lock.o
> CC [M] /usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/tree.o
> CC [M] /usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/context.o
> CC [M] /usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/tap.o
> CC [M] /usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/coord.o
> CC [M] /usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/block_alloc.o
> CC [M] /usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/txnmgr.o
> CC [M] /usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/kassign.o
> CC [M] /usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/flush.o
> CC [M] /usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/wander.o
> CC [M] /usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/eottl.o
> CC [M] /usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/search.o
> CC [M] /usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/page_cache.o
> /usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/page_cache.c:563: error:
> unknown field 'prepare_write' specified in initializer
> /usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/page_cache.c:564: error:
> unknown field 'commit_write' specified in initializer
> make[3]: ***
> [/usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/page_cache.o] Error 1
> make[2]: *** [_module_/usr/src/packages/BUILD/reiser4-2.6.27/obj/debug]
> Error 2
> make[1]: *** [sub-make] Error 2
> make: *** [all] Error 2
> make: Leaving directory `/usr/src/linux-2.6.30-rc6-git3-4-obj/x86_64/debug'
> error: Bad exit status from /var/tmp/rpm-tmp.67120 (%build)
> 
> RPM build errors:
> cannot open Pubkeys index using db3 - No such file or directory (2)
> Bad exit status from /var/tmp/rpm-tmp.67120 (%build)
> System halted.
> 
> Jeff Mahoney wrote:
>> Ok, if that's the goal, I can just track it when I update the reiser4
> patch.
>> - -Jeff
>>
> 


- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iEYEARECAAYFAkost+MACgkQLPWxlyuTD7K2fQCghFyJjhxW8HVzJBV7S4oRNK5v
Q5YAniA7nFzjrrjE1G1ZZb3QRsOD+GS3
=hN4+
-----END PGP SIGNATURE-----
