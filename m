From: Tom Vier <tmv@comcast.net>
Subject: bad news? got vs-8115 again
Date: Thu, 23 Sep 2004 14:10:48 -0400
Message-ID: <20040923181048.GA18256@zero>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21893-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

this time on a server i'm putting into use soon:

ReiserFS: md0: warning: vs-8115: get_num_ver: not directory item
ReiserFS: md0: warning: vs-8115: get_num_ver: not directory item

this time it's raid 1 (last time it was raid 0, on a different machine).
both running 2.6.8.

nothing seems to have been affected either time. is this something i can
ignore? get_num_ver is being handed something it's not supposted to see,
correct?

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0x15741ECE
