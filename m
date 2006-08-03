From: Andrew James Wade <andrew.j.wade@gmail.com>
Subject: Re: [nikita-3002]: assertion failed: carry_level_invariant(doing, CARRY_DOING)
Date: Thu, 3 Aug 2006 08:51:29 -0400
Message-ID: <200608030851.30457.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
References: <200608021749.30205.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
Reply-To: ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29454-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200608021749.30205.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I've just had some warnings show up in my kernel log. I don't know if
they're related to the troubles I've been having (I fscked after the
last panic).

reiser4[updatedb(32445)]: key_warning (fs/reiser4/plugin/file_plugin_common.c:513)[nikita-717]:
WARNING: Error for inode 401698 (-2)
for key: (6211c:1:656e646f727365:0:62122:0)[stat data]
reiser4[updatedb(32445)]: key_warning (fs/reiser4/plugin/file_plugin_common.c:513)[nikita-717]:
WARNING: Error for inode 401697 (-2)
for key: (6211c:1:6576656e74732e:0:62121:0)[stat data]
reiser4[updatedb(32445)]: key_warning (fs/reiser4/plugin/file_plugin_common.c:513)[nikita-717]:
WARNING: Error for inode 401694 (-2)
for key: (6211c:1:736e617073686f:0:6211e:0)[stat data]
reiser4[updatedb(32445)]: key_warning (fs/reiser4/plugin/file_plugin_common.c:513)[nikita-717]:
WARNING: Error for inode 401699 (-2)
for key: (6211c:1:776f6d656e5f6c:0:62123:0)[stat data]

Hope this helps,
Andrew Wade
