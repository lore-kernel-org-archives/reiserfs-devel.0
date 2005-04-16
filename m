From: Jun OKAJIMA <okajima@digitalinfra.co.jp>
Subject: Re: one idea about reiser4 compress
Date: Sun, 17 Apr 2005 07:29:38 +0900
Message-ID: <200504162229.AA00083@bbb-jz5c7z9hn9y.digitalinfra.co.jp>
References: <425EEDC0.2070707@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23887-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <425EEDC0.2070707@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Edward Shishkin <edward@namesys.com>
Cc: Linuxhippy <linuxhippy@web.de>, reiserfs-list@namesys.com

>
>Fine, but it makes sense only if source and target files are powered by 
>the same object plugin.
>Also there is no any chances for 'cp' to implement this (who will inform 
>the file system if we
>don't need to decompress?)
>

I am afraid if I got something wrong.
When you are going to do # cp -a /mnt/cdrom /mnt/install_hdd stuff,
the compression plug-in must not be enabled.
the pseudo transcript is like this.
Note: In this psuedo sample, enabling compression needs remounting,
but I hope this could be done with IOCTL to a dir or such and not need remounting.

                    --- Okajima.


-----------------
# mount -t reiser4 -o no-compression /dev/cdrom /mnt
# ls -la /mnt/cdrom/bin
-rwxr-xr-x    1 root     root         976 Dec 24  2002 arch
-rwxr-xr-x    1 root     root        3498 Mar  7  2002 cat
-rwxr-xr-x    1 root     root        8901 Mar 19  2002 chgrp
# /mnt/cdrom/cat
 EFL loader: illegal format.
# cp -a /mnt/cdrom /mnt/install_hdd
( wait a while... )
# mount -o remount,with-compression none /mnt/install_hdd
# ls -la /mnt/install_hdd
-rwxr-xr-x    1 root     root         2684 Dec 24  2002 arch
-rwxr-xr-x    1 root     root         9308 Mar  7  2002 cat
-rwxr-xr-x    1 root     root        15976 Mar 19  2002 chgrp
