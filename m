From: Cal <hihone@bigpond.net.au>
Subject: Re: reiser4 crash
Date: Thu, 25 Nov 2004 22:19:19 +1100
Message-ID: <20041125221919.2180794b.hihone@bigpond.net.au>
References: <20041119084757.GA2310@sk2-4.tky.hut.fi>
	<1101369249.1628.13.camel@tribesman.namesys.com>
Reply-To: hihone@bigpond.net.au
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22557-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1101369249.1628.13.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com

----------
and then at Thu, 25 Nov 2004 10:54:10 +0300, it was written ...
  >
 >Which kernel do you use?
 >
 >> 	Sami
...
 >> kernel BUG at fs/reiser4/plugin/file/tail_conversion.c:32!
 >> invalid operand: 0000 [#1]
 >> PREEMPT
...
 >> EFLAGS: 00210286   (2.6.10-rc1)
 >> EIP is at get_exclusive_access+0x32/0x40

This occurs with 2.6.10-rc2-mm2, 2.6.10-rc2-mm3.  It's nastier than
you might think.  After the BUG, the system slowly sinks into fatal
decline, losing  screen i/o, keyboard response, eventually just
locking up completely.

cheers, Cal
