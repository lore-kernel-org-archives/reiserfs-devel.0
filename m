From: Sean Johnson <gutenpress@gmail.com>
Subject: resizefs.reiser4
Date: Mon, 5 Jul 2004 13:25:53 -0400
Message-ID: <11fc6a25040705102557444d20@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19515-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

From looking at the help, it appears that all I need to do to resize a
reiserfs4 partition to 15G is:

resizefs.reiser4 /dev/device 15G

Unfortunately, when I do that, it just spits back the options to me.
This is an lvm device, that I just expanded from 10G to 15G. I've
tried a dozen different variations, and looked at the man page, but
there doesn't seem to be any information about what I'm doing wrong.

Any suggestions would be much appreciated.

Thanks,

Sean
