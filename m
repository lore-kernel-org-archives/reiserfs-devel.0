From: hanasaki <hanasaki@hanaden.com>
Subject: --rebuild-tree always finds errors --check is ok
Date: Thu, 30 Dec 2004 23:35:46 -0600
Message-ID: <41D4E532.9000905@hanaden.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22995-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Running reiser3 on kernel 2.6.10 and 2.6.9 with Debian sarge and unstable.

the --rebuild-tree always finds errors and corrects them.  even when run 
more than once consecutively without mounting the partition in between.

--check says all is good.


