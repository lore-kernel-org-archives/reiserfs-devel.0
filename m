From: Russell Coker <russell@coker.com.au>
Subject: kernel error messages
Date: Mon, 14 Jul 2003 08:06:14 +1000
Message-ID: <200307140806.14775.russell@coker.com.au>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14923-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS <reiserfs-list@namesys.com>

kernel: is_tree_node: node level 35586 does not match to the expected one 1
kernel: vs-5150: search_by_key: invalid format found in block 107509. Fsck?
kernel: is_tree_node: node level 35586 does not match to the expected one 1
kernel: vs-5150: search_by_key: invalid format found in block 107509. Fsck?

Messages such as the above should include information on which file system has 
the error, otherwise we don't know which one to fsck...

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

