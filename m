From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: Another panic!
Date: Mon, 22 Nov 2004 18:59:02 +0200
Message-ID: <20041122165902.GA26192@nysv.org>
References: <20041121163755.GV26192@nysv.org> <20041121172031.GW26192@nysv.org> <41A1FDAD.9040903@namesys.com> <20041122160122.GZ26192@nysv.org> <41A21DF9.7060907@namesys.com> <41A21EE4.9090602@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22498-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <41A21EE4.9090602@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "E.Gryaznova" <grev@namesys.com>
Cc: reiserfs-list@namesys.com

I'm setting the Cc to the list, these questions may be relevant
to other people with the same issues and I think they should probably
reply as well :)

>>>I do an apt-get source --build crystalspace (but some others
>>>on the list said they used apt-get update, which I haven't tested)

>>>Anyway, zam said this should be fixed already in -rc2-mm2, but
>>>not for me it wasn't; I just need to get my second lan cable
>>>back and do a netconsole dump later.

>>was reiser4 debug "on"?

At first no, that's when I got:
Nov 21 18:07:14 shrike kernel: WARNING: Found but not happy: 2
Nov 21 18:07:14 shrike kernel: reiser4[ent:hda2!(175)]: jnode_lock_parent_coord 
(fs/reiser4/flush.c:3093)[nikita-3178]:
Nov 21 18:07:14 shrike kernel: WARNING: Found but not happy: 2
Nov 21 18:07:14 shrike kernel: reiser4[ent:hda2!(175)]: jnode_lock_parent_coord 
(fs/reiser4/flush.c:3093)[nikita-3178]:

And so on

With debug:

Nov 21 21:45:11 shrike kernel: kernel BUG at fs/reiser4/plugin/file/tail_conversion.c:58!

>sorry, forgot to ask the following:
>what gcc and glibc version do you use for building kernel and  apt-get?
>how much ram do you use?

ii  libc6          2.3.2.ds1-18   GNU C Library: Shared libraries and Timezone

gcc version 3.3.5 (Debian 1:3.3.5-2)

I have 215MB of ram and about equally swap, but swap is seldom used
because of -ck's mapped watermark

I didn't build apt-get myself, but if this helps:

mjt@shrike:~$ ldd `which apt-get`
                libapt-pkg-libc6.3-5.so.3.3 =>
/usr/lib/libapt-pkg-libc6.3-5.so.3.3 (0xb7f4f000)
        libstdc++.so.5 => /usr/lib/libstdc++.so.5 (0xb7e94000)
        libm.so.6 => /lib/tls/i686/cmov/libm.so.6 (0xb7e71000)
        libgcc_s.so.1 => /lib/libgcc_s.so.1 (0xb7e68000)
        libc.so.6 => /lib/tls/i686/cmov/libc.so.6 (0xb7d2d000)
        /lib/ld-linux.so.2 => /lib/ld-linux.so.2 (0xb7fea000)

Thanks!

PS.
I'll try to get the extra lan cable back today and do a better check..

-- 
mjt

