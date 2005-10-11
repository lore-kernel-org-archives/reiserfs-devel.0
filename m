From: Sander <sander@humilis.net>
Subject: Re: corrupted disk
Date: Tue, 11 Oct 2005 15:31:04 +0200
Message-ID: <20051011133104.GA2763@favonius>
References: <200510111602.24857.listuser@peternixon.net>
Reply-To: sander@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-26479-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200510111602.24857.listuser@peternixon.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Nixon <listuser@peternixon.net>
Cc: reiserfs-list@namesys.com

Peter Nixon wrote (ao):
> At 06:15 this morning the following errors showed up in /var/log/messages

> Oct 11 06:15:03 DB2MUHASEBE kernel: kernel BUG at prints.c:334!
> Oct 11 06:15:03 DB2MUHASEBE kernel: invalid operand: 0000 2.4.21-138-smp #1 
> SMP Fri Oct 31 00:51:31 UTC 2003

> Oct 11 06:15:03 DB2MUHASEBE kernel: EIP:    0010:[<c5096ec8>]    Tainted: P

Your kernel is very, very old and tainted.

-- 
Humilis IT Services and Solutions
http://www.humilis.net
