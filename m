From: Pierre Etchemaite <petchema@concept-micro.com>
Subject: linux-2.4.19p7-compound-speedup-2.patch + apt-get => segfault
Date: Wed, 3 Jul 2002 02:25:42 +0200
Message-ID: <20020703022542.7104ac87.petchema@concept-micro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10906-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS List <reiserfs-list@namesys.com>


Maybe it's old news, but maybe not.

It seems that linux-2.4.19p7-compound-speedup-2.patch makes apt-get to segfault during dependency tree building (in pkgCacheGenerator::MergeList to be exact)

2.4.19-rc1 + all 2.4.19-pre7.pending => ok

2.4.19-rc1 + all 2.4.19-pre7.pending + linux-2.4.19p7-compound-speedup-2.patch => segfault

Since apt-get uses mmap() "in evil ways" [1], and already picked up some xfs bugs, I'm not all that surprised...

[1] Words from Jason Gunthorpe <jgg@debian.org>, see http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=93453&repeatmerged=yes
don't know what he *really* means ;)
