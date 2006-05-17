From: Tom Vier <tmv@comcast.net>
Subject: 2.6.16 + reiser4 -2 patch = gcc error
Date: Wed, 17 May 2006 15:08:05 -0400
Message-ID: <20060517190805.GB32223@zero>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28644-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

I'm using 2.6.16 and the patch from
ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.16/reiser4-for-2.6.16-2.patch.gz

  CC [M]  fs/reiser4/plugin/file_ops_readdir.o
fs/reiser4/plugin/file_ops_readdir.c: In function lseek_common_dir':
fs/reiser4/plugin/file_ops_readdir.c:485: warning: implicit declaration of
function 
utex_lock'
fs/reiser4/plugin/file_ops_readdir.c:485: error: structure has no member
named 	_mutex'
fs/reiser4/plugin/file_ops_readdir.c:507: warning: implicit declaration of
function 
utex_unlock'
fs/reiser4/plugin/file_ops_readdir.c:507: error: structure has no member
named 	_mutex'
make[2]: *** [fs/reiser4/plugin/file_ops_readdir.o] Error 1
make[1]: *** [fs/reiser4] Error 2
make: *** [fs] Error 2

Sorry if this has been posted already. I searched, but didn't find it.

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0x15741ECE
