From: Vitaly Fertman <vitaly@namesys.com>
Subject: reiserfsprogs 3.6.19 release
Date: Wed, 13 Oct 2004 18:08:46 +0400
Message-ID: <200410131808.46121.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22061-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi all, 

The new release is available on our ftp site and it includes:

- fixes in hash value == 0 handling and generation counters
  handing with the same hash;

- fix in {get|set}_unaligned on ppc definitions;

- fix in BLKGETSIZE64 definition;

- stat data sd_blocks is set correctly for quota;

- some warning, return value, die call cleanups.

-- 
Thanks,
Vitaly Fertman

