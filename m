From: Andreas Moroder <andreas.moroder@sb-brixen.it>
Subject: remount with open files
Date: Tue, 18 Jul 2006 08:40:22 +0200
Message-ID: <e9hvov$4dt$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29056-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hello,

we have a SLES8 system with kernel 2.4.19-64GB-SMP and would like to add 
ACLs to the files system. As far as I can see the ACL options are 
compoled into the kernel. Is it possible to add the acl option to the 
/etc/fstab entry and then remount the filesystem with -o remount even 
with open files ?

When the remount is done do I have to starta another program or so or is 
this all I have to do ?

Thanks
Andreas

