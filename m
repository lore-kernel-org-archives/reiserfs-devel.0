From: Pierre =?UTF-8?B?RXRjaGVtYcOvdMOp?= <petchema@concept-micro.com>
Subject: reiserfs 3 on top of software raid 1
Date: Tue, 28 Feb 2006 00:14:51 +0100
Message-ID: <20060228001451.bc74a3d1.petchema@concept-micro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28148-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


	Hi all,

I have a question that didn't occur to me until a power failure (eh)...

When a journalized file system like reiserfs 3 runs on top on a
software raid volume, does the volume give enough (and correct)
feedback so that the file system can still guarantee that its metadata
will be in a consistant state after a power failure/crash/you name it ?

If all disks go back online ? If some don't (but below redundancy
amount, of course) ?

In short, beside disks resynching, is a fsck also necessary ?

Best regards,
Pierre.

-- 
.-- Concept Micro ------------>
| Vente, Maintenance, Conseil & Audit en micro-informatique
| email: concept-micro@concept-micro.com 
^ web: http://www.concept-micro.com/
