From: Piotr Neuman <sikkh@wp.pl>
Subject: Reiser4 journal replay stats
Date: Sat, 16 Oct 2004 22:09:12 +0200
Message-ID: <200410162209.12163.sikkh@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22078-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi

This small patch is will print out nuber of transartions replied from logs 
after a crash, quite like reiserfs 3.6 does:

http://kem.p.lodz.pl/~peter/reiser4_replay_stats.patch

Thanks to Nikita Danilov for guidance.
