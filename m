From: Cal <hihone@bigpond.net.au>
Subject: Re: 2.6.9-3 patch won't compile
Date: Mon, 13 Dec 2004 23:30:56 +1100
Message-ID: <20041213233056.06d446ab.hihone@bigpond.net.au>
References: <18A36962E684664DB223E403DB64FB220C6805@W23FT01.Fourtop.local>
Reply-To: hihone@bigpond.net.au
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22750-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <18A36962E684664DB223E403DB64FB220C6805@W23FT01.Fourtop.local>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lex  Jonkers <jonkersl@Fourtop.nl>
Cc: reiserfs-list@namesys.com

----------
and then at Mon, 13 Dec 2004 13:17:14 +0100, it was written ...
 >I'm having problems compiling 2.6.9-3 patch:
 >...
 >fs/reiser4/plugin/cryptcompress.c: In function `set_cluster_params':
 >fs/reiser4/plugin/cryptcompress.c:2203: parse error before `hole_size'
 >fs/reiser4/plugin/cryptcompress.c:2204: `hole_size' undeclared (first
use in this function) >fs/reiser4/plugin/cryptcompress.c:2204: (Each
undeclared identifier is reported only once
>fs/reiser4/plugin/cryptcompress.c:2204: for each function it appears in.)
 >make[2]: *** [fs/reiser4/plugin/cryptcompress.o] Error 1
 >make[1]: *** [fs/reiser4] Error 2
 >make: *** [fs] Error 2
 >
 >
 >Are these patches stand-alone or incremental?

If you mean the namesys 2.6.9-[1-3] patches, they're standalone. 2 and 3
are good, 3 is probably  the better.

Cal
