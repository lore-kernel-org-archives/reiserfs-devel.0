From: Peter van Hardenberg <pvh@uvic.ca>
Subject: Reiser4 Pseudo Directory Segfault
Date: Wed, 14 Dec 2005 21:39:15 -0800
Message-ID: <200512142139.15315.pvh@uvic.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27304-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

How to produce the error:

$ chmod +w "file/...."
$ touch file/..../newattr
Segmentation fault.

We tried setting "dir_eperm" on the pseudo directory plugin's create member. 
Why didn't this fix it?

-pvh

-- 
Peter van Hardenberg (pvh@pvh.ca)
Victoria, BC, Canada
