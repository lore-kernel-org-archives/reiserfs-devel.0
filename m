From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Reiserfs3 is crashing - where/whom to report?
Date: Mon, 19 Jan 2009 23:49:42 -0500
Message-ID: <497557E6.80005@suse.com>
References: <49750FC1.23700.2C929@JaFojtik.seznam.cz> <497518E3.4080205@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <497518E3.4080205@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: Jaroslav Fojtik <JaFojtik@seznam.cz>, Reiserfs mailing list <reiserfs-devel@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Edward Shishkin wrote:
> Hello Jaroslav,
> would you please check your partition with fsck,
> and, please, upgrade the kernel, if possible.
> 
> Jeff, it seems to be BUG_ONs in the old on-demand
> bitmap loading code?

Yeah, I'd prefer to see this repeated with a recent kernel before I dig in.

- -Jeff

> Edward.
> 
> Jaroslav Fojtik wrote:
>> Dears,
>>
>> please help me how to avoid this bug. It occurs on kernel 2.6.21.5
>> on HDD with size 640GB and sector size 1kB.
>>
>> When sector size is set to 512B the drive cannot be mounted and a driver writes
>> invalid float exception.
>>
>> 2kB block size seems to work OK - but a bug is still present here until gets fixed.
>>
>>
>> Jan 18 20:32:30 F&T kernel: ------------[ cut here ]------------
>> Jan 18 20:32:30 F&T kernel: Kernel BUG at b01b35e3 [verbose debug info unavailable]
>> Jan 18 20:32:30 F&T kernel: invalid opcode: 0000 [#1]
>> Jan 18 20:32:30 F&T kernel: SMP
>> Jan 18 20:32:30 F&T kernel: Modules linked in: ntfs sis900 ipv6 it87 hwmon_vid i2c_isa 
>> i2c_core tulip bitrev atl1 crc32 mii agpgart lp parport_pc parport
>> Jan 18 20:32:30 F&T kernel: CPU:    1
>> Jan 18 20:32:30 F&T kernel: EIP:    0060:[<b01b35e3>]    Not tainted VLI
>> Jan 18 20:32:30 F&T kernel: EFLAGS: 00010246   (2.6.21.5 #11)
>> Jan 18 20:32:30 F&T kernel: EIP is at reiserfs_read_bitmap_block+0x153/0x160
>> Jan 18 20:32:30 F&T kernel: eax: 00000000   ebx: f0864858   ecx: babda000   edx: babd9ffc
>> Jan 18 20:32:30 F&T kernel: esi: 00000000   edi: ba59e13c   ebp: 00002a16   esp: e7f23bf4
>> Jan 18 20:32:30 F&T kernel: ds: 007b   es: 007b   fs: 00d8  gs: 0033  ss: 0068
>> Jan 18 20:32:30 F&T kernel: Process mc (pid: 1530, ti=e7f22000 task=e8185030 
>> task.ti=e7f22000)
>> Jan 18 20:32:30 F&T kernel: Stack: bc4c0818 00000000 b1157b20 00000001 f085a000 00000060 
>> 00002a16 e7f23cf4
>> Jan 18 20:32:30 F&T kernel:        00001ffc b01b3aa1 00000000 0000000f 00000003 00002a16 
>> e7f23ecc eef22000
>> Jan 18 20:32:30 F&T kernel:        f0864858 00000000 013d8000 00000001 00002a16 00000015 
>> 00001ffc b01b44b8
>> Jan 18 20:32:30 F&T kernel: Call Trace:
>> Jan 18 20:32:30 F&T kernel:  [<b01b3aa1>] scan_bitmap_block+0x51/0x2d0
>> Jan 18 20:32:30 F&T kernel:  [<b01b44b8>] reiserfs_allocate_blocknrs+0x798/0x12a0
>> Jan 18 20:32:30 F&T kernel:  [<b01c24be>] reiserfs_file_write+0x99e/0x1e40
>> Jan 18 20:32:30 F&T kernel:  [<b013c5da>] clocksource_get_next+0x3a/0x40
>> Jan 18 20:32:30 F&T kernel:  [<b014f047>] do_generic_mapping_read+0x687/0x8c0
>> Jan 18 20:32:30 F&T kernel:  [<b0136a30>] autoremove_wake_function+0x0/0x40
>> Jan 18 20:32:30 F&T kernel:  [<b0297dba>] tty_write+0x22a/0x2e0
>> Jan 18 20:32:30 F&T kernel:  [<b01a5d6d>] dnotify_parent+0x3d/0x120
>> Jan 18 20:32:30 F&T kernel:  [<b01c1b20>] reiserfs_file_write+0x0/0x1e40
>> Jan 18 20:32:30 F&T kernel:  [<b0170480>] vfs_write+0xf0/0x1c0
>> Jan 18 20:32:30 F&T kernel:  [<b0170611>] sys_write+0x41/0x70
>> Jan 18 20:32:30 F&T kernel:  [<b0102e34>] syscall_call+0x7/0xb
>> Jan 18 20:32:30 F&T kernel:  =======================
>> Jan 18 20:32:30 F&T kernel: Code: c7 44 24 08 a0 e0 3e b0 c7 44 24 04 cc 51 43 b0 e8 63 
>> 81 01 00 eb 8e 0f 0b eb fe 8b 02 8b 40 0c 83 c0 01 8d 1c 28 e9 e7 fe ff ff <0f> 0b eb fe 
>> 0f 0b eb fe 90 8d 74 26 00 55 89 cd 57 56 53 83 ec
>> Jan 18 20:32:30 F&T kernel: EIP: [<b01b35e3>] reiserfs_read_bitmap_block+0x153/0x160 
>> SS:ESP 0068:e7f23bf4
>> Jan 18 20:32:30 F&T kernel: BUG: at kernel/exit.c:861 do_exit()
>> Jan 18 20:32:30 F&T kernel:  [<b01226c7>] do_exit+0x667/0x850
>> Jan 18 20:32:30 F&T kernel:  [<b01048c7>] die+0x237/0x240
>> Jan 18 20:32:30 F&T kernel:  [<b0104ed0>] do_invalid_op+0x0/0xb0
>> Jan 18 20:32:30 F&T kernel:  [<b0104f72>] do_invalid_op+0xa2/0xb0
>> Jan 18 20:32:30 F&T kernel:  [<b01b35e3>] reiserfs_read_bitmap_block+0x153/0x160
>> Jan 18 20:32:30 F&T kernel:  [<b01951a2>] __find_get_block_slow+0x82/0x100
>> Jan 18 20:32:30 F&T kernel:  [<b03e5502>] io_schedule+0x22/0x30
>> Jan 18 20:32:30 F&T kernel:  [<b0195385>] sync_buffer+0x35/0x40
>> Jan 18 20:32:30 F&T kernel:  [<b03e5cd8>] __wait_on_bit+0x88/0xe0
>> Jan 18 20:32:30 F&T kernel:  [<b0195350>] sync_buffer+0x0/0x40
>> Jan 18 20:32:30 F&T kernel:  [<b0195350>] sync_buffer+0x0/0x40
>> Jan 18 20:32:30 F&T kernel:  [<b03e5dd8>] out_of_line_wait_on_bit+0xa8/0xc0
>> Jan 18 20:32:30 F&T kernel:  [<b03e706c>] error_code+0x7c/0x84
>> Jan 18 20:32:30 F&T kernel:  [<b01b35e3>] reiserfs_read_bitmap_block+0x153/0x160
>> Jan 18 20:32:30 F&T kernel:  [<b01b3aa1>] scan_bitmap_block+0x51/0x2d0
>> Jan 18 20:32:30 F&T kernel:  [<b01b44b8>] reiserfs_allocate_blocknrs+0x798/0x12a0
>> Jan 18 20:32:30 F&T kernel:  [<b01c24be>] reiserfs_file_write+0x99e/0x1e40
>> Jan 18 20:32:30 F&T kernel:  [<b013c5da>] clocksource_get_next+0x3a/0x40
>> Jan 18 20:32:30 F&T kernel:  [<b014f047>] do_generic_mapping_read+0x687/0x8c0
>> Jan 18 20:32:30 F&T kernel:  [<b0136a30>] autoremove_wake_function+0x0/0x40
>> Jan 18 20:32:30 F&T kernel:  [<b0297dba>] tty_write+0x22a/0x2e0
>> Jan 18 20:32:30 F&T kernel:  [<b01a5d6d>] dnotify_parent+0x3d/0x120
>> Jan 18 20:32:30 F&T kernel:  [<b01c1b20>] reiserfs_file_write+0x0/0x1e40
>> Jan 18 20:32:30 F&T kernel:  [<b0170480>] vfs_write+0xf0/0x1c0
>> Jan 18 20:32:30 F&T kernel:  [<b0170611>] sys_write+0x41/0x70
>> Jan 18 20:32:30 F&T kernel:  [<b0102e34>] syscall_call+0x7/0xb
>> Jan 18 20:32:30 F&T kernel:  =======================
>> Jan 18 20:39:52 F&T kernel: sanitize start
>> Jan 18 20:39:52 F&T kernel: sanitize end
>>
>>
>>   
> 


- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iEYEARECAAYFAkl1V+YACgkQLPWxlyuTD7JcVgCeNhmvS/PGcNWDXU9yBOmVRAo4
pzEAn199vrJ+DFse5E2j1xpIl07SDxsM
=au8o
-----END PGP SIGNATURE-----
