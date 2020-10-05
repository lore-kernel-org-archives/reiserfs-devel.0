From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Problems mounting a reiserfs partiton on the 5.8 kernel
Date: Tue, 6 Oct 2020 01:56:26 +0200
Message-ID: <923f0e85-68e9-4997-dcea-4d1970953e07@gmail.com>
References: <20201006.002952.1265255213313398815.enometh@meer.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=1NxIQXJO0tTFu4Ykqp1w7Ajewk7sip+ivf3BQ8Otoq8=;
        b=BgrlcUJNDFT4m9WxhNQNkQL1b2doqUPRq+XiUDZIe54cO264PLmVE6+cIH3S1eVVZe
         6LUHiEOGG6OsWd0c1mwV+auCfCqrtwzvIpqttxOF42D9PHAbcUaKTQS9M8tgSWB3dWVs
         UOU3V8LS7KFI7PjJJR6Fklrxcgun13/9DVYpvk25Zt+qZ4N+t9nkKQ6U9lOrlpexOd2t
         BbidLJNfa3JQCptizuL7apTywnTANjiHXK4yVDwD/dMhc3iTvcOBtrsdKmwkY+aUz7Vu
         dSCtRZBxosj1DdI4mK1M0Yji/+kw+qeGUkgZ6iMukCDSavj0QpgImw7DHfLwIMNwR++S
         1gnQ==
In-Reply-To: <20201006.002952.1265255213313398815.enometh@meer.net>
Content-Language: en-US
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Madhu <enometh@meer.net>, reiserfs-devel@vger.kernel.org

On 10/05/2020 08:59 PM, Madhu wrote:
> Hello.
> 
> I'm using sys-fs/reiserfsprogs-3.6.27.  The 5.8 kernel refuses to
> mount a reiser partition:
> 
> $ /bin/mount /dev/mapper/5 /5
> 
> [  203.691395] REISERFS (device dm-1): found reiserfs format "3.6" with standard journal
> [  203.691429] REISERFS (device dm-1): using ordered data mode
> [  203.691431] reiserfs: using flush barriers
> [  203.719044] REISERFS (device dm-1): journal params: device dm-1, size 8192, journal first block 18, max trans len 1024, max batch 900, max commit age 30, max trans age 30
> [  203.719364] REISERFS (device dm-1): checking transaction log (dm-1)
> [  203.732153] loop: Write error at byte offset 5402468352, length 4096.
> [  203.732167] blk_update_request: I/O error, dev loop5, sector 65936 op 0x1:(WRITE) flags 0x800 phys_seg 1 prio class 0
> [  203.732172] blk_update_request: I/O error, dev loop5, sector 65936 op 0x1:(WRITE) flags 0x800 phys_seg 1 prio class 0
> [  203.732190] Buffer I/O error on dev dm-1, logical block 8210, lost sync page write
> [  203.732213] REISERFS warning (device dm-1): journal-837 _update_journal_header_block: IO error during journal replay
> [  203.732219] REISERFS warning (device dm-1): reiserfs-2006 journal_init: Replay Failure, unable to mount
> [  203.732474] REISERFS warning (device dm-1): sh-2022 reiserfs_fill_super: unable to initialize journal space
> 
> This is the 5.8.12 kernel.
> 
> The file system is on a dmcrypt device
> $ dmsetup  status 5
> 0 167192565 crypt
> 
> which is mapped from a loopback device, which is mapped from an offset
> from a raw partition.
> 
> $ losetup -a /dev/loop5
> /dev/loop5: [0005]:6284 (/dev/sda5), offset 5368709120
> 
> $ fdisk | grep sda[45]
>     Device Boot      Start         End      Blocks   Id  System
> /dev/sda4       187655265   625137344   218741040    5  Extended
> /dev/sda5       187655328   365334164    88839418+  83  Linux
> 
> The reiser partition is over a decade old and has been very
> reliable. Running fsck finds no problems.  And the partition mounts
> fine and is usable with the 5.7 kernel.
> 
> Any ideas what the problem might be?  The dmesg output looks bogus and
> suggests to me that a write is failing somewhere.  I suspect it is the
> device layer which has changed.  If there is a bug to be filed where
> should I file it? I'd Appreciate any clues.

The problem goes from the block layer.
File a bug at https://bugzilla.kernel.org/
and provide all that description there.

Edward.
