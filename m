From: Sergey Ivanov <seriv@parkheights.dyndns.org>
Subject: strange reiser4 messages in /var/log/messages
Date: Mon, 06 Mar 2006 18:06:37 -0500
Message-ID: <440CC07D.3050802@parkheights.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28219-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS List <reiserfs-list@namesys.com>

Hi,
I have vanilla 2.6.15.4 kernel with reiser4-for-2.6.15-1.patch applied.
The machine is SMP with SCSI 17G drive formatted as reiser4.
The reiser4 works for /var/spool, with rate about 100 files/sec creating
and deleting sometimes after, average filesize about 10k, with total
spool size about 5G.
Under load the following messages from reiser4 occur in the log:
--
Mar  5 13:21:02 test-10 kernel: <4>reiser4[sendmail(3485)]:
disable_write_barrier (fs/reiser4/wander.c:233)[zam-1055]:
Mar  5 13:21:02 test-10 kernel: WARNING: disabling write barrier
--
and then recurring lines:
--
Mar  6 14:26:27 test-10 kernel: <4>reiser4[ecelerity(7189)]:
commit_current_atom (fs/reiser4/txnmgr.c:1092)[nikita-3176]:
Mar  6 14:26:27 test-10 kernel: WARNING: Flushing like mad: 16384
--
Mar  6 16:33:57 test-10 kernel: <4>reiser4[sendmail(14667)]:
commit_current_atom (fs/reiser4/txnmgr.c:1092)[nikita-3176]:
Mar  6 16:33:57 test-10 kernel: WARNING: Flushing like mad: 16384
--
Mar  6 16:34:03 test-10 kernel: <4>reiser4[sendmail(14667)]:
commit_current_atom (fs/reiser4/txnmgr.c:1092)[nikita-3176]:
Mar  6 16:34:03 test-10 kernel: WARNING: Flushing like mad: 32768
--
Mar  6 17:13:39 test-10 kernel: <4>reiser4[sendmail(32517)]:
commit_current_atom (fs/reiser4/txnmgr.c:1092)[nikita-3176]:
Mar  6 17:13:39 test-10 kernel: WARNING: Flushing like mad: 16384
--
Mar  6 17:23:18 test-10 kernel: <4>reiser4[sendmail(5564)]:
commit_current_atom (fs/reiser4/txnmgr.c:1092)[nikita-3176]:
Mar  6 17:23:18 test-10 kernel: WARNING: Flushing like mad: 16384
--
Mar  6 17:27:34 test-10 kernel: <4>reiser4[sendmail(7008)]:
commit_current_atom (fs/reiser4/txnmgr.c:1092)[nikita-3176]:
Mar  6 17:27:34 test-10 kernel: WARNING: Flushing like mad: 16384
--
Mar  6 17:30:48 test-10 kernel: <4>reiser4[sendmail(12149)]:
commit_current_atom (fs/reiser4/txnmgr.c:1092)[nikita-3176]:
Mar  6 17:30:48 test-10 kernel: WARNING: Flushing like mad: 16384
--
Mar  6 17:46:16 test-10 kernel: <4>reiser4[ecelerity(30614)]:
commit_current_atom (fs/reiser4/txnmgr.c:1092)[nikita-3176]:
Mar  6 17:46:16 test-10 kernel: WARNING: Flushing like mad: 16384
--
Mar  6 17:47:52 test-10 kernel: <4>reiser4[sendmail(17150)]:
commit_current_atom (fs/reiser4/txnmgr.c:1092)[nikita-3176]:
Mar  6 17:47:52 test-10 kernel: WARNING: Flushing like mad: 16384
...
Please, advice, what do these messages mean, does this situation result
in data loss or damage, and are there some new patches to fix it?
-- 
    With best regards,
       Sergey Ivanov.


