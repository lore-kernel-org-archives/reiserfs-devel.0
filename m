From: Marko Asplund <aspa@kronodoc.fi>
Subject: tuning a fs for large number of small files
Date: Wed, 6 Nov 2002 14:45:05 +0200 (EET)
Message-ID: <Pine.LNX.4.44.0211061437070.2873-100000@gamay.kronodoc.fi>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11929-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com


i'm testing the performance of an ext3 filesystem which has become
painfully slow on ReiserFS. the filesystem has a large number of small
files (~ 2 million) and a many directories (~ 1 million). is there
something i can do to tune the ReiserFS filesystem in this case e.g. by
selecting a specific hash funtion to use?

best regards,
-- 
	aspa


