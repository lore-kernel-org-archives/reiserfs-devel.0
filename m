From: Gregor Zeitlinger <zeitling@informatik.hu-berlin.de>
Subject: Reiser4 as positional B-Tree
Date: Mon, 3 Nov 2003 21:12:07 +0100 (CET)
Message-ID: <Pine.LNX.4.33.0311032059251.3088-100000@mitte.informatik.hu-berlin.de>
Reply-To: Gregor Zeitlinger <gregor@zeitlinger.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15966-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs mailing list <reiserfs-list@namesys.com>

Hi,

I've already been on this mailing list a year ago. I was wondering wheater
I could make my native xml database a file plugin in reiser4.

Now, that the code base is much more matured and that reiser4 is almost
ready (as I understand), this seems much more feasable.

Those are my questions
1) As part of my xml database, I still need a positional B-Tree. Since
files in reiserfs are stored in a (kinda) B+-Tree, I was wondering wheater
a positional B-Tree could be made a file plugin. It's basically the same
as the unix file plugin, with the exception that you'd need the additional
operation of inserting (not overwriting) data in the middle of a file.

2) If the plugin architecture is flexible enough, I'm wondering wheater I
could port my xml database to being a file plugin. It uses a custom page
layout and custom balance, split and merge algorithms. Also, I use c++,
but the source could be ported to c, since I don't make heavy use of
object oriented features. I haven't put the source code online, since it's
not mature enough for that, but I can give to anyone interested.

-- 
Gregor Zeitlinger
gregor@zeitlinger.de


