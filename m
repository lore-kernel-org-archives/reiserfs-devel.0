From: doiggl@velocitynet.com.au
Subject: Re: Nightly Builds
Date: Wed, 25 Jun 2008 00:44:14 +1000 (EST)
Message-ID: <27533.202.168.22.19.1214318654.squirrel@webmail.velocity.net.au>
References: <66CE03FC-0D5A-4837-A2F5-1D00833EE70E@jasonandannette.us>
    <485C0BA9.5090902@suse.com>
    <28097.202.168.22.19.1214146293.squirrel@webmail.velocity.net.au>
    <485E788A.8020802@suse.com>
    <15568.202.168.22.19.1214194598.squirrel@webmail.velocity.net.au>
    <485FAF96.40608@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <485FAF96.40608@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello Jeff,
- I just interested in the Opensuse 11 or Factory.
- I do have a build service account.
- Ive set up a sample project 'Reiser4-experimental' with (home:doiggl)

I'm stuck on how to do the next bit which is -
Question: How do I create a derivative package by linking to
rivers:filesystems/reiser4-kmp ?

In the past I tried to compile on a pc, just a vanilla patched reiser4
kernel but it did not boot at all.
These are the steps I did:
 cd /usr/src
 rm linux
 rm -rf linux-2.6.25
 tar -jxvf  linux-2.6.25.8.tar.bz2
 ln -s /usr/src/linux-2.6.25.8 linux
 cd  /usr/src/linux
 patch -p1 --dry-run < ../reiser4-for-2.6.25.patch
 echo "apply patch reiser4-for-2.6.25.patch"
 patch -p1 < ../reiser4-for-2.6.25.patch
 cp /boot/config-$(uname -r) .config
 make menuconfig
 make binrpm-pkg | tee ../make-r4-2.6.25.log

Here was the last bit of the output:-

  DEPMOD  2.6.25.8-default-reiser4
Processing files: kernel-2.6.25.8defaultreiser4-1
Finding  Provides: /usr/lib/rpm/find-provides kernel
Finding  Requires: /usr/lib/rpm/find-requires kernel
Finding  Supplements: /usr/lib/rpm/find-supplements kernel
Provides: kernel-2.6.25.8-default-reiser4
Requires(rpmlib): rpmlib(PayloadFilesHavePrefix) <= 4.0-1
rpmlib(CompressedFileNames) <= 3.0.4-1
Checking for unpackaged file(s): /usr/lib/rpm/check-files
/var/tmp/kernel-2.6.25.8defaultreiser4-root
Wrote:
/usr/src/packages/RPMS/x86_64/kernel-2.6.25.8defaultreiser4-1.x86_64.rpm

Questions:
- So what is the next step I can do ?
- Do you have a sample spec file I can use to compile a reiser4 kernel ?
Glenn


> Jeff wrote,
> If you're interested in seeing a particular distribution supported,
> please set up a build service account and create a derivative package by
>  linking to drivers:filesystems/reiser4-kmp. Once you've gotten it
> working on your distribution, let me know, and I'll pull the changes
> into the drivers:filesystems project.
>
> - -Jeff
>
> - --
> Jeff Mahoney
> SUSE Labs


