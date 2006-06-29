From: "Diego Pinheiro" <diegopp@Safe-mail.net>
Subject: Reiser4 on top of software raid 1 - synchronous write "problem"?
Date: Thu, 29 Jun 2006 17:44:21 -0400
Message-ID: <N1-SucH3Ugv3E@Safe-mail.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28865-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi all,

I got a ZAM-1055 "disable_write_barrier", "using synchronous write" notice when trying to use a reiser4 on top of a software raid 1 (dmraid).

I know it's just a notice, but should I experiment any performance loss because of the synchronous writes?

Thanks,
Diego

PS. kernel 2.6.16.20 with reiser4-for-2.6.16-4 patch
