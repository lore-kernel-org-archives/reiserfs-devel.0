From: Adrian Phillips <a.phillips@met.no>
Subject: 3.5.34: reiserfs_file_write: item has been moved
Date: 14 Aug 2002 07:49:23 +0200
Sender: "Adrian Phillips,,," <a.phillips@dnmi.no>
Message-ID: <wvu1ly56sc.fsf@freeze.oslo.dnmi.no>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11183-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com


Kernel 2.2.20 with the following patches :-
 linux_patches/patch-2.2.21-rc4.bz2
 reiserfs/linux-2.2.19-reiserfs-3.5.34-patch-buffer-300.bz2
 linux-2.2.18-rawio.patch
 lvm/lvm-1.0.4-2.2.21-rc4.patch
 ide-2.2.21-rc4.patch.bz2
 max_tasks.patch

I have got the following error 4 times in the space of about a week :-

reiserfs_file_write: item has been moved while we were in copy_from_user (appending to the direct item)

Should I be worried ? :-)

[I'll can schedule a reiserfsck early tomorrow morning if this is
necessary but I'd rather wait to hear if this indicates corruption
before doing that]

Sincerely,

Adrian Phillips

-- 
Your mouse has moved.
Windows NT must be restarted for the change to take effect.
Reboot now?  [OK]
