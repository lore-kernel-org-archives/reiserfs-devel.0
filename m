From: Cami <camis@mweb.co.za>
Subject: --rebuild-tree
Date: Tue, 06 Jul 2004 09:15:31 +0200
Message-ID: <40EA5193.2040604@mweb.co.za>
References: <200407060828.56801.aotto1968@onlinehome.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19522-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200407060828.56801.aotto1968@onlinehome.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi All,

Last night i done monthly maintence on all of my
mailhosts and after doing a reiserfsck, it looks
like i'll have to rebuild the tree on one of my
mail clusters (the other 8 clusters were fine)..

[mailhost01][/root]# df -h
Filesystem            Size  Used Avail Use% Mounted on
/dev/emcpowera1       152G   35G  117G  23% /var/spool/virtual

Can anyone tell me roughly how dangerous this is
and roughly how long something like this will take?
The filesystem stores all the users mailboxes in
maildir format so there are millions of files..

Any tips/comments would be appreciated..

Regards,
Cami

