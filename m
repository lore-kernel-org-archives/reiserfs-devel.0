From: Vitaly Fertman <vitaly@namesys.com>
Subject: reiserfsprogs 3.6.18 release
Date: Tue, 3 Aug 2004 20:14:33 +0400
Message-ID: <200408032014.33703.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19946-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi all,

The new release is available on our ftp site, it inlcludes :
- fixes in the big endian support code;
- fixes in unaligned access to unformatted block pointers on ia64;
- handle suse's block allocator changes correctly;
- syncing host & journal devices after replaing every transaction.

-- 
Thanks,
Vitaly Fertman

