From: Randy Hron <rwhron@earthlink.net>
Subject: mkreiserfs -q
Date: Tue, 2 Apr 2002 08:39:00 -0500
Message-ID: <E16sOPz-0005lr-00@gull.prod.itd.earthlink.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Sometimes I have to create a reiserfs filesystem over a dialup
or serial connection.   mkreiserfs on a large filesystem prints
almost 1 meg of output.  I work around this by redirecting
mkreiserfs output to a file.  

The -q option in reiserfsck has been a huge timesaver when
on serial line.  On a serial/dialup line, -q means both quick and quiet.

It would be nice to see a -q option for mkreiserfs too. :)





