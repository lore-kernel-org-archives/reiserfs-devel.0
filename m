From: Viji V Nair <viji@fedoraproject.org>
Subject: Re: Compilation Issue - Reiser4
Date: Thu, 21 Oct 2010 16:41:47 +0530
Message-ID: <AANLkTinYzd2a1Hi-3sqF4ss0-doqiX-LDa=uFH3sQh0a@mail.gmail.com>
References: <AANLkTimQ+8nyP3-Ah3p09Z=Dcq17eCoQ+euqztBABipA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:sender:received
         :in-reply-to:references:from:date:x-google-sender-auth:message-id
         :subject:to:content-type:content-transfer-encoding;
        bh=2NlGFp0HqNdL4s+vsjidlUv01aanW7B/f7WeXKSssFo=;
        b=kTejzvxF8jhFLZMSRDSemdVmGsLer90VRdWSpSFOHld2tSBJPnnhA/navJKRGJekJB
         g1PWiQ6ZZRuRPowGDdEy3M73NYPh5MZeZLC0/UbrbCHNigJdpVjwQ/QIFbEkYT4pAOKR
         NcJo85Ht3S11YQxSuvXdL0TKVCITddK9M/zVA=
In-Reply-To: <AANLkTimQ+8nyP3-Ah3p09Z=Dcq17eCoQ+euqztBABipA@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>, Community support for Fedora users <users@lists.fedoraproject.org>

Hi

On Wed, Oct 20, 2010 at 3:23 PM, Viji V Nair <viji@fedoraproject.org> w=
rote:
> H
>
> I am working on "kmod-reiser4" package, to pack the module only - wil=
l
> help to avoid the full recompilation of the kernel. There are couple
> of issues.
>
> 1. I have downloaded the kernel source package of fedora 13 and
> patched for reiser4. I believe the module should get compiled with th=
e
> kernel-devel package, instead of the full source tree. The main
> purpose of providing =A0the kernel development package with the
> distribution is to support these kind of module development, but the
> reise4 compilation fails with the following error.
>
> # make CONFIG_REISER4_FS=3Dm CONFIG_REISER4_DEBUG=3Dn -C
> /usr/src/kernels/2.6.34.7-56.fc13.x86_64/
> M=3D/data/mockbuild/rpmbuild/BUILD/kernel-2.6.34.fc13/linux-2.6.34.x8=
6_64/fs/reiser4
>
> make: Entering directory `/usr/src/kernels/2.6.34.7-56.fc13.x86_64'
> =A0LD =A0 =A0 =A0/data/mockbuild/rpmbuild/BUILD/kernel-2.6.34.fc13/li=
nux-2.6.34.x86_64/fs/reiser4/built-in.o
> =A0CC [M] =A0/data/mockbuild/rpmbuild/BUILD/kernel-2.6.34.fc13/linux-=
2.6.34.x86_64/fs/reiser4/debug.o
> =A0CC [M] =A0/data/mockbuild/rpmbuild/BUILD/kernel-2.6.34.fc13/linux-=
2.6.34.x86_64/fs/reiser4/jnode.o
> =A0CC [M] =A0/data/mockbuild/rpmbuild/BUILD/kernel-2.6.34.fc13/linux-=
2.6.34.x86_64/fs/reiser4/znode.o
> =A0CC [M] =A0/data/mockbuild/rpmbuild/BUILD/kernel-2.6.34.fc13/linux-=
2.6.34.x86_64/fs/reiser4/key.o
> =A0CC [M] =A0/data/mockbuild/rpmbuild/BUILD/kernel-2.6.34.fc13/linux-=
2.6.34.x86_64/fs/reiser4/pool.o
> =A0CC [M] =A0/data/mockbuild/rpmbuild/BUILD/kernel-2.6.34.fc13/linux-=
2.6.34.x86_64/fs/reiser4/tree_mod.o
> =A0CC [M] =A0/data/mockbuild/rpmbuild/BUILD/kernel-2.6.34.fc13/linux-=
2.6.34.x86_64/fs/reiser4/estimate.o
> =A0CC [M] =A0/data/mockbuild/rpmbuild/BUILD/kernel-2.6.34.fc13/linux-=
2.6.34.x86_64/fs/reiser4/carry.o
> =A0CC [M] =A0/data/mockbuild/rpmbuild/BUILD/kernel-2.6.34.fc13/linux-=
2.6.34.x86_64/fs/reiser4/carry_ops.o
> =A0CC [M] =A0/data/mockbuild/rpmbuild/BUILD/kernel-2.6.34.fc13/linux-=
2.6.34.x86_64/fs/reiser4/lock.o
> =A0CC [M] =A0/data/mockbuild/rpmbuild/BUILD/kernel-2.6.34.fc13/linux-=
2.6.34.x86_64/fs/reiser4/tree.o
> =A0CC [M] =A0/data/mockbuild/rpmbuild/BUILD/kernel-2.6.34.fc13/linux-=
2.6.34.x86_64/fs/reiser4/context.o
> /data/mockbuild/rpmbuild/BUILD/kernel-2.6.34.fc13/linux-2.6.34.x86_64=
/fs/reiser4/context.c:
> In function =91reiser4_throttle_write_at=92:
> /data/mockbuild/rpmbuild/BUILD/kernel-2.6.34.fc13/linux-2.6.34.x86_64=
/fs/reiser4/context.c:156:
> error: implicit declaration of function =91current_is_flush_bd_task=92
> make[1]: *** [/data/mockbuild/rpmbuild/BUILD/kernel-2.6.34.fc13/linux=
-2.6.34.x86_64/fs/reiser4/context.o]
> Error 1
> make: *** [_module_/data/mockbuild/rpmbuild/BUILD/kernel-2.6.34.fc13/=
linux-2.6.34.x86_64/fs/reiser4]
> Error 2
> make: Leaving directory `/usr/src/kernels/2.6.34.7-56.fc13.x86_64'
>
> 2. If I compile against the full source tree,
>
> =A0 =A0 =A0a. I need to run "make scripts && make prepare " first and
> executing make "make CONFIG_REISER4_FS=3Dm CONFIG_REISER4_DEBUG=3Dn -=
C
> /data/mockbuild/rpmbuild/BUILD/kernel-2.6.34.fc13/linux-2.6.34.x86_64
> M=3D/data/mockbuild/rpmbuild/BUILD/kernel-2.6.34.fc13/linux-2.6.34.x8=
6_64/fs/reiser4".
> This is complaining about the missing Module.symvers file, this file
> will be created automatically by running "make all" which is an
> overhead.
>
> =A0 =A0 =A0b. The module alone is getting compiled (on step a), but g=
etting
> the following error when trying to load.
>
> insmod fs/reiser4/reiser4.ko
> insmod: error inserting 'fs/reiser4/reiser4.ko': -1 Invalid module fo=
rmat

reiser4: Unknown symbol lzo1x_1_compress
reiser4: Unknown symbol might_fault
reiser4: Unknown symbol mutex_lock_nested
reiser4: Unknown symbol zlib_deflate
reiser4: Unknown symbol writeback_inodes_wbc
reiser4: Unknown symbol zlib_deflateReset
reiser4: Unknown symbol __raw_spin_lock_init
reiser4: Unknown symbol generic_writeback_sb_inodes
reiser4: Unknown symbol zlib_deflate_workspacesize
reiser4: Unknown symbol zlib_deflateInit2
reiser4: Unknown symbol inode_lock
reiser4: Unknown symbol _raw_spin_unlock_irq
reiser4: Unknown symbol _raw_spin_lock_nested
reiser4: Unknown symbol _raw_read_unlock
reiser4: Unknown symbol _raw_write_unlock
reiser4: Unknown symbol debug_lockdep_rcu_enable
reiser4: Unknown symbol lock_acquire
reiser4: Unknown symbol lock_release
reiser4: Unknown symbol __rwlock_init
reiser4: Unknown symbol writeback_skip_sb_inodes
reiser4: Unknown symbol set_page_dirty_notag
reiser4: Unknown symbol _raw_spin_unlock
reiser4: Unknown symbol find_get_pages
reiser4: Unknown symbol rcu_lock_map

>
>
> Any help on the above is greatly appreciated.
>
> Thanks
> Viji Nair
>
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
