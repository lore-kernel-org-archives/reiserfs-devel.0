From: Spam <spam@tnonline.net>
Subject: nvram to protect fs during power loss?
Date: Fri, 31 Dec 2004 00:40:08 +0100
Message-ID: <1062660450.20041231004008@tnonline.net>
Reply-To: Spam <spam@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22987-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


  There have been some discussions about recovery abilities during
  power loss if write cache is enabled. Some recovery tool I saw once
  used NVRAM to store progress info so that if you had a power loss it
  would be able to resume.

  Perhaps it would be possible for Reiser4 to store some info, like
  time indexes etc in NVRAMwhen it send sync commands to the disk.
  This way it might be possible to avoid corruptions by simply
  verifying (fsck) the data stored after that time index etc?

  I have no idea how often NVRAM can be written to before it goes bad.
  Is there a limit?

  ~S
  


-- 

