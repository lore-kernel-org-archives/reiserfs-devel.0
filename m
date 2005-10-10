From: Steve Jacobson <steve@sourcelabs.com>
Subject: Re: Building Reiser4 - Symbol problem
Date: Mon, 10 Oct 2005 11:32:14 -0700
Message-ID: <434AB3AE.1010201@sourcelabs.com>
References: <4347094A.3090801@sourcelabs.com> <b14e81f00510071736k43d58100ia80bfd0fadbd6ad7@mail.gmail.com> <434AB282.3010408@sourcelabs.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=_mail-1.colo.sourcelabs.com-19866-1128969169-0001-2"
Return-path: <reiserfs-list-return-26459-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <434AB282.3010408@sourcelabs.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Cc: michael chang <thenewme91@gmail.com>, reiserfs-list@namesys.com

--=_mail-1.colo.sourcelabs.com-19866-1128969169-0001-2
Content-Type: multipart/alternative; boundary="=_mail-1.colo.sourcelabs.com-19866-1128969169-0001-3"

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_mail-1.colo.sourcelabs.com-19866-1128969169-0001-3
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit

Re-sending with output file renamed to patch.out.txt - the mailing list
processor didn't like having a .out file attached...

-steve j

Steve Jacobson
Support Manager
SourceLabs, Inc.
steve@sourcelabs.com
(206) 322-0099 x110



Steve Jacobson wrote:

>
> Thanks Mike,
>
> I hadn't captured the patch output originally, so I cleaned up, and
> re-installed the source and re-patched.  The output is attached here
> as patch.out, but a cursory read-through says every patch applied OK.
>
> Other answers to your questions are in-line.
>
> Thanks!
>
> -steve j
>
>Steve Jacobson
>Support Manager
>SourceLabs, Inc.
>steve@sourcelabs.com
>(206) 322-0099 x110
>  
>
>
>
> michael chang wrote:
>
>>On 10/7/05, Steve Jacobson <steve@sourcelabs.com> wrote:
>>  
>>
>>>1) Start with clean install of centOS 4.1 x86_64 version
>>>2) Install kernel sources from centOS distro
>>>3) Patch sources:
>>>   a) in /usr/src/linux-2.6.9-11.EL
>>>   b) run: patch -p0 < reiser4-for-2.6.9-4
>>>NOTE - is this my complete problem right here?   Are the differences
>>>between 2.6.9-11 and 2.6.9-4 significant enough to account for this?
>>>    
>>>
>>
>>In theory, they shouldn't be... but are all the hunks applying
>>correctly?  If any fail, they must be applied by hand, or something
>>breaks.
>>  
>>
> None of the patches appeared to fail.    See the attached patch.out file.
>
>>  
>>
>>>4) make menuconfig - enabling reiser4 as a module
>>>    
>>>
>>
>>What happens when done builtin?  Also, do you have something like 4k
>>stacks built in that weren't supported in the 2.6.9 patch?
>>  
>>
>
> I'm not sure.  The only option I touched in the config that wasn't a
> default was to make sure that the reiser4 module was being built, and
> that it was a module.
>
>>  
>>
>>>5) make
>>>6) make binrpm-pkg
>>>7) Install the resultant RPM
>>>8) run mkinitrd /boot/initrd-2.6.9-11.ELcustom.img 2.6.9011.ELcustom
>>>9) Update grub.conf:
>>>   title CentOS-4 x86_64 Resier (2.6.9-11.ELcustom)
>>>        root (hd0,0)
>>>        kernel /vmlinuz-2.6.9-11.ELcustom ro root=LABEL=/1
>>>        initrd /initrd-2.6.9-11.ELcustom.img
>>>10) reboot, and select the custom kernel
>>>11) Run mkfs.reiser4
>>>    
>>>
>>
>>Where the heck does this come from?  I didn't see you install any resier4 tools.
>>
>>What version of resier4 tools are you using?
>>
>>  
>>
> You're right - I skipped a couple of steps that I went through here. 
> I'm running reiser4progs-1.0.5, and libaal-1.0.5.  I configured and
> built and installed each of these with no errors.  The mkfs.reiser4
> also ran with no errors.
>
>>>12) run modprobe reiser4, or just try to mount the new file system
>>>    
>>>
>>
>>--
>>~Mike
>> - Just my two cents
>> - No man is an island, and no man is unable.
>>  
>>

--=_mail-1.colo.sourcelabs.com-19866-1128969169-0001-3
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html;charset=ISO-8859-1" http-equiv="Content-Type">
</head>
<body bgcolor="#ffffff" text="#000000">
Re-sending with output file renamed to patch.out.txt - the mailing list
processor didn't like having a .out file attached...<br>
<br>
-steve j<br>
<pre class="moz-signature" cols="72">Steve Jacobson
Support Manager
SourceLabs, Inc.
<a class="moz-txt-link-abbreviated" href="mailto:steve@sourcelabs.com">steve@sourcelabs.com</a>
(206) 322-0099 x110
</pre>
<br>
<br>
Steve Jacobson wrote:
<blockquote cite="mid434AB282.3010408@sourcelabs.com" type="cite">
  <meta content="text/html;charset=ISO-8859-1" http-equiv="Content-Type">
  <br>
Thanks Mike,<br>
  <br>
I hadn't captured the patch output originally, so I cleaned up, and
re-installed the source and re-patched.&nbsp; The output is attached here as
patch.out, but a cursory read-through says every patch applied OK.<br>
  <br>
Other answers to your questions are in-line.<br>
  <br>
Thanks!<br>
  <br>
-steve j<br>
  <br>
  <pre class="moz-signature" cols="72">Steve Jacobson
Support Manager
SourceLabs, Inc.
<a class="moz-txt-link-abbreviated" href="mailto:steve@sourcelabs.com">steve@sourcelabs.com</a>
(206) 322-0099 x110
  </pre>
  <br>
  <br>
michael chang wrote:
  <blockquote
 cite="midb14e81f00510071736k43d58100ia80bfd0fadbd6ad7@mail.gmail.com"
 type="cite">
    <pre wrap="">On 10/7/05, Steve Jacobson <a
 class="moz-txt-link-rfc2396E" href="mailto:steve@sourcelabs.com">&lt;steve@sourcelabs.com&gt;</a> wrote:
  </pre>
    <blockquote type="cite">
      <pre wrap="">1) Start with clean install of centOS 4.1 x86_64 version
2) Install kernel sources from centOS distro
3) Patch sources:
   a) in /usr/src/linux-2.6.9-11.EL
   b) run: patch -p0 &lt; reiser4-for-2.6.9-4
NOTE - is this my complete problem right here?   Are the differences
between 2.6.9-11 and 2.6.9-4 significant enough to account for this?
    </pre>
    </blockquote>
    <pre wrap=""><!---->
In theory, they shouldn't be... but are all the hunks applying
correctly?  If any fail, they must be applied by hand, or something
breaks.
  </pre>
  </blockquote>
None of the patches appeared to fail.&nbsp;&nbsp;&nbsp; See the attached patch.out
file.<br>
  <blockquote
 cite="midb14e81f00510071736k43d58100ia80bfd0fadbd6ad7@mail.gmail.com"
 type="cite">
    <pre wrap="">  </pre>
    <blockquote type="cite">
      <pre wrap="">4) make menuconfig - enabling reiser4 as a module
    </pre>
    </blockquote>
    <pre wrap=""><!---->
What happens when done builtin?  Also, do you have something like 4k
stacks built in that weren't supported in the 2.6.9 patch?
  </pre>
  </blockquote>
  <br>
I'm not sure.&nbsp; The only option I touched in the config that wasn't a
default was to make sure that the reiser4 module was being built, and
that it was a module.<br>
  <blockquote
 cite="midb14e81f00510071736k43d58100ia80bfd0fadbd6ad7@mail.gmail.com"
 type="cite">
    <pre wrap="">  </pre>
    <blockquote type="cite">
      <pre wrap="">5) make
6) make binrpm-pkg
7) Install the resultant RPM
8) run mkinitrd /boot/initrd-2.6.9-11.ELcustom.img 2.6.9011.ELcustom
9) Update grub.conf:
   title CentOS-4 x86_64 Resier (2.6.9-11.ELcustom)
        root (hd0,0)
        kernel /vmlinuz-2.6.9-11.ELcustom ro root=LABEL=/1
        initrd /initrd-2.6.9-11.ELcustom.img
10) reboot, and select the custom kernel
11) Run mkfs.reiser4
    </pre>
    </blockquote>
    <pre wrap=""><!---->
Where the heck does this come from?  I didn't see you install any resier4 tools.

What version of resier4 tools are you using?

  </pre>
  </blockquote>
You're right - I skipped a couple of steps that I went through here.&nbsp;
I'm running reiser4progs-1.0.5, and libaal-1.0.5.&nbsp; I configured and
built and installed each of these with no errors.&nbsp; The mkfs.reiser4
also ran with no errors.<br>
  <blockquote
 cite="midb14e81f00510071736k43d58100ia80bfd0fadbd6ad7@mail.gmail.com"
 type="cite">
    <blockquote type="cite">
      <pre wrap="">12) run modprobe reiser4, or just try to mount the new file system
    </pre>
    </blockquote>
    <pre wrap=""><!---->
--
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
  </pre>
  </blockquote>
</blockquote>
</body>
</html>

--=_mail-1.colo.sourcelabs.com-19866-1128969169-0001-3--

--=_mail-1.colo.sourcelabs.com-19866-1128969169-0001-2
Content-Type: text/plain; x-mac-type=0; x-mac-creator=0; name="patch.out.txt"; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch.out.txt"

patching file fs/fs-writeback.c
Hunk #2 succeeded at 379 (offset 1 line).
patching file include/linux/fs.h
Hunk #2 succeeded at 976 (offset 1 line).
Hunk #3 succeeded at 1378 (offset -1 lines).
patching file fs/inode.c
patching file include/linux/mm.h
Hunk #1 succeeded at 716 (offset 10 lines).
patching file mm/truncate.c
Hunk #2 succeeded at 100 (offset 6 lines).
Hunk #4 succeeded at 136 (offset 6 lines).
Hunk #6 succeeded at 207 (offset 6 lines).
patching file mm/filemap.c
Hunk #3 succeeded at 349 (offset -1 lines).
patching file mm/readahead.c
patching file mm/vmscan.c
Hunk #1 succeeded at 477 (offset 10 lines).
Hunk #2 succeeded at 1153 (offset 24 lines).
patching file include/linux/rcupdate.h
patching file kernel/rcupdate.c
patching file mm/swap.c
patching file lib/radix-tree.c
patching file include/linux/radix-tree.h
patching file include/linux/gfp.h
patching file include/linux/init_task.h
patching file include/linux/sched.h
Hunk #1 succeeded at 600 (offset 16 lines).
patching file kernel/fork.c
patching file mm/page_alloc.c
Hunk #1 succeeded at 533 (offset 1 line).
patching file fs/Kconfig
patching file fs/Kconfig.reiser4
patching file fs/Makefile
patching file Documentation/Changes
patching file Documentation/filesystems/reiser4.txt
patching file fs/reiser4/Makefile
patching file fs/reiser4/README
patching file fs/reiser4/as_ops.c
patching file fs/reiser4/block_alloc.c
patching file fs/reiser4/block_alloc.h
patching file fs/reiser4/blocknrset.c
patching file fs/reiser4/carry.c
patching file fs/reiser4/carry.h
patching file fs/reiser4/carry_ops.c
patching file fs/reiser4/carry_ops.h
patching file fs/reiser4/cluster.c
patching file fs/reiser4/cluster.h
patching file fs/reiser4/context.c
patching file fs/reiser4/context.h
patching file fs/reiser4/coord.c
patching file fs/reiser4/coord.h
patching file fs/reiser4/crypt.c
patching file fs/reiser4/debug.c
patching file fs/reiser4/debug.h
patching file fs/reiser4/dformat.h
patching file fs/reiser4/diskmap.c
patching file fs/reiser4/diskmap.h
patching file fs/reiser4/doc/directory-service
patching file fs/reiser4/doc/lock-ordering
patching file fs/reiser4/doc/lock-ordering.dot
patching file fs/reiser4/doc/metadata-in-pagecache
patching file fs/reiser4/doc/oid-locid
patching file fs/reiser4/doc/page-cache-for-formatted-nodes
patching file fs/reiser4/doc/plugin.inheritance
patching file fs/reiser4/doc/readdir-problems-and-implementations
patching file fs/reiser4/doc/reiser4.writeback.overview
patching file fs/reiser4/doc/set-theoretic-stuff.tex
patching file fs/reiser4/doc/sys-reiser4-implemenation-overview
patching file fs/reiser4/dscale.c
patching file fs/reiser4/dscale.h
patching file fs/reiser4/emergency_flush.c
patching file fs/reiser4/emergency_flush.h
patching file fs/reiser4/entd.c
patching file fs/reiser4/entd.h
patching file fs/reiser4/eottl.c
patching file fs/reiser4/estimate.c
patching file fs/reiser4/file_ops.c
patching file fs/reiser4/flush.c
patching file fs/reiser4/flush.h
patching file fs/reiser4/flush_queue.c
patching file fs/reiser4/forward.h
patching file fs/reiser4/init_super.c
patching file fs/reiser4/init_super.h
patching file fs/reiser4/inode.c
patching file fs/reiser4/inode.h
patching file fs/reiser4/inode_ops.c
patching file fs/reiser4/ioctl.h
patching file fs/reiser4/jnode.c
patching file fs/reiser4/jnode.h
patching file fs/reiser4/kassign.c
patching file fs/reiser4/kassign.h
patching file fs/reiser4/kattr.c
patching file fs/reiser4/kattr.h
patching file fs/reiser4/kcond.c
patching file fs/reiser4/kcond.h
patching file fs/reiser4/key.c
patching file fs/reiser4/key.h
patching file fs/reiser4/ktxnmgrd.c
patching file fs/reiser4/ktxnmgrd.h
patching file fs/reiser4/lib.h
patching file fs/reiser4/lnode.c
patching file fs/reiser4/lnode.h
patching file fs/reiser4/lock.c
patching file fs/reiser4/lock.h
patching file fs/reiser4/log.c
patching file fs/reiser4/log.h
patching file fs/reiser4/oid.c
patching file fs/reiser4/page_cache.c
patching file fs/reiser4/page_cache.h
patching file fs/reiser4/plugin/compress/compress.c
patching file fs/reiser4/plugin/compress/compress.h
patching file fs/reiser4/plugin/compress/lzoconf.h
patching file fs/reiser4/plugin/compress/minilzo.c
patching file fs/reiser4/plugin/compress/minilzo.h
patching file fs/reiser4/plugin/cryptcompress.c
patching file fs/reiser4/plugin/cryptcompress.h
patching file fs/reiser4/plugin/digest.c
patching file fs/reiser4/plugin/dir/dir.c
patching file fs/reiser4/plugin/dir/dir.h
patching file fs/reiser4/plugin/dir/hashed_dir.c
patching file fs/reiser4/plugin/dir/hashed_dir.h
patching file fs/reiser4/plugin/dir/pseudo_dir.c
patching file fs/reiser4/plugin/dir/pseudo_dir.h
patching file fs/reiser4/plugin/disk_format/disk_format.c
patching file fs/reiser4/plugin/disk_format/disk_format.h
patching file fs/reiser4/plugin/disk_format/disk_format40.c
patching file fs/reiser4/plugin/disk_format/disk_format40.h
patching file fs/reiser4/plugin/fibration.c
patching file fs/reiser4/plugin/fibration.h
patching file fs/reiser4/plugin/file/file.c
patching file fs/reiser4/plugin/file/file.h
patching file fs/reiser4/plugin/file/funcs.h
patching file fs/reiser4/plugin/file/invert.c
patching file fs/reiser4/plugin/file/pseudo.c
patching file fs/reiser4/plugin/file/pseudo.h
patching file fs/reiser4/plugin/file/symfile.c
patching file fs/reiser4/plugin/file/tail_conversion.c
patching file fs/reiser4/plugin/flush/flush.alg
patching file fs/reiser4/plugin/hash.c
patching file fs/reiser4/plugin/item/acl.h
patching file fs/reiser4/plugin/item/blackbox.c
patching file fs/reiser4/plugin/item/blackbox.h
patching file fs/reiser4/plugin/item/cde.c
patching file fs/reiser4/plugin/item/cde.h
patching file fs/reiser4/plugin/item/ctail.c
patching file fs/reiser4/plugin/item/ctail.h
patching file fs/reiser4/plugin/item/extent.c
patching file fs/reiser4/plugin/item/extent.h
patching file fs/reiser4/plugin/item/extent_file_ops.c
patching file fs/reiser4/plugin/item/extent_flush_ops.c
patching file fs/reiser4/plugin/item/extent_item_ops.c
patching file fs/reiser4/plugin/item/extent_repack_ops.c
patching file fs/reiser4/plugin/item/internal.c
patching file fs/reiser4/plugin/item/internal.h
patching file fs/reiser4/plugin/item/item.c
patching file fs/reiser4/plugin/item/item.h
patching file fs/reiser4/plugin/item/sde.c
patching file fs/reiser4/plugin/item/sde.h
patching file fs/reiser4/plugin/item/static_stat.c
patching file fs/reiser4/plugin/item/static_stat.h
patching file fs/reiser4/plugin/item/tail.c
patching file fs/reiser4/plugin/item/tail.h
patching file fs/reiser4/plugin/node/node.c
patching file fs/reiser4/plugin/node/node.h
patching file fs/reiser4/plugin/node/node40.c
patching file fs/reiser4/plugin/node/node40.h
patching file fs/reiser4/plugin/object.c
patching file fs/reiser4/plugin/object.h
patching file fs/reiser4/plugin/plugin.c
patching file fs/reiser4/plugin/plugin.h
patching file fs/reiser4/plugin/plugin_header.h
patching file fs/reiser4/plugin/plugin_set.c
patching file fs/reiser4/plugin/plugin_set.h
patching file fs/reiser4/plugin/pseudo/pseudo.c
patching file fs/reiser4/plugin/pseudo/pseudo.h
patching file fs/reiser4/plugin/security/perm.c
patching file fs/reiser4/plugin/security/perm.h
patching file fs/reiser4/plugin/space/bitmap.c
patching file fs/reiser4/plugin/space/bitmap.h
patching file fs/reiser4/plugin/space/space_allocator.h
patching file fs/reiser4/plugin/symlink.c
patching file fs/reiser4/plugin/symlink.h
patching file fs/reiser4/plugin/tail_policy.c
patching file fs/reiser4/pool.c
patching file fs/reiser4/pool.h
patching file fs/reiser4/prof.c
patching file fs/reiser4/prof.h
patching file fs/reiser4/readahead.c
patching file fs/reiser4/readahead.h
patching file fs/reiser4/reiser4.h
patching file fs/reiser4/repacker.c
patching file fs/reiser4/repacker.h
patching file fs/reiser4/safe_link.c
patching file fs/reiser4/safe_link.h
patching file fs/reiser4/seal.c
patching file fs/reiser4/seal.h
patching file fs/reiser4/search.c
patching file fs/reiser4/spin_macros.h
patching file fs/reiser4/spinprof.c
patching file fs/reiser4/spinprof.h
patching file fs/reiser4/statcnt.h
patching file fs/reiser4/stats.c
patching file fs/reiser4/stats.h
patching file fs/reiser4/status_flags.c
patching file fs/reiser4/status_flags.h
patching file fs/reiser4/super.c
patching file fs/reiser4/super.h
patching file fs/reiser4/tap.c
patching file fs/reiser4/tap.h
patching file fs/reiser4/tree.c
patching file fs/reiser4/tree.h
patching file fs/reiser4/tree_mod.c
patching file fs/reiser4/tree_mod.h
patching file fs/reiser4/tree_walk.c
patching file fs/reiser4/tree_walk.h
patching file fs/reiser4/txnmgr.c
patching file fs/reiser4/txnmgr.h
patching file fs/reiser4/type_safe_hash.h
patching file fs/reiser4/type_safe_list.h
patching file fs/reiser4/vfs_ops.c
patching file fs/reiser4/vfs_ops.h
patching file fs/reiser4/wander.c
patching file fs/reiser4/wander.h
patching file fs/reiser4/writeout.h
patching file fs/reiser4/znode.c
patching file fs/reiser4/znode.h
patching file fs/reiserfs/inode.c

--=_mail-1.colo.sourcelabs.com-19866-1128969169-0001-2--
