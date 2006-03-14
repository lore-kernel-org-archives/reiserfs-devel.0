From: Alain Knaff <alain@knaff.lu>
Subject: fatal "not directory found" error at pass 3a of reiserfsck
Date: Tue, 14 Mar 2006 16:51:09 +0100
Message-ID: <4416E66D.4020500@knaff.lu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28251-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

We have a corrupted reiserfs filesystem here which can't even be repaired with 
--rebuid-tree.

The error messages happens at pass 3a:


Pass 3a (looking for lost dir/files):
####### Pass 3a (lost+found pass) #########
Looking for lost directories:
lost+found.c 116 _look_for_lost
not directory found
Aborted


What can we do to retrieve our files?

Thanks,

Alain
