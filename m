From: Wolfgang Riedmann <wolfgang@riedmann.it>
Subject: wait_buffer_until_released - occuring on another machine
Date: Fri, 30 Jan 2004 09:48:24 +0100
Message-ID: <20040130100093.SM01320@ARMADA>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <reiserfs-list-return-16656-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Resent-to: reiserfs-list@namesys.com
Resent-Message-Id: <E1AmUXa-0003f6-00@deer.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com!

Hi,

sorry for writing again.

I have installed two weeks ago a new server almost identical to the 
first one before christmas. The machine is a Compaq Proliant ML 350 
with Smart Array 461 (this time with 64 MB of cache instead of 128) 
and 4 x 36 GB disks added to a RAID 5 array with about 100 GB of disk 
space (hardware RAID, the OS sees only one disk).
The data partition is about 90 GB, formatted with ReiserFS 3.6, and 
the machine is running Debian Linux stable 3.0, but with kernel 
2.4.22 (because earlier kernels doesn't supported the RAID 
controller).

Now, when copying a big file to the machine (using Samba 3.0.1, the 
other machine had Samba 2.2.8a), the offending Samba process uses 
almost all of the CPU and /var/log/messages is filled with errors 
like this:

Jan 30 09:32:11 asamserver kernel: vs-3050: 
wait_buffer_until_released: nobody releases buffer (dev 68:06, size 
4096, blocknr 2850816, count 3, list 0, state 0x10019, page c15621c8, 
(UPTODATE, CLEAN, UNLOCKED)). Still waiting (-360000000)  JDIRTY 
!JWAIT
Jan 30 09:32:17 asamserver kernel: vs-3050: 
wait_buffer_until_released: nobody releases buffer (dev 68:06, size 
4096, blocknr 2850816, count 3, list 0, state 0x10019, page c15621c8, 
(UPTODATE, CLEAN, UNLOCKED)). Still waiting (-330000000)  JDIRTY 
!JWAIT
Jan 30 09:32:24 asamserver kernel: vs-3050: 
wait_buffer_until_released: nobody releases buffer (dev 68:06, size 
4096, blocknr 2850816, count 3, list 0, state 0x10019, page c15621c8, 
(UPTODATE, CLEAN, UNLOCKED)). Still waiting (-300000000)  JDIRTY 
!JWAIT
Jan 30 09:32:31 asamserver kernel: vs-3050: 
wait_buffer_until_released: nobody releases buffer (dev 68:06, size 
4096, blocknr 2850816, count 3, list 0, state 0x10019, page c15621c8, 
(UPTODATE, CLEAN, UNLOCKED)). Still waiting (-270000000)  JDIRTY 
!JWAIT
Jan 30 09:32:38 asamserver kernel: vs-3050: 
wait_buffer_until_released: nobody releases buffer (dev 68:06, size 
4096, blocknr 2850816, count 3, list 0, state 0x10019, page c15621c8, 
(UPTODATE, CLEAN, UNLOCKED)). Still waiting (-240000000)  JDIRTY 
!JWAIT
Jan 30 09:32:45 asamserver kernel: vs-3050: 
wait_buffer_until_released: nobody releases buffer (dev 68:06, size 
4096, blocknr 2850816, count 3, list 0, state 0x10019, page c15621c8, 
(UPTODATE, CLEAN, UNLOCKED)). Still waiting (-210000000)  JDIRTY 
!JWAIT
Jan 30 09:32:52 asamserver kernel: vs-3050: 
wait_buffer_until_released: nobody releases buffer (dev 68:06, size 
4096, blocknr 2850816, count 3, list 0, state 0x10019, page c15621c8, 
(UPTODATE, CLEAN, UNLOCKED)). Still waiting (-180000000)  JDIRTY 
!JWAIT
Jan 30 09:32:59 asamserver kernel: vs-3050: 
wait_buffer_until_released: nobody releases buffer (dev 68:06, size 
4096, blocknr 2850816, count 3, list 0, state 0x10019, page c15621c8, 
(UPTODATE, CLEAN, UNLOCKED)). Still waiting (-150000000)  JDIRTY 
!JWAIT


Since I have this on the second machine, and the error comes from 
ReiserFS, I need to do something. I do exclude hardware errors.

Thank you in advance!

Wolfgang

