From: Martin Wilck <Martin.Wilck@Fujitsu-Siemens.com>
Subject: Apparent race condition in do_journal_begin_r() with UL kernel
Date: 16 Sep 2003 17:12:58 +0200
Message-ID: <1063725179.12929.548.camel@biker.psw.pdb.fsc.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15672-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiser FS Mailing List <reiserfs-list@namesys.com>

Hi,

this problem may or may not be related to the last message I sent to
this list ("is_tree_inode ..").

The problem occurs on the same machine, with the same test scenario.
I applied Oleg's patch and successfully got rid of the
"is_tree_inode..." messages. 

However, after ~20h of high IO stress I run into the following
situation:

- 1 of the involved Reiser filesystems cannot be accessed anymore.
  a number of processes in "D" state tries to access files on that file
  system:

STAT PID   TIME     START    WCHAN         COMMAND/ARGS
D    15846 00:00:00 11:33:36 107f93 down   cp /hd2/a55M2 /hd1/cp7
D    15879 00:00:00 11:33:37 107f93 down   cp /hd1/a50M1 /hd2/cp2
D    15915 00:00:29 11:33:37 107f93 down   cp /hd2/a117M2 /hd3/cp71
D    16160 00:00:00 11:33:38 107f93 down   cp /hd2/a40M2 /hd1/cp5
D    16289 00:00:00 11:33:40 107f93 down   cp /hd1/src1/f.64mb /hd2/dest1
D    16895 00:00:00 11:33:46 107f93 down   cp /hd1/src1/refdat.7 /hd2/dest1
D    16938 00:00:00 11:33:46 107f93 down   cp /hd2/dest1/refdat.6 /hd1/src1/refdat.6
D    16985 00:00:00 11:33:46 107f93 down   cp /hd2/dest1/refdat.5 /hd1/src1/refdat.5
D    17031 00:00:00 11:33:46 107f93 down   cp /hd2/dest1/refdat.4 /hd1/src1/refdat.4
D    17082 00:00:00 11:33:47 107f93 down   cp /hd1/src1/f.16mb /hd2/dest1
D    17087 00:00:00 11:33:47 107f93 down   cp /hd2/a10M1 /hd1/cp3
D    17100 00:00:00 11:33:47 107f93 down   cp /hd2/dest1/f.8mb /hd1/src1/f.8mb
D    17138 00:00:22 11:33:48 107f93 down   cp /hd1/src1/refdat.3 /hd2/dest1
D    17163 00:00:00 11:33:48 107f93 down   cp /hd2/dest1/refdat.1 /hd1/src1/refdat.1
D    17194 00:00:00 11:33:49 107f93 down   cp /hd2/dest1/refdat.2 /hd1/src1/refdat.2
D    17458 00:01:38 11:33:54 107f93 down   rm /hd2/src2/f.32mb
D    17463 00:00:00 11:33:54 107f93 down   rm /hd2/src2/f.8mb
D    17468 00:00:00 11:33:54 107f93 down   rm /hd2/src2/f.16mb
D    17473 00:00:00 11:33:54 107f93 down   rm /hd2/src2/f.64mb
D    17480 00:00:00 11:33:55 107f93 down   rm /hd2/dest1/f.32mb
D    17772 00:00:00 11:33:56 107f93 down   cp /hd2/a35M1 /hd1/cp6

  Note that all processes were started approximately at the same time, which was
  ~1h ago at the time I produced this output.
  Newly started processes accessing the filesystem will also end up in 
  uninterruptible sleep.

- A closer look reveals that some of these processes (at least those with
  TIME > 0 above) are not stalled in 'D', but keep running. Their WCHAN changes
  from "down" to "wait_on_buffer" from time to time.

- iostat reports a continuous activity of ~80 requests/s, 950kB/s 
  on the respective device.

- The partition itself (raw) can be accessed and read.

- debugreiserfs -p reports "BROKEN BLOCK HEAD" for some blocks. The
  number of blocks with "broken block head" varies between 0 and 4
  in subsequent debugreiserfs runs, the reported indices of broken
  blocks vary, too (of course).

- My analysis of call traces of the offending processes shows that 
  all 'cp' processes and one 'rm' seem to be stuck in the 
  lock_journal() call in do_journal_begin_r().
  The "cp" processes all end up in journal_begin() through
  __mark_inode_dirty() (both in read() and write() system calls).
  3 of the 'rm' processes are stuck in the down() call in sys_unlink().

So, AFAICT, this look like a race of at least 3 processes for some
ReiserFS locks / semaphores.

Any hints and ideas for further debugging are greatly appreciated.

PS: A very similar observation was the actual reason that we started
this debugging procedure in the first place. We happened to have the
"is_tree_inode ..." messages, too, though, and I thought the apparent
race was  a follow-up error of those. However, since the race also comes
to pass with Oleg's patch, it seems to be an unrelated problem.

Regards,
Martin

-- 
Martin Wilck                Phone: +49 5251 8 15113
Fujitsu Siemens Computers   Fax:   +49 5251 8 20409
Heinz-Nixdorf-Ring 1	    mailto:Martin.Wilck@Fujitsu-Siemens.com
D-33106 Paderborn           http://www.fujitsu-siemens.com/primergy





