From: eazgwmir@umail.furryterror.org (Zygo Blaxell)
Subject: Re: How to break a reiserfs on Linux 2.4.20
Date: 16 Jan 2003 09:16:11 -0500
Message-ID: <b06erb$j34$1@satsuki.furryterror.org>
References: <b01ff1$sp0$1@genki.hungrycats.org> <b04o8a$eah$1@satsuki.furryterror.org> <b04o8a$eah$1@satsuki.furryterror.org> <20030116104906.A7078@namesys.com>
Return-path: <reiserfs-list-return-12394-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

In article <20030116104906.A7078@namesys.com>,
Oleg Drokin  <green@namesys.com> wrote:
>Yes, we were able to reproduce the problem and now we are trying to fix it.
>Thanks a lot for your help and for the script.

Excellent!  :-)

Just on a whim, I ran the tests on a different kernel image yesterday
and got some different results in the syslog:

Jan 15 18:15:54 berkelium kernel: reiserfs: checking transaction log (device 16:02) ...
Jan 15 18:15:54 berkelium kernel: Using r5 hash to sort names
Jan 15 18:15:54 berkelium kernel: ReiserFS version 3.6.25
[test script starts here]
Jan 15 18:26:00 berkelium kernel: mmit_list, block already dirty!
Jan 15 18:26:00 berkelium kernel: journal-569: flush_commit_list, block already dirty!
Jan 15 18:26:00 berkelium last message repeated 291 times
Jan 15 18:26:00 berkelium kernel: vs-13060: reiserfs_update_sd: stat data of object [537145 537147 0x0 SD] (nlink == 6) not found (pos 2)
[messages similar to the last one repeated for about 500 lines]

Then the kernel panicked.  I'm going to try this again and try to capture the 
panic message.  The filesystem was pretty badly trashed when I tried to
mount it after rebooting--lots of files had appeared in the root of the
filesystem where they shouldn't be, and nothing was accessible.

The main difference between the two kernels (aside from whether various SCSI
and RAID drivers are built-in or modules) is the SMP flag and CPU type
(Pentium 3 uniprocessor vs. 586 SMP).  Neither one had the REISER_CHECK
option set.

-- 
Zygo Blaxell (Laptop) <zblaxell@feedme.hungrycats.org>
GPG = D13D 6651 F446 9787 600B AD1E CCF3 6F93 2823 44AD
