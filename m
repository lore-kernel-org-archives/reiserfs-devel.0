From: "Steve Pratt" <slpratt@us.ibm.com>
Subject: A couple of questions
Date: Wed, 15 May 2002 16:22:22 -0500
Message-ID: <OFDC95E87B.B541379E-ON85256BBA.0074ED07@pok.ibm.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10315-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

A couple of questions about the ReiserFS utilities.  First, does ReiserFS
support labels or not?  FAQ says no and refers to lack of space in the 3.5
superblock. Neither 3.5 nor 3.6 superblock appear to have a label field,
but mkfs has an option for it.

Second, what is the option to keep fsck from prompting for 'Yes' when
running.  I need to exec this without additional input.  Seems like quiet
should do it, but it doesn't.

Steve

EVMS Development - http://www.sf.net/projects/evms
Linux Technology Center - IBM Corporation
(512) 838-9763  EMAIL: SLPratt@US.IBM.COM


