From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Clean datalogging patch set for 2.4.21-pre6 (-aa)/-pre7 ?
Date: Sun, 6 Apr 2003 10:14:48 +0200
Message-ID: <200304061014.48917.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13598-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS List <reiserfs-list@namesys.com>

I'm running the below on-top of 2.4.21-pre6-jam1 (-aa).
Some handwork needed.

03-2.4.21-pre6-relocation-6.diff
04-reiserfs-sync_fs-1.diff
05-2.4.21-pre6-data-logging-36.diff
08-2.4.21-pre6-reiserfs-quota-26.diff
09-kinoded-8.diff
11.dirty-inodes-for-kinoded.diff
search_reada-4.diff

except (to many rejects):
iget5_locked_for_2.4.21-pre5-datalogging.diff

Thanks,
	Dieter
