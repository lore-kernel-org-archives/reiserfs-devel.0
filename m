From: K.Morikawa <k-morikawa@stage.gr.jp>
Subject: kernel panic with PAP-8252
Date: Tue, 30 Jul 2002 15:11:33 +0900
Message-ID: <20020730151018.2D2C.K-MORIKAWA@stage.gr.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11095-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

TurboLinux 6.5 Server (kernel-2.2.18 , reiserfs-3.5.29)

At July 13
I encountered kernel panic problem with PAP-8252, and our machine is HANG-UP.
PAP-8252 appear on console. but not logged to messages.
This problem was occurred during data backup job on reiserfs.
There are reiserfs filesystems on hardware RAID5 disks.(160GB x4DISKs)
I rebooted machine, then restart data backup job. but kernel panic re-occurred.
tried to delete the directories by "rm -rf", however can't delete with error.
I could delete the directories after deleting the files first.

After that the machine was operating without any problem.
I'm watching...


At July 27
kernel panic happened with same error.
I tried reiserfsck with --check option. however completed with no error.
so I did not run reiserfsck with --rebuild-tree option.
machine is operating after reboot.

This problem is very concern.
Please investigate and advice me.


/var/log/messages as follows... 
----------------------------------------------------------------------------------------------------
Jul 15 15:27:15 backup syslogd 1.4-0: restart.
Jul 15 15:27:15 backup kernel: klogd 1.4-0, log source = /proc/kmsg started.
Jul 15 15:27:15 backup kernel: Inspecting /boot/System.map-2.2.18-2
Jul 15 15:27:15 backup kernel: Loaded 8711 symbols from /boot/System.map-2.2.18-2.
Jul 15 15:27:15 backup kernel: Symbols match kernel version 2.2.18.
Jul 15 15:27:15 backup kernel: Loaded 32 symbols from 2 modules.
Jul 15 15:27:15 backup kernel: 15 is less than newest_mount_id 16
Jul 15 15:27:15 backup kernel: clm-2018: transaction is valid returning because mount_id 15 is less
than newest_mount_id 16
Jul 15 15:27:16 backup last message repeated 16 times
Jul 15 15:27:16 backup kernel: clm-2035: Starting replay from offset 4659, trans_id 8320
Jul 15 15:27:16 backup kernel: clm-2021: journal_read_transaction, offset 4659, len 9 mount_id 16
Jul 15 15:27:16 backup kernel: clm-2029: setting journal start to offset 4670
Jul 15 15:27:16 backup kernel: clm-2021: journal_read_transaction, offset 4670, len 4294967295 mount
_id 4294967295
Jul 15 15:27:16 backup kernel: clm-2023: journal_read_trans skipping because 4294967295 is != newest
_mount_id 16
Jul 15 15:27:16 backup kernel: clm-2038: Replayed 1 transactions in 3 seconds, mount_id now 17
Jul 15 15:27:16 backup kernel: Using r5 hash to sort names
Jul 15 15:27:16 backup kernel: ReiserFS version 3.5.29
Jul 15 15:27:16 backup kernel: clm-2030: reading through journal entries
Jul 15 15:27:16 backup kernel: clm-2031: found in header: first_unflushed_offset 1943, last_flushed_
trans_id 9208
Jul 15 15:27:16 backup kernel: clm-2020: found valid transaction start offset 1943, len 23 id 9209
Jul 15 15:27:16 backup kernel: clm-2020: found valid transaction start offset 35, len 57 id 9174
Jul 15 15:27:16 backup kernel: clm-2032: Setting oldest_start to offset 35, trans_id 9174
Jul 15 15:27:16 backup kernel: clm-2020: found valid transaction start offset 94, len 67 id 9175
Jul 15 15:27:16 backup kernel: clm-2020: found valid transaction start offset 163, len 33 id 9176
Jul 15 15:27:16 backup kernel: clm-2020: found valid transaction start offset 198, len 65 id 9177
Jul 15 15:27:16 backup kernel: clm-2020: found valid transaction start offset 265, len 65 id 9178
Jul 15 15:27:16 backup kernel: clm-2020: found valid transaction start offset 332, len 40 id 9179
Jul 15 15:27:16 backup kernel: clm-2020: found valid transaction start offset 374, len 30 id 9180
Jul 15 15:27:16 backup kernel: clm-2020: found valid transaction start offset 406, len 65 id 9181
Jul 15 15:27:16 backup kernel: clm-2020: found valid transaction start offset 473, len 55 id 9182
----------------------------------------------------------------------------------------------------
Jul 29 14:05:47 backup syslogd 1.4-0: restart.
Jul 29 14:05:47 backup kernel: klogd 1.4-0, log source = /proc/kmsg started.
Jul 29 14:05:48 backup kernel: Inspecting /boot/System.map-2.2.18-2
Jul 29 14:05:48 backup kernel: Loaded 8711 symbols from /boot/System.map-2.2.18-2.
Jul 29 14:05:48 backup kernel: Symbols match kernel version 2.2.18.
Jul 29 14:05:48 backup kernel: Loaded 32 symbols from 2 modules.
Jul 29 14:05:48 backup kernel: rning because mount_id 18 is less than newest_mount_id 20
Jul 29 14:05:48 backup kernel: clm-2018: transaction is valid returning because mount_id 18 is less
than newest_mount_id 20
Jul 29 14:05:48 backup last message repeated 32 times
Jul 29 14:05:48 backup kernel: clm-2035: Starting replay from offset 2061, trans_id 8598
Jul 29 14:05:48 backup kernel: clm-2021: journal_read_transaction, offset 2061, len 8 mount_id 20
Jul 29 14:05:48 backup kernel: clm-2029: setting journal start to offset 2071
Jul 29 14:05:48 backup kernel: clm-2021: journal_read_transaction, offset 2071, len 65536 mount_id 1
340
Jul 29 14:05:48 backup kernel: clm-2023: journal_read_trans skipping because 1340 is != newest_mount
_id 20
Jul 29 14:05:48 backup kernel: clm-2038: Replayed 1 transactions in 3 seconds, mount_id now 21
Jul 29 14:05:48 backup kernel: Using r5 hash to sort names
Jul 29 14:05:48 backup kernel: ReiserFS version 3.5.29
Jul 29 14:05:48 backup kernel: clm-2030: reading through journal entries
Jul 29 14:05:48 backup kernel: clm-2031: found in header: first_unflushed_offset 1996, last_flushed_
trans_id 9844
Jul 29 14:05:48 backup kernel: clm-2020: found valid transaction start offset 1996, len 65 id 9845
Jul 29 14:05:48 backup kernel: clm-2020: found valid transaction start offset 30, len 27 id 9808
Jul 29 14:05:48 backup kernel: clm-2032: Setting oldest_start to offset 30, trans_id 9808
Jul 29 14:05:49 backup kernel: clm-2020: found valid transaction start offset 59, len 66 id 9809
Jul 29 14:05:49 backup kernel: clm-2020: found valid transaction start offset 127, len 61 id 9810
Jul 29 14:05:49 backup kernel: clm-2020: found valid transaction start offset 190, len 63 id 9811
Jul 29 14:05:49 backup kernel: clm-2020: found valid transaction start offset 255, len 61 id 9812
Jul 29 14:05:49 backup kernel: clm-2020: found valid transaction start offset 318, len 28 id 9813
Jul 29 14:05:49 backup kernel: clm-2020: found valid transaction start offset 348, len 61 id 9814
Jul 29 14:05:49 backup kernel: clm-2020: found valid transaction start offset 411, len 51 id 9815
Jul 29 14:05:49 backup kernel: clm-2020: found valid transaction start offset 464, len 67 id 9816
----------------------------------------------------------------------------------------------------


Kohji Morikawa <k-morikawa@stage.gr.jp>
----------------------------------------------------------------------->

