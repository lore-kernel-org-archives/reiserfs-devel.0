From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: A real panic
Date: Sat, 13 Nov 2004 14:04:55 +0200
Message-ID: <20041113120455.GI26192@nysv.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22371-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi

I fixed the issues with Bus errors, that was because of a broken /bin/rmdir
binary :)
However, I compiled the kernel with all sorts of debugs, trying to catch what
caused the Bus errors and got a nice ancillary effect. 

Nov 13 13:38:21 shrike kernel: reiser4 panicked cowardly: assertion failed: !memcmp(inode->u.generic_ip, sd->body, (size_t) length + 1)

The forensics data is at http://mjt.nysv.org/reiser/2004.11.13.forensics/

The Reiser4 version is backported from -mm something by Piotr Neuman.

Thanks!

-- 
mjt


