From: Russell Coker <russell@coker.com.au>
Subject: xattr
Date: Mon, 16 Jun 2003 22:26:39 +1000
Message-ID: <200306162226.39701.russell@coker.com.au>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14560-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

What is the status of xattr support in 2.5.x?

How is journalling of xattr's being handled?

For correct operation of SE Linux we need to have the xattr that is used for 
the security context be changed atomically, and if a file is created and 
immediately has the xattr set then ideally we would have the file creation 
and the xattr creation in the same journal entry.

Is this possible?  If doing this requires that the file system be mounted with 
data=journal then this will be fine.

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

