From: "Steve Pratt" <slpratt@us.ibm.com>
Subject: Question on new volumes
Date: Tue, 10 Sep 2002 17:15:34 -0500
Message-ID: <OF90C8A0AB.075F13E9-ON85256C30.0079AA70@pok.ibm.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11410-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com


During some EVMS testing we have run into an interesting behavior.  It
seems that new mkfsed Reiserfs volumes are not mountable read only.  Here
is the actual scenario:

1. mkfs volume
2. create ro snapshot to other volume
3. When attempting to mount the snapshot we get the following errors:
      Sep 10 12:47:00 slpratt kernel: reiserfs_read_super: unable to
initialize journal space
      Sep 10 12:47:45 slpratt kernel: reiserfs: checking transaction log
(device 75:ff) ...
      Sep 10 12:47:45 slpratt kernel: clm-2076: device is readonly, unable
to replay log
      Sep 10 12:47:45 slpratt kernel: Replay Failure, unable to mount

If the original volume is mounted and unmount prior to taking the snapshot
everything is fine.

I know that this is not an important (or even sane)  order of events (ie
snapshotting a never mounted and thus empty volume) but was just something
that we ran across in testing.  Is there some reason that the log is not
fully initialized by mkfs?  fsck says it is fine.

Steve

EVMS Development - http://www.sf.net/projects/evms
Linux Technology Center - IBM Corporation
(512) 838-9763  EMAIL: SLPratt@US.IBM.COM


