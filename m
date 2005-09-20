From: Andreas Moroder <andreas.moroder@sb-brixen.it>
Subject: kreiserfsd in status DW
Date: Tue, 20 Sep 2005 09:13:46 +0200
Message-ID: <dgocrb$9hu$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26112-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hello,

this morning we find our machine with many processes in disk-sleep mode.
They all try to write to one disk but they seem to wait forever.

Even kreiserfsd has status DW.
Is it possible to recover from this situation on do we need to reboot 
the machine ?

Our Kernel is 2.4.19-64GB-SMP ( SLES 8 )

Thanks
Andreas

