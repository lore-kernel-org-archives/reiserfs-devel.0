From: Pierre Etchemaite <petchema@concept-micro.com>
Subject: Reiser4 breaks (Debian's ?) module-init-tools
Date: Mon, 4 Oct 2004 23:58:26 +0200
Message-ID: <20041004235826.09ed7a00@rayanne>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21997-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


        Hi,

On an (almost) fully Reiser4 system, /etc/modprobe.d/ contents seem to
be disregarded. When tracing modprobe, each file in this directory is
opened as a directory, that looks a lot like the Apache
compatibility bug.

open("/etc/modprobe.d/autofs", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 4
fstat64(4, {st_mode=S_IFREG|0644, st_size=64, ...}) = 0
fcntl64(4, F_SETFD, FD_CLOEXEC)         = 0
getdents64(4, 0x8063e3c, 65536)         = -1 ENOTDIR (Not a directory)
close(4)                                = 0

Looking closer, it's not limited to that directory:

open("/lib/modules/2.6.8.1/modules.alias", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=27353, ...}) = 0
fcntl64(3, F_SETFD, FD_CLOEXEC)         = 0
getdents64(3, 0x804f0ac, 65536)         = -1 ENOTDIR (Not a directory)
close(3)                                = 0

module-init-tools v. 3.1-pre5-7 (Debian testing)
