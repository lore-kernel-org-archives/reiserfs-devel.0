From: "Steve Pratt" <slpratt@us.ibm.com>
Subject: Online resize
Date: Fri, 19 Jul 2002 09:01:25 -0500
Message-ID: <OF4A0C85A9.BB67F078-ON85256BFB.004CD26A@pok.ibm.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11059-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

I somehow overlooked ReiserFS's ability to do online expand when I wrote
the EVMS FSIM.  I would like to correct that problem.  Are there any
restrictions as to when this can or can't be performed?  Is there any
minimum utility level that know to invoke the remount?   If not, it will be
simple to add.

Steve

EVMS Development - http://www.sf.net/projects/evms
Linux Technology Center - IBM Corporation
(512) 838-9763  EMAIL: SLPratt@US.IBM.COM


