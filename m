From: Maciej Soltysiak <pysiak.satriani@wp.pl>
Subject: kern.log unrecognized option warning
Date: Fri, 27 Aug 2004 15:40:59 +0200
Message-ID: <1392551425.20040827154059@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20915-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs Mailinglist <reiserfs-list@namesys.com>

Hi,

While adding an entry to fstab i tried it with reiserfs notail.
Ok, there's no such option.
Is it important to write this also to the kern.log?

Aug 26 20:27:25 dns kernel: reiser4[mount(4962)]: parse_options (fs/reiser4/vfs_ops.c:844)[nikita-2307]:
Aug 26 20:27:25 dns kernel: WARNING: Unrecognized option: "notail"

Regards,
Maciej


