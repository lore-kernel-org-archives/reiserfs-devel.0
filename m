From: Manuel Krause <manuelkrause@netscape.net>
Subject: Debugreiserfs Security Question (3.6.7-pre1)
Date: Fri, 20 Jun 2003 04:24:01 +0200
Message-ID: <3EF27041.6060401@netscape.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14637-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list <reiserfs-list@namesys.com>

Hi!

If I currently use debugreiserfs -p  /dev/xxx | gzip -c > xxx.gz and
later for testing gunzip -c xxx.gz | unpack /dev/yyy  I get the same
filenames on the last target partition. (with reiserfsprogs 3.6.7-pre1)


If I don't want to spread info about
  /home/manuel/my_car/tech_overview/lies_for_BMW_&_DC/engine.259.fake.jpg
anywhere else than only on my HDD, shouldn't this file be converted to
  /d98/d4/d2/d65/d1/23.file
e.g., or something like that (random directory & filenames) within
debugreiserfs, in general?!

I don't know if that is a serious security issue. But it is one.

No no, I don't doubt your developers' debugging cyle and purpose at all.
But I don't need you (and others if we couldn't establish a secure
connection) to read our filenames. In case of real failure we may not
be able to rename anything any more, you know..


Best regards,

Manuel Krause


(The filenames mentioned above have NO real meaning in ANY sense.)

