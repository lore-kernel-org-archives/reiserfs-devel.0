From: Sean Plaice <splaice@gmail.com>
Subject: reiserfs errors and kernel panic, are they related?
Date: Thu, 26 Aug 2004 15:23:54 -0700
Message-ID: <ae9bd76a04082615237cd779f3@mail.gmail.com>
Reply-To: Sean Plaice <splaice@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20828-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello,
In the last couple of days one of my production servers started
rebooting due to a kernel panic. I believe this could be related to
something in the reiserfs file system that is causing the  kernel to
panic. The panic also causes data corruption on some system files that
are heavily accessed when the panic occurs.

 I will detail the scenario as best I can below. I was able to find
and replicate what is causing the panic, but due to the server being
in production I have refrained from extensive testing until I can
schedule an outage window. I also have refrained from trying to repair
the file system errors to avoid make an un-informed attempt that could
cause more harm then good.

System Details:
Dell Poweredge 2650 - Dual Intel Xeon 2.8Ghz
PERC3di SCSI-RAID Controller using the aacraid driver on RAID-10 raid set.
Red Hat/Adaptec aacraid driver (1.1-3 Aug  4 2004 12:11:35)

Fedora Core 1
Kernel:  2.4.22-1.2199.nptlsmp

Tracking down any error messages has been difficult the systems syslog
appears to fail to record the kernel error messages. Though I was able
to find some error message from the log of a scheduled job that runs
on the server that repeatably triggers the kernel panic. I was also
able to too a screen shot of part of the kernel panic message using
remote access console (no serial console as of yet).

Kernel Panic Message:
EIP:	0060:[<c011cbea>]	Not tainted
EFLAGS: 00010206

EIP is at do_page_fault [kernel] 0x26a (2.4.22-1.2199.nptlsmp)
eax: 00000013	ebx: 73747000	ecx: c0374888	edx: 00006912
esi: f7facca4	edi: f7ffa000	ebp: 0000000f	esp: f7ffbe18
ds: 0068   es: 0068   ss: 0068
Process init (pid: 1, stackpage=f7ffb000)
Stack: c02a68af 73747069 00000000 f7ffbee8 00000000 f88630bf 00000001 1680f54c
       00000003 00000017 001b657a 00000000 00000206 c0376730 00030001 00000000
       c037667c 00000286 00000001 f1dca8c0 00000000 00000000 00000003 f1dca8c0
Call Trace: [<f88630bf>] check_journal_end [reiserfs] 0x16f (0xf7ffbe2c)
[<c011f4bc>] schedule [kernel] 0x3fc (0xf7ffbe90)
[<c011c980>] do_page_fault [kernel] 0x0 (0xf7ffbed0)
[<c0109c18>] error_code [kernel] 0x34 (0xf7ffbed8)
[<c0163f23>] poll_freewait [kernel] 0x23 (0xf7ffbf0c)
[<c0164251>] do_select [kernel] 0x151 (0xf7ffbf24)
[<c01646ce>] sys_select [kernel] 0x34e (0xf7ffbf60)
[<c015a279>] sys_fstat64 [kernel] 0x49 (0xf7ffbfa8)
[<c0109b27>] system_call [kernel] 0x33 (0xf7ffbfc0)


Code: 8b 9c ab 00 00 00 c0 c7 04 24 c0 68 2a c0 89 5c 24 04 e8 ef
 <0>Kernel panic: Attempted to kill init!

I am able to reproduce the kernel panic by running the prelinking, and
slocate daily cron jobs. Within the the log for the prelinking job it
appears that some syslog messages, regarding reiserfs errors. It
appears that this information was concatenated with the prelinking log
due to corruption since the end of the file is filled with garbage
binary data.

Here are the errors listed in the prelinking log. 
/usr/lib/libtiff.so.3.5                                      0040Aug 23 21:02:09
 mail01 syslogd 1.4.1: restart.
Aug 23 21:02:10 mail01 kernel: sd(8,6):vs-13060: reiserfs_update_sd: stat data o
f object [1148 1150 0x0 SD] (nlink == 1) not found (pos 25)
Aug 23 21:02:15 mail01 last message repeated 12 times
Aug 23 21:02:16 mail01 kernel: sd(8,6):vs-13060: reiserfs_update_sd: stat data o
f object [1148 1150 0x0 SD] (nlink == 1) not found (pos 27)
Aug 23 21:02:18 mail01 last message repeated 20 times
Aug 23 21:02:22 mail01 kernel: sd(8,6):vs-13060: reiserfs_update_sd: stat data o
f object [1148 1150 0x0 SD] (nlink == 1) not found (pos 25)
Aug 23 21:02:32 mail01 last message repeated 24 times
Aug 23 21:02:33 mail01 kernel: sd(8,6):vs-13060: reiserfs_update_sd: stat data o
f object [1148 1150 0x0 SD] (nlink == 1) not found (pos 27)
Aug 23 21:02:33 mail01 last message repeated 5 times
Aug 23 21:02:35 mail01 kernel: sd(8,6):vs-13060: reiserfs_update_sd: stat data o
f object [1148 1150 0x0 SD] (nlink == 1) not found (pos 25)
Aug 23 21:02:35 mail01 last message repeated 7 times
Aug 23 21:02:36 mail01 kernel: sd(8,6):vs-13060: reiserfs_update_sd: stat data o
f object [1148 1150 0x0 SD] (nlink == 1) not found (pos 27)
Aug 23 21:02:36 mail01 kernel: sd(8,6):vs-13060: reiserfs_update_sd: stat data o
f object [1148 1150 0x0 SD] (nlink == 1) not found (pos 27)
Aug 23 21:02:39 mail01 kernel: sd(8,6):vs-13060: reiserfs_update_sd: stat data o
f object [1148 1150 0x0 SD] (nlink == 1) not found (pos 25)
Aug 23 21:02:42 mail01 last message repeated 8 times
Aug 23 21:02:43 mail01 kernel: sd(8,6):vs-13060: reiserfs_update_sd: stat data o
f object [1148 1150 0x0 SD] (nlink == 1) not found (pos 29)
Aug 23 21:02:43 mail01 kernel: sd(8,6):vs-13060: reiserfs_update_sd: stat data o
f object [1148 1150 0x0 SD] (nlink == 1) not found (pos 29)
Aug 23 21:02:43 mail01 kernel: sd(8,6):vs-13060: reiserfs_update_sd: stat data o
f object [1148 1150 0x0 SD] (nlink == 1) not found (pos 25)
Aug 23 21:02:43 mail01 last message repeated 3 times
Aug 23 21:02:44 mail01 kernel: sd(8,6):vs-13060: reiserfs_update_sd: stat data o
f object [1148 1150 0x0 SD] (nlink == 1) not found (pos 27)
Aug 23 21:02:44 mail01 kernel: sd(8,6):vs-13060: reiserfs_update_sd: stat data o
f object [1148 1150 0x0 SD] (nlink == 1) not found (pos 28)
Aug 23 21:02:44 mail01 kernel: sd(8,6):vs-13060: reiserfs_update_sd: stat data o
f object [1148 1150 0x0 SD] (nlink == 1) not found (pos 28)
Aug 23 21:02:44 mail01 kernel: sd(8,6):vs-13060: reiserfs_update_sd: stat data o
f object [1148 1150 0x0 SD] (nlink == 1) not found (pos 29)
Aug 23 21:02:44 mail01 last message repeated 2 times
Aug 23 21:02:58 mail01 kernel: sd(8,6):vs-13060: reiserfs_update_sd: stat data o
f object [1148 1150 0x0 SD] (nlink == 1) not found (pos 25)
Aug 23 21:03:29 mail01 last message repeated 45 times
Aug 23 21:03:40 mail01 last message repeated 10 times
Aug 23 21:03:40 mail01 kernel: sd(8,6):vs-13060: reiserfs_update_sd: stat data o
f object [1148 1150 0x0 SD] (nlink == 1) not found (pos 26)
Aug 23 21:03:40 mail01 kernel: sd(8,6):vs-13060: reiserfs_update_sd: stat data o
f object [1148 1150 0x0 SD] (nlink == 1) not found (pos 27)
Aug 23 21:03:40 mail01 kernel: sd(8,6):vs-13060: reiserfs_update_sd: stat data o
f object [1148 1150 0x0 SD] (nlink == 1) not found (pos 27)
Aug 23 21:03:41 mail01 kernel: sd(8,6):vs-13060: reiserfs_update_sd: stat data o
f object [1148 1150 0x0 SD] (nlink == 1) not found (pos 25)
Aug 23 21:03:41 mail01 kernel: sd(8,6):vs-13060: reiserfs_update_sd: stat data o
f object [1148 1150 0x0 SD] (nlink == 1) not found (pos 25)
Aug 23 21:03:43 mail01 kernel: sd(8,6):vs-13060: reiserfs_update_sd: stat data o
f object [1148 1150 0x0 SD] (nlink == 1) not found (pos 27)
Aug 23 21:03:43 mail01 last message repeated 2 times
Aug 23 21:03:43 mail01 kernel: sd(8,6):vs-13060: reiserfs_update_sd: stat data o
f object [1148 1150 0x0 SD] (nlink == 1) not found (pos 25)
Aug 23 21:03:43 mail01 kernel: sd(8,6):vs-13060: reiserfs_update_sd: stat data o
f object [1148 1150 0x0 SD] (nlink == 1) not found (pos 25)
Aug 23 21:03:44 mail01 kernel: sd(8,6):vs-13060: reiserfs_update_sd: stat data o
f object [1148 1150 0Aug 25 22:01:06 mail01 syslogd 1.4.1: restart.
[UNREADABLE BINARY DATA]

After reseting the system and telling the system to do an integrity
check of the local filesystems reiserfs doesn't complain much about he
filesystem. Here is the contents from the boot log when reiserfs
checks and mounts the filesystems.

Partition check:
 sda: sda1 sda2 sda3 sda4 < sda5 sda6 sda7 >
reiserfs: found format "3.6" with standard journal
reiserfs: checking transaction log (device sd(8,5)) ...
for (sd(8,5))
reiserfs: replayed 3 transactions in 0 seconds
sd(8,5):Using r5 hash to sort names
Freeing unused kernel memory: 168k freed
attempt to access beyond end of device
08:05: rw=0, want=4192936, limit=4192933
sd(8,5):Removing [38665 245093 0x0 SD]..done
sd(8,5):Removing [38665 245085 0x0 SD]..done
sd(8,5):There were 2 uncompleted unlinks/truncates. Completed
Adding Swap: 8385920k swap-space (priority -1)
reiserfs: found format "3.6" with standard journal
reiserfs: checking transaction log (device sd(8,2)) ...
for (sd(8,2))
sd(8,2):Using r5 hash to sort names
reiserfs: found format "3.6" with standard journal
reiserfs: checking transaction log (device sd(8,6)) ...
for (sd(8,6))
sd(8,6):Using r5 hash to sort names
sd(8,6):Removing [619 1807083 0x0 SD]..done
sd(8,6):There were 1 uncompleted unlinks/truncates. Completed
reiserfs: found format "3.6" with standard journal
reiserfs: checking transaction log (device sd(8,7)) ...
for (sd(8,7))
sd(8,7):Using r5 hash to sort names

My main questions are, could the file system corruption indicated by
the reiserfs_update_sd error messages the likely root to cause the
kernel panic? The panic message seems to indicate that
check_journal_end from journal.c in reiserfs (that is a completely
layman understanding of the panic message on my part).

If it is the cause of the panic, would repairing the file system be
adequate to prevent this from happening again? Also what is the
recommended method for repairing this error? From my research running
reiserfsck --rebuild-tree appears to be the commonly recommended
process, is this appropriate in this case? I assume that running
--check and --fix-fixable prior to doing this is appropriate, but
would --fix-fixable actually repair this problem?

Sorry for the long message, I wanted to include all the details I was
able to observe. Any help and or advice is extremely appreciated, if i
have left out anything that would be pertinent to debugging this
problem please let me know and I can attempt to retrieve the needed
information.


Take care.
-- 
Sean
