From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Processes dying?
Date: Fri, 4 Jun 2004 23:39:25 +0300
Message-ID: <20040604203925.GF4990@nysv.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19017-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hello

I just started using the latest auto-snapshot.

I noticed weird behavior, that is, processes crash, so bad even C-c doesn't
kill them. For some reason running strace behind them gives me C-c support.

Also pressing tab in bash seems to kill me.

lstat64("/var/cache/apt/srcpkgcache.bin", {st_mode=S_IFREG|0644,
st_size=5193537, ...}) = 0
open("/var/cache/apt/srcpkgcache.bin", O_RDWR|O_CREAT|O_TRUNC, 0666) = 6
fcntl64(6, F_SETFD, FD_CLOEXEC)         = 0
fchmod(6, 0644)                         = 0
write(6, "\334v\376\230\4\0\0\0\1\0X!(\0008\0000\0\34\0\24\0\20\0"..., 5193537
<unfinished ...>
shrike:~# apt-get install bonnie++
E: Could not get lock /var/lib/dpkg/lock - open (11 Resource temporarily
unavailable)
E: Unable to lock the administration directory (/var/lib/dpkg/), is another
process using it?
shrike:~# fuser /va

and it died

Then on another terminal:
shrike:/var/lib/dpkg# rm lock

and it stuck

mjt@shrike:~$ ls ls /var
ls: ls: No such file or directory
/var:
backups  cache  games  lib  local  lock  log  mail  opt  run  spool  tmp  www
mjt@shrike:~$ ls ls /var

The other one with tab, and it jammed.

mjt@shrike:~$ ps awx | grep D+
 3939 pts/11   D+     0:00 -su
 3953 pts/4    D+     0:00 -su
 3956 pts/7    D+     0:00 -su
 3973 pts/6    D+     0:00 rm lock
 4003 pts/0    R+     0:00 grep D+
     
I'll try to improvise something, or maybe quit back to -love4.

Any ideas? How can this be debugged?

Thanks!

-- 
mjt

