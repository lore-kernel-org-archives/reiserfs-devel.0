From: Manuel Krause <manuels-adresse@t-online.de>
Subject: Re: Are there ways to enable Cleancache Support for ReiserFS 3.6?
Date: Wed, 14 Dec 2011 00:31:42 +0100
Message-ID: <4EE7E05E.2070504@t-online.de>
References: <4ECD78A7.3000103@t-online.de> <4EE2B296.9020004@t-online.de> <4EE2C8FF.3030403@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4EE2C8FF.3030403@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jeff Mahoney <jeffm@suse.com>
Cc: reiserfs-devel@vger.kernel.org

Many thanks for your reply, Jeff!

On 2011-12-10 03:50, Jeff Mahoney wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 12/09/2011 08:15 PM, Manuel Krause wrote:
>> Not anyone anywhere being able to reply to this question?!
>
> I'm afraid not. AFAIK the file system needs knowledge of cleancache in
> order to use it. ReiserFS 3.6 has been in maintenance-only mode for
> years now so nobody's written anything up to use it.
>
> It may well be all you need to do include<linux/cleancache.h>  in
> fs/reiserfs/super.c and add a cleancache_init_fs(s) call to
> reiserfs_fill_super().
>

You mean something like the following? I've had prepared 
something for an earlier kernel, just looking at the 
implementation for other filesystems, but as I'm no programmer, 
this may have gone wrong. Please, check it yourself. It also 
applied to/ compiled with the openSUSE(11.4) kernel-source 3.1.4 
I'm currently using. My other applied patches are the current CK 
(modified for SUSE) and BFQ (pure) versions.


--- linux-2.6.39-rc3/fs/reiserfs/super.c	2011-04-11 
18:21:51.000000000 -0600
+++ linux-2.6.39-rc3-cleancache/fs/reiserfs/super.c	2011-04-13 
17:10:52.708850707 -0600
@@ -38,6 +38,7 @@
  #include <linux/slab.h>
  #include <linux/vmalloc.h>
  #include <linux/time.h>
+#include <linux/cleancache.h>
  #include <asm/uaccess.h>
  #include <linux/reiserfs_fs.h>
  #include <linux/reiserfs_acl.h>
@@ -1902,6 +1904,8 @@ static int reiserfs_fill_super(struct su

  	reiserfs_write_unlock(s);

+	cleancache_init_fs(s);
+
  	return (0);

  error:


After activating zcache=enable @ kernel command line it did work 
somehow:
 From my /var/log/boot.msg:
<5>REISERFS (device sda7): found reiserfs format "3.6" with 
standard journal
<5>REISERFS (device sda7): using ordered data mode
<4>reiserfs: using flush barriers
<5>REISERFS (device sda7): journal params: device sda7, size 
8192, journal first block 18, max trans len 1024, max batch 900, 
max commit age 30, max trans age 30
<5>REISERFS (device sda7): checking transaction log (sda7)
<5>REISERFS (device sda7): Using r5 hash to sort names
<6>zcache: created ephemeral tmem pool, id=0, client=65535


And a bit later it really throw out many warnings (also from my 
/var/log/boot.msg) that don't seem to have anything to do with 
reiserfs itself:

<6>zcache: created persistent tmem pool, id=1, client=65535
<6>Adding 4192928k swap on /dev/sdb8.  Priority:-1 extents:1 
across:4192928k FS
<4>------------[ cut here ]------------
<4>WARNING: at drivers/staging/zcache/zcache-main.c:203 
zbud_data+0x5d/0xc0()
<4>Hardware name: System Name
<4>Modules linked in: ppdev sr_mod sg cdrom snd_cmipci gameport 
tulip parport_pc via686a snd_pcm snd_page_alloc snd_opl3_lib 
snd_timer snd_hwdep snd_mpu401_uart snd_rawmidi snd_seq_device 
snd soundcore i2c_viapro parport button radeon ttm drm_kms_helper 
drm uhci_hcd i2c_algo_bit usbcore via_agp agpgart ext2 mbcache 
reiserfs sd_mod crc_t10dif fan processor thermal ata_generic 
pata_via libata scsi_mod
<4>Pid: 309, comm: startpar Not tainted 3.1.4-ck2-i686-mk #1
<4>Call Trace:
<4> [<c1029498>] ? warn_slowpath_common+0x78/0xb0
<4> [<c11ec21d>] ? zbud_data+0x5d/0xc0
<4> [<c11ec21d>] ? zbud_data+0x5d/0xc0
<4> [<c10294e9>] ? warn_slowpath_null+0x19/0x20
<4> [<c11ec21d>] ? zbud_data+0x5d/0xc0
<4> [<c11ec9f7>] ? zcache_pampd_create+0x367/0x760
<4> [<c11edf9b>] ? tmem_put+0xdb/0x420
<4> [<c11ecf63>] ? zcache_put_page.clone.1+0x173/0x260
<4> [<c11ed083>] ? zcache_cleancache_put_page+0x33/0x40
<4> [<c10a7b7c>] ? __cleancache_put_page+0x8c/0xb0
<4> [<c107789d>] ? __delete_from_page_cache+0x12d/0x150
<4> [<c108278c>] ? __remove_mapping+0x6c/0x130
<4> [<c1082a68>] ? remove_mapping+0x8/0x30
<4> [<c1082070>] ? invalidate_mapping_pages+0xb0/0x120
<4> [<c1077ae7>] ? __filemap_fdatawrite_range+0x87/0x90
<4> [<c107ab52>] ? sys_fadvise64_64+0x192/0x270
<4> [<c10a96fc>] ? sys_open+0x2c/0x40
<4> [<c128ac30>] ? sysenter_do_call+0x12/0x26
<4>---[ end trace 6b33ed8df7e36797 ]---
<4>------------[ cut here ]------------
<4>WARNING: at drivers/staging/zcache/zcache-main.c:369 
zcache_pampd_create+0x129/0x760()
<4>Hardware name: System Name
<4>Modules linked in: ppdev sr_mod sg cdrom snd_cmipci gameport 
tulip parport_pc via686a snd_pcm snd_page_alloc snd_opl3_lib 
snd_timer snd_hwdep snd_mpu401_uart snd_rawmidi snd_seq_device 
snd soundcore i2c_viapro parport button radeon ttm drm_kms_helper 
drm uhci_hcd i2c_algo_bit usbcore via_agp agpgart ext2 mbcache 
reiserfs sd_mod crc_t10dif fan processor thermal ata_generic 
pata_via libata scsi_mod
<4>Pid: 309, comm: startpar Tainted: G        W 
3.1.4-ck2-i686-mk #1
<4>Call Trace:
<4> [<c1029498>] ? warn_slowpath_common+0x78/0xb0
<4> [<c11ec7b9>] ? zcache_pampd_create+0x129/0x760
<4> [<c11ec7b9>] ? zcache_pampd_create+0x129/0x760
<4> [<c10294e9>] ? warn_slowpath_null+0x19/0x20
<4> [<c11ec7b9>] ? zcache_pampd_create+0x129/0x760
<4> [<c11edf9b>] ? tmem_put+0xdb/0x420
<4> [<c11ecf63>] ? zcache_put_page.clone.1+0x173/0x260
<4> [<c11ed083>] ? zcache_cleancache_put_page+0x33/0x40
<4> [<c10a7b7c>] ? __cleancache_put_page+0x8c/0xb0
<4> [<c107789d>] ? __delete_from_page_cache+0x12d/0x150
<4> [<c108278c>] ? __remove_mapping+0x6c/0x130
<4> [<c1082a68>] ? remove_mapping+0x8/0x30
<4> [<c1082070>] ? invalidate_mapping_pages+0xb0/0x120
<4> [<c1077ae7>] ? __filemap_fdatawrite_range+0x87/0x90
<4> [<c107ab52>] ? sys_fadvise64_64+0x192/0x270
<4> [<c10a96fc>] ? sys_open+0x2c/0x40
<4> [<c128ac30>] ? sysenter_do_call+0x12/0x26
<4>---[ end trace 6b33ed8df7e36798 ]---

These two repeated several times.

I then stopped this experiment by rebooting without zcache=enable 
as I didn't want to loose any data or flood my disk with warnings 
I don't understand.
Maybe someone knows what's going wrong and/or can forward this 
report to someone who's working on it.

Best regards,

Manuel


> That's about all the help I'm able to give, though.
>
> - -Jeff
>
>> On 2011-11-23 23:50, Manuel Krause wrote:
>>> Hi,
>>>
>>> there's Cleancache supported in kernel. And Frontswap would be
>>> soon.
>>>
>>> Is there a way to enable Cleancache for old ReiserFS 3.6
>>> filesystems?
>>>
>>> Or a quick but clean hack?
>>>
>>> Thanks for your reply,
>>>
> - --
> Jeff Mahoney
> SUSE Labs
