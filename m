From: Tom Vier <tmv@comcast.net>
Subject: anyone port data-logging patches to -rc3?
Date: Thu, 22 May 2003 20:30:33 -0400
Message-ID: <20030523003033.GC6586@zero>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-list-return-14217-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

i started to, but the change in reiserfs/inode.c:reiserfs_truncate_file() is
more than i want to play w/ (my first time looking at reiserfs code). i
don't want to trash my fs. 8)

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0xE6CB97DA
