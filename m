From: m@thieu.so
Subject: Re: Reiser4 GIT and Kernel 3.11 patchs
Date: Thu, 19 Sep 2013 15:14:03 +0000
Message-ID: <20130919151403.Horde.VoBIXKovROrctv021aPeYw7@mail.thieu.so>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed	DelSp=Yes"
To: Chris Gentile <cnjgentile@gmail.com>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, =?utf-8?b?RHXFoWFuIA==?= =?utf-8?b?xIxvbGnEhw==?= <dusanc@gmail.com>, Evgeniy <iron.udjin@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

Quoting Christopher Gentile <cnjgentile@gmail.com>> Hi fyi,
>
> From Mathieu's Github a few minutes ago ....
>
> Compile on 3.12-rc1 - fail -, but much closer to end of compile so
> we're moving in the right direction. See below.
>
> fs/reiser4/init_super.c: In function 'reiser4_init_read_super':
> fs/reiser4/init_super.c:561:14: warning: argument to 'sizeof' in
> 'strncmp' call is the same expression as the second source; did you
> mean to provide an explicit length? [-Wsizeof-pointer-memaccess]
> sizeof(REISER4_SUPER_MAGIC_STRING))) {
> ^
> CC fs/nfs/nfs4client.o
> CC fs/nfs/nfs4session.o
> CC fs/reiser4/plugin/node/node.o
> CC fs/reiser4/plugin/object.o
> CC fs/nfs/dns_resolve.o
> CC fs/reiser4/plugin/cluster.o
> CC fs/nfs/nfs4trace.o
> CC fs/reiser4/plugin/inode_ops.o
> CC fs/nfs/nfs4sysctl.o
> CC fs/xfs/xfs_trans.o
> fs/reiser4/plugin/object.c:152:2: warning: initialization from
> incompatible pointer type [enabled by default]
> .invalidatepage =3D reiser4_invalidatepage,
> ^
> fs/reiser4/plugin/object.c:152:2: warning: (near initialization for
> 'regular_file_a_ops.invalidatepage') [enabled by default]
> fs/reiser4/plugin/object.c:191:2: warning: initialization from
> incompatible pointer type [enabled by default]
> .iterate =3D reiser4_readdir_common,
> ^
> fs/reiser4/plugin/object.c:191:2: warning: (near initialization for
> 'directory_f_ops.iterate') [enabled by default]
> CC fs/xfs/xfs_xattr.o
> CC fs/xfs/kmem.o
> CC fs/reiser4/plugin/inode_ops_rename.o
> CC fs/reiser4/plugin/file_ops.o
> CC fs/reiser4/plugin/file_ops_readdir.o
> CC fs/xfs/uuid.o
> CC fs/xfs/xfs_alloc.o
> fs/reiser4/plugin/inode_ops_rename.c: In function 'reiser4_rename_com=
mon':
> fs/reiser4/plugin/inode_ops_rename.c:575:34: warning: argument to
> 'sizeof' in 'memset' call is the same expression as the destination;
> did you mean to dereference it? [-Wsizeof-pointer-memaccess]
> memset(dataonstack, 0, sizeof dataonstack);
> ^
> fs/reiser4/plugin/inode_ops_rename.c:576:35: warning: argument to
> 'sizeof' in 'memset' call is the same expression as the destination;
> did you mean to dereference it? [-Wsizeof-pointer-memaccess]
> memset(dotdot_entry, 0, sizeof dotdot_entry);
> ^
> fs/reiser4/plugin/inode_ops_rename.c:578:34: warning: argument to
> 'sizeof' in 'memset' call is the same expression as the destination;
> did you mean to dereference it? [-Wsizeof-pointer-memaccess]
> memset(dotdot_name, 0, sizeof dotdot_name);
> ^
> CC fs/reiser4/plugin/file_plugin_common.o
> CC fs/reiser4/plugin/file/file.o
> CC fs/xfs/xfs_alloc_btree.o
> CC fs/xfs/xfs_attr.o
> CC fs/reiser4/plugin/file/tail_conversion.o
> CC fs/xfs/xfs_attr_leaf.o
> CC fs/reiser4/plugin/file/file_conversion.o
> CC fs/xfs/xfs_attr_remote.o
> CC fs/reiser4/plugin/file/symlink.o
> CC fs/reiser4/plugin/file/cryptcompress.o
> CC fs/xfs/xfs_bmap.o
> CC fs/reiser4/plugin/dir_plugin_common.o
> CC fs/reiser4/plugin/dir/hashed_dir.o
> CC fs/reiser4/plugin/dir/seekable_dir.o
> LD fs/nfs/nfs.o
> LD fs/nfs/nfsv2.o
> LD fs/nfs/nfsv3.o
> LD fs/nfs/nfsv4.o
> LD fs/nfs/built-in.o
> CC fs/reiser4/plugin/node/node40.o
> CC fs/xfs/xfs_bmap_btree.o
> CC fs/xfs/xfs_btree.o
> CC fs/xfs/xfs_da_btree.o
> CC fs/reiser4/plugin/crypto/cipher.o
> CC fs/reiser4/plugin/crypto/digest.o
> CC fs/reiser4/plugin/compress/compress.o
> CC fs/xfs/xfs_dir2.o
> CC fs/reiser4/plugin/compress/compress_mode.o
> CC fs/reiser4/plugin/item/static_stat.o
> CC fs/xfs/xfs_dir2_block.o
> CC fs/reiser4/plugin/item/sde.o
> CC fs/xfs/xfs_dir2_data.o
> CC fs/reiser4/plugin/item/cde.o
> CC fs/xfs/xfs_dir2_leaf.o
> CC fs/reiser4/plugin/item/blackbox.o
> CC fs/reiser4/plugin/item/internal.o
> CC fs/xfs/xfs_dir2_node.o
> CC fs/reiser4/plugin/item/tail.o
> CC fs/reiser4/plugin/item/ctail.o
> CC fs/reiser4/plugin/item/extent.o
> CC fs/reiser4/plugin/item/extent_item_ops.o
> CC fs/xfs/xfs_dir2_sf.o
> CC fs/reiser4/plugin/item/extent_file_ops.o
> CC fs/xfs/xfs_ialloc.o
> CC fs/reiser4/plugin/item/extent_flush_ops.o
> CC fs/xfs/xfs_ialloc_btree.o
> CC fs/xfs/xfs_icreate_item.o
> CC fs/xfs/xfs_inode.o
> CC fs/reiser4/plugin/hash.o
> CC fs/xfs/xfs_inode_fork.o
> CC fs/xfs/xfs_inode_buf.o
> CC fs/xfs/xfs_log_recover.o
> CC fs/reiser4/plugin/fibration.o
> CC fs/reiser4/plugin/tail_policy.o
> CC fs/xfs/xfs_log_rlimit.o
> CC fs/reiser4/plugin/item/item.o
> CC fs/xfs/xfs_sb.o
> CC fs/reiser4/plugin/security/perm.o
> CC fs/xfs/xfs_symlink_remote.o
> CC fs/xfs/xfs_trans_resv.o
> CC fs/reiser4/plugin/space/bitmap.o
> CC fs/xfs/xfs_log.o
> CC fs/reiser4/plugin/disk_format/disk_format40.o
> CC fs/xfs/xfs_log_cil.o
> CC fs/reiser4/plugin/disk_format/disk_format.o
> CC fs/xfs/xfs_buf_item.o
> CC fs/xfs/xfs_extfree_item.o
> CC fs/xfs/xfs_inode_item.o
> CC fs/xfs/xfs_trans_ail.o
> CC fs/xfs/xfs_trans_buf.o
> CC fs/xfs/xfs_trans_extfree.o
> CC fs/xfs/xfs_trans_inode.o
> LD fs/reiser4/reiser4.o
> CC fs/xfs/xfs_rtalloc.o
> CC fs/xfs/xfs_acl.o
> LD fs/reiser4/built-in.o
> CC fs/xfs/xfs_stats.o
> CC fs/xfs/xfs_sysctl.o
> LD fs/xfs/xfs.o
> LD fs/xfs/built-in.o
> LD fs/built-in.o
> LINK vmlinux
> LD vmlinux.o
> MODPOST vmlinux.o
> GEN .version
> CHK include/generated/compile.h
> UPD include/generated/compile.h
> CC init/version.o
> LD init/built-in.o
> fs/built-in.o: In function `clean_fsdata.isra.13':
> fsdata.c:(.text+0x89359): undefined reference to `d_lockref'
> fsdata.c:(.text+0x8936a): undefined reference to `d_lockref'
> fs/built-in.o: In function `d_cursor_shrink':
> fsdata.c:(.text+0x8961b): undefined reference to `d_lockref'
> fsdata.c:(.text+0x89653): undefined reference to `d_lockref'
> fs/built-in.o: In function `process_cursors':
> fsdata.c:(.text+0x896c3): undefined reference to `d_lockref'
> fs/built-in.o:fsdata.c:(.text+0x89743): more undefined references to
> `d_lockref' follow
> make: *** [vmlinux] Error 1
>
>
> *** For some reason, it always fails (whichever kernel) near somethin=
g
> having to do with XFS, does this have any significance to anybody ??
>
> Best, Chris
>
>
>
> On Thu, Sep 19, 2013 at 9:12 AM, Edward Shishkin
> <edward.shishkin@gmail.com> wrote:
>> So, the tested stuff is on sourceforge as usual.
>>
>> Github repos is only for people who want to help with porting.
>>
>> Thanks,
>> Edward.
>>
>>
>> 19.09.2013 07:45, Mathieu Belanger =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>
>>>
>>> Hi,
>>>
>>> You have three possibility.
>>>
>>> 1 - > Wait until the next week end or so for the official release
>>> 2 - > Search the web to find the version that will be released next=
 week
>>> (I found it, you can find it.)
>>> 3 - > I have made one too without using the other I found on the in=
ternet,
>>> it's less clean but it's available on my git right now if you =20
>>> really want it
>>> now. Note that I don't think anyone else tested it at it's current =
working
>>> state but i'm currently using it emerging stuff on Gentoo without i=
ssue.
>>>
>>> For #3
>>> git clone https://github.com/DestroyFX/reiser4 (wait +-800mb)
>>> cd reiser4
>>> git checkout reiser4-for-3.11
>>> git diff v3.11 reiser4-for-3.11 > /tmp/reiser4-for-3.11.patch
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe reiserfs-=
devel"
>>> in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-de=
vel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
  Did not fix my 3.12 patch. I will do it today from ivan patch.

=46or the undeletable directory bug, i was able to reproduce it with =20
3.10 simply by copying portage on a r4 partition, do ctrl-c during =20
copy and rm -rf it right after.

Christopher Gentile <cnjgentile@gmail.com> a =C3=A9crit=C2=A0:


--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
