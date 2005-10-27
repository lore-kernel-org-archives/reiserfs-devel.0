From: Michael James <Michael.James@csiro.au>
Subject: recovering deleted files from a dd image
Date: Thu, 27 Oct 2005 17:39:51 +1000
Message-ID: <200510271739.51334.Michael.James@csiro.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26677-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

What tools or options are there for recovering files,
 deleted and current from a dd partition image?

ls -l  dd-file-image
-rw-r--r--  1 root   root 11745699840 2005-10-27 16:46
		 dd-file-image

It was a SuSE 9.0 system running on reiser 3.6

/mnt/sbin/mkfs.reiserfs -V
mkfs.reiserfs 3.6.9 (2003 www.namesys.com)

michaelj

-- 
Michael James                         michael.james@csiro.au
System Administrator                    voice:  02 6246 5040
CSIRO Bioinformatics Facility             fax:  02 6246 5166

No matter how much you pay for software,
 you always get less than you hoped.
Unless you pay nothing, then you get more.
