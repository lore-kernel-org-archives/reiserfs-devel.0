From: Jeff Breidenbach <jeff@jab.org>
Subject: fast approximate file count
Date: Fri, 20 Sep 2002 22:36:23 -0700
Message-ID: <E17scwJ-0003ij-00@yodel.jab.org>
Return-path: <reiserfs-list-return-11513-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com


Didn't see this one on the FAQ.

Now that I have millions of small files on my reiserfs partition, I'd
like to know if there is reiserfs specific way to count them very
quickly.

While "find $DIR | wc -l" works and is quite accurate, it can take an
enormously long time. While "df" and dividing by a guesstimate of
the average file size is fast, I wonder if there is a way to do
better. Is there a prgram that can take advantage of reiserfs
specific metadata and quickly compute an approximate file count?
Especially if the directory tree structure is very shallow?

Cheers,
Jeff
