From: doiggl@velocitynet.com.au
Subject: Re: Reiser4 module and 2.6.29-x-default kernel
Date: Sun, 31 May 2009 00:07:03 +1000 (EST)
Message-ID: <27301.202.168.22.19.1243692423.squirrel@webmail.velocity.net.au>
References: <13991.202.168.22.19.1242997798.squirrel@webmail.velocity.net.au>
    <4A16AAA5.9040105@suse.com> <4A16C922.1090700@gmail.com>
    <4A16CF1B.30509@suse.com>
    <11576.202.168.22.19.1243470735.squirrel@webmail.velocity.net.au>
    <4A1E00B4.1000706@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4A1E00B4.1000706@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>, reiserfs-devel@vger.kernel.org

Hello,
I note from the build log that it fails.
https://build.opensuse.org/package/live_build_log?arch=x86_64&package=reiser4-kmp&project=drivers%3Afilesystems&repository=openSUSE_Factory
note the errors on prepare_write & commit_write lines

 CC [M] /usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/carry_ops.o
/usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/carry_ops.c: In function
'find_left_neighbor':
/usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/carry_ops.c:81: warning:
suggest parentheses around operand of '!' or change '&' to '&&' or '!' to
'~'
/usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/carry_ops.c: In function
'find_right_neighbor':
/usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/carry_ops.c:205: warning:
suggest parentheses around operand of '!' or change '&' to '&&' or '!' to
'~'
CC [M] /usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/lock.o
CC [M] /usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/tree.o
CC [M] /usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/context.o
CC [M] /usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/tap.o
CC [M] /usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/coord.o
CC [M] /usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/block_alloc.o
CC [M] /usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/txnmgr.o
CC [M] /usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/kassign.o
CC [M] /usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/flush.o
CC [M] /usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/wander.o
CC [M] /usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/eottl.o
CC [M] /usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/search.o
CC [M] /usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/page_cache.o
/usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/page_cache.c:563: error:
unknown field 'prepare_write' specified in initializer
/usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/page_cache.c:564: error:
unknown field 'commit_write' specified in initializer
make[3]: ***
[/usr/src/packages/BUILD/reiser4-2.6.27/obj/debug/page_cache.o] Error 1
make[2]: *** [_module_/usr/src/packages/BUILD/reiser4-2.6.27/obj/debug]
Error 2
make[1]: *** [sub-make] Error 2
make: *** [all] Error 2
make: Leaving directory `/usr/src/linux-2.6.30-rc6-git3-4-obj/x86_64/debug'
error: Bad exit status from /var/tmp/rpm-tmp.67120 (%build)


RPM build errors:
cannot open Pubkeys index using db3 - No such file or directory (2)
Bad exit status from /var/tmp/rpm-tmp.67120 (%build)
System halted.


Jeff Mahoney wrote:
> Ok, if that's the goal, I can just track it when I update the reiser4
patch.
> - -Jeff
>

