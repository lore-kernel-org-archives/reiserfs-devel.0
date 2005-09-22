From: Grzegorz Piotr Jaskiewicz <gj@kdemail.net>
Subject: Re: compilation problems with gcc4
Date: Thu, 22 Sep 2005 14:43:36 +0200
Message-ID: <200509221443.37414@gj-laptop>
References: <200509221326.49204@gj-laptop> <4332A2DE.3040904@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26232-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4332A2DE.3040904@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

still some warnings:
  CC [M]  fs/reiser4/znode.o
fs/reiser4/znode.c: In function 'znode_set_ld_key':
fs/reiser4/znode.c:729: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
and the error. 
  CC [M]  fs/reiser4/znode.o
fs/reiser4/znode.c: In function 'znode_set_ld_key':
fs/reiser4/znode.c:729: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning

It might be thou, because I am compiling against 2.6.13.2 not 2.6.14.X right ?

-- 
GJ

Binary system, you're either 1 or 0...
dead or alive ;)
