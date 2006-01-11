From: "Raymond A. Meijer" <rmeijer@internet.gr>
Subject: vs-4080
Date: Wed, 11 Jan 2006 11:09:09 +0200
Message-ID: <200601111109.09437.rmeijer@internet.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27661-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello,

This morning I found the following warning on my Debian server holding a 253
GB Debian archive mirror:

ReiserFS: dm-8: warning: vs-4080: reiserfs_free_block: free_block (dm-8:46707368)[dev:blocknr]: bit already cleared

If fixed it with --fix-fixable, but what was it and what does it mean?


Thanks,

Ray
