From: cbaegert@europeanservers.net
Subject: is quota functional in 2.6.12.3 ?
Date: Thu, 18 Aug 2005 20:55:38 +0200
Message-ID: <200508182055.38674.cbaegert@europeanservers.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25556-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

I tried to use quota with ReiserFS and a stock kernel 2.6.12.3.

Everything seems to work fine, except that it doesn't work : the user can use 
as much space he wants ! However the repquota seems OK.

Any idea ?

[root@gibraltar linux-2.6.12.3]# repquota /home
*** Report for user quotas on device /dev/sda7
Block grace time: 00:00; Inode grace time: 7days
                        Block limits                File limits
User            used    soft    hard  grace    used  soft  hard  grace
----------------------------------------------------------------------
root      --  127242       0       0           4155     0     0
chris     +-   83201   10240   20480   none     320     0     0

Regards,
-- 
Christophe BAEGERT              cbaegert@europeanservers.net
