From: Henning Westerholt <henning@skalatan.de>
Subject: reiserfs4 fails to free unlinked files
Date: Sun, 17 Aug 2003 19:03:48 +0200
Message-ID: <200308171903.52263.henning@skalatan.de>
Reply-To: henning@skalatan.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15342-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I continued my test with "stress" on a fresh 10 GB Partition. With the 
previous compile jobs i noticed, that reiserfs4 fails to free unlinked files 
under load.

I was able to reproduce this problem only with stress. 
"stress -v -i 2 -c 2 -m 2 -d 2 --hdd-bytes 100M" produce cpu, vm, io load and 
wrote with two processes a random 100 MB file, delete the files and repeat 
forever.

This test-load fills the fs in 6 minutes. 


The same test on a small ext2 fs runs hours without problems. Reiserfs4 could 
complete the test only if i decrease the filesize down to 50 MB and without 
any additional load.

-- 
Regards,

Henning

