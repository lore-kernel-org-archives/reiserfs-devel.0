From: Philippe =?ISO-8859-1?B?R3JhbW91bGzp?= <philippe.gramoulle@mmania.com>
Subject: Still wrong reported file size after --rebuild-tree
Date: Wed, 30 Oct 2002 19:30:45 +0100
Message-ID: <20021030193045.69179289.philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11843-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs <reiserfs-list@namesys.com>

Hi,

I just wanted to let you know that after rebuilding the tree for a 500Go
volume, i still have wrong file size reported :

/dev/sdb1            572418604 174714996 397703608  31% /storage

# ls -l
total 4928006
-r-x-wx-wx    1 daemon   324231      32768 Jan  1  1970 25s.jpg
-r-x--x---    1 19415372 19415373 83388383504122186 Aug 13  1970 25s_lb.jpg
-r--rw-rw-    1 19415354 19415355 83388306194710840 Aug 13  1970 25slight.jpg
-r---wxrwx    1 19415331 19415332 83388207410463009 Aug 13  1970 25slight_ln.jpg
-rw-rw-r--    1 500      500         19616 Dec 13  2000 AnLake.class
-rw-rw-r--    1 500      500         12576 Dec 13  2000 AnLake.jar
-rw-rw-r--    1 500      500          2251 Dec 13  2000 Lware.class
-r----x-w-    1 19415310 19415311 83388117216149772 Aug 13  1970 anfy.class
-rw-rw-r--    1 500      500          5699 Dec 13  2000 anlake.txt
-rw-rw-r--    1 500      500          1963 Dec 13  2000 chesterfield.htm
-rw-rw-r--    1 500      500         21143 Dec 13  2000 filter.jpg

I'll make metadata available as soon as debugreiserfs is finised.
(reiserfsck used was 3.6.4 ( 3.6.4 pre3)

Thanks,

Philippe.
