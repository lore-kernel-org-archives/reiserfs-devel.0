From: Cal <hihone@bigpond.net.au>
Subject: Re: 2.6.9-3 patch won't compile
Date: Tue, 14 Dec 2004 00:04:14 +1100
Message-ID: <20041214000414.3d14a322.hihone@bigpond.net.au>
References: <18A36962E684664DB223E403DB64FB220C6806@W23FT01.Fourtop.local>
Reply-To: hihone@bigpond.net.au
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22752-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <18A36962E684664DB223E403DB64FB220C6806@W23FT01.Fourtop.local>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lex  Jonkers <jonkersl@Fourtop.nl>
Cc: reiserfs-list@namesys.com

----------
and then at Mon, 13 Dec 2004 13:44:35 +0100, it was written ...
 >>  >fs/reiser4/plugin/cryptcompress.c: In function `set_cluster_params':
 >>  >fs/reiser4/plugin/cryptcompress.c:2203: parse error before 
 >> `hole_size'
 >...
 >
 >Any idea why -3 won't compile on a vanilla 2.6.9 ?
 >-1 and -2 compile without problems.
 >
 >With Regards,
 >Lex Jonkers

Looks like maybe a compilation problem.  Where yours dies with a parse
error (cryptcompress.c:2203), mine coughs a polite warning -
fs/reiser4/plugin/cryptcompress.c: In function `set_cluster_params':
fs/reiser4/plugin/cryptcompress.c:2203: warning: ISO C90 forbids mixed
declarations and code

I'm using gcc (GCC) 3.4.4 20041128 (prerelease) (Debian 3.4.3-3). I can't
help but wonder if my compiler is bigger than your compiler?

cheers, Cal
