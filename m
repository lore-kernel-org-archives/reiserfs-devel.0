From: "Ramy M. Hassan" <ramy@gawab.com>
Subject: NFS issues
Date: Sun, 28 Mar 2004 01:35:46 +0200
Message-ID: <000201c41454$401eb860$50bc723e@ramy>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17529-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I am currently using xfs on a very busy NFS server where stability, and
performance are the main concerns. I started to benchmark reiser3 and
found it outperforming xfs when I tune the file size to the average file
size in my system ( my system deals with too many writes of relatively
small files ). Apparently I will gain performance if I moved to reiser3,
but I read on the web that there are data corruption problems when
reiser is used with NFS, Is that fixed or not yet?

Thanks in advance



