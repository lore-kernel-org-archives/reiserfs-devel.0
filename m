From: Vitaly Fertman <vitaly@namesys.com>
Subject: reiser4progs-1.0.3
Date: Thu, 9 Dec 2004 16:01:22 +0300
Message-ID: <200412091601.22632.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22727-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi all!

Another reiser4progs release is available on our ftp site
(ftp.namesys.com/pub/reiser4progs). It includes:

- a lot of bug fixes, 
- correct handling of super block backups, 
- recovery according to the super block backups,
- demos/busy is a reiser4progs-busy-box program that is able 
  to create/remove/copy/read/ls/etc on reiser4 working through 
  libreiser4, without kernel reiser4 support.

It happened that the previous super block backups were created 
with a mistake and to resync them now you need to run
	fsck.reiser4 --build-sb <device>

-- 
Thanks,
Vitaly Fertman


