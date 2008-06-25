From: doiggl@velocitynet.com.au
Subject: Re: Nightly Builds
Date: Wed, 25 Jun 2008 22:59:34 +1000 (EST)
Message-ID: <15208.202.168.22.19.1214398774.squirrel@webmail.velocity.net.au>
References: <66CE03FC-0D5A-4837-A2F5-1D00833EE70E@jasonandannette.us>
    <485C0BA9.5090902@suse.com>
    <28097.202.168.22.19.1214146293.squirrel@webmail.velocity.net.au>
    <485E788A.8020802@suse.com>
    <15568.202.168.22.19.1214194598.squirrel@webmail.velocity.net.au>
    <485FAF96.40608@suse.com>
    <27533.202.168.22.19.1214318654.squirrel@webmail.velocity.net.au>
    <48610B80.3020908@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <48610B80.3020908@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Questions:
-If I install rpm reiser4-kmp-0.1-18.2.x86_64.rpm in Opensuse 11,
will it install /lib/modules/$VERSION/kernel/fs/reiser4/reiser4.ko in the
correct place ?
- Would I be able to restart the pc and run Reiser4 commands to format and
set up a Reiser4 partition and use that ?
Glenn

Jeff wrote
> No, I don't build entire kernels - just the kernel module package. The
> package will just contain
> /lib/modules/$VERSION/kernel/fs/reiser4/reiser4.ko. If you want to boot
> using reiser4, put the module in your initramfs.
>
> - -Jeff


