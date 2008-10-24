From: doiggl@velocitynet.com.au
Subject: Re: Question: Reiser4 and 2.6.27x kernel
Date: Fri, 24 Oct 2008 23:12:41 +1000 (EST)
Message-ID: <10611.202.168.22.19.1224853961.squirrel@webmail.velocity.net.au>
References: <11024.202.168.22.19.1223552449.squirrel@webmail.velocity.net.au>
    <48EE0B25.6000203@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <48EE0B25.6000203@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,
Questions:
- Any news on getting Reiser4 module(reiser4.ko) built by the build
service going for the 2.6.27.X-default kernel as I would like to use it
again with the 11.1 series (beta) ?
Thanks for all your hard work on the reiser4.ko module.
Glenn
-
Reference material (Last updated: 16-Aug-2008 14:24 ?):

-
http://download.opensuse.org/repositories/drivers:/filesystems/openSUSE_Factory/x86_64/reiser4-kmp-default-0.1_2.6.26_11.4-22.11.x86_64.rpm

-
https://build.opensuse.org/package/live_build_log?arch=x86_64&package=reiser4-kmp&project=home%3Ajeff_mahoney&repository=openSUSE_Factory


- The build service appears to be still waiting on something.
- I saw this at the end of the last [failed] build log.

make -C ../../../linux-2.6.27.1-2
O=/usr/src/linux-2.6.27.1-2-obj/x86_64/debug/. modules
CC [M] /usr/src/packages/BUILD/reiser4-2.6.25/obj/debug/debug.o
CC [M] /usr/src/packages/BUILD/reiser4-2.6.25/obj/debug/jnode.o
/usr/src/packages/BUILD/reiser4-2.6.25/obj/debug/jnode.c: In function
'inode_attach_jnode':
/usr/src/packages/BUILD/reiser4-2.6.25/obj/debug/jnode.c:437: warning:
passing argument 1 of '_write_lock_irq' from incompatible pointer type
/usr/src/packages/BUILD/reiser4-2.6.25/obj/debug/jnode.c:439: warning:
passing argument 1 of '_write_unlock_irq' from incompatible pointer type
/usr/src/packages/BUILD/reiser4-2.6.25/obj/debug/jnode.c: In function
'inode_detach_jnode':
/usr/src/packages/BUILD/reiser4-2.6.25/obj/debug/jnode.c:467: warning:
passing argument 1 of '_write_lock_irq' from incompatible pointer type
/usr/src/packages/BUILD/reiser4-2.6.25/obj/debug/jnode.c:469: warning:
passing argument 1 of '_write_unlock_irq' from incompatible pointer type
/usr/src/packages/BUILD/reiser4-2.6.25/obj/debug/jnode.c: In function
'jnode_lock_page':
/usr/src/packages/BUILD/reiser4-2.6.25/obj/debug/jnode.c:750: error:
implicit declaration of function 'TestSetPageLocked'
make[3]: *** [/usr/src/packages/BUILD/reiser4-2.6.25/obj/debug/jnode.o]
Error 1
make[2]: *** [_module_/usr/src/packages/BUILD/reiser4-2.6.25/obj/debug]
Error 2
make[1]: *** [sub-make] Error 2
make: *** [all] Error 2
make: Leaving directory `/usr/src/linux-2.6.27.1-2-obj/x86_64/debug'
error: Bad exit status from /var/tmp/rpm-tmp.91225 (%build)


RPM build errors:
cannot open Pubkeys index using db3 - No such file or directory (2)
Bad exit status from /var/tmp/rpm-tmp.91225 (%build)
System halted.

Jeff wrote:
>
> It looks like the build service is currently hung up on something there.
> It's waiting on kernel-source and kernel-syms to finish building, but it
> appears to have been waiting a very long time. We're looking at a
> related problem internally. Sorry, no ETA for a fix.
>
> - -Jeff

>> Hello
>> A question for Jeff.
>>
>> Q1. Is there a Reiser4 module(reiser4.ko) available for the 2.6.27-rc*
>> kernel ?, or will there be one made available for 2.6.27x kernel ?
>>
>> I was looking for one at
>> http://download.opensuse.org/repositories/drivers:/filesystems/openSUSE_Factory/x86_64/
>>
>> I tried to install the current version but failed.
>>
>> # rpm -ivhU reiser4-kmp-default-0.1_2.6.26_11.4-22.11.x86_64.rpm
>> warning: reiser4-kmp-default-0.1_2.6.26_11.4-22.11.x86_64.rpm: Header V3
>> DSA signature: NOKEY, key ID 74de2879
>> error: Failed dependencies:
>>         kernel(default:vmlinux) = 214a1cfb3969f710 is needed by
>> reiser4-kmp-default-0.1_2.6.26_11.4-22.11.x86_64
>>
>> # uname -a
>> Linux linux.site 2.6.27-rc7-12-default #1 SMP 2008-09-29 23:39:54 +0200
>> x86_64 x86_64 x86_64 GNU/Linux


