From: "darren" <teodarren@myrealbox.com>
Subject: strange problems with simultaneous NFS and CIFS mount to reiserfs
Date: Thu, 9 Dec 2004 23:56:50 +0800
Message-ID: <200412091558.iB9FwuNQ018650@eastgate.starhub.net.sg>
References: <pqjtltdza]@bigfoot.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22731-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <pqjtltdza]@bigfoot.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I have this strange problem that occurs at one of my NFS client.

Setup (3 PCs)

A) Win2000 (mounting to //C/test] vis CIFS)
B) RedHat 7.3 (mounting to C:/test via NFS)
C) Redhat 7.3 sharing /test (reiserfs partition shared via nfsd and smbd)

Computer A produces DB summaries (sum.xml) and a log file (ops.log) every
half hour into //C/test. The movement of the files into C is done via the
MFC command "MoveFileEx".

Computer B will then read both files and delete them.

Problem:
Computer B is sometimes not able to find sum.xml. Running ls on the mounted
file (c:/test) gives me the following error

"ls - sum.xml file not found		ops.log"

This problem only occurs via the NFS mount but not CIFS from computer B.

Is there a consistency/coherence problem when 2 different network
filesystems mount to 1 reiserfs partition?

