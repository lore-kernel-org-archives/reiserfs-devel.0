From: Bill Rees <mtfbwy_1968@yahoo.com>
Subject: Degrading performance?
Date: Wed, 10 Apr 2002 10:25:02 -0700 (PDT)
Message-ID: <20020410172502.29765.qmail@web10006.mail.yahoo.com>
Reply-To: bill@billrees.com
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10014-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi,

I've got a appication I'm testing that writes millions
of 15K files to an 800gb raidset (5x160 gb Maxtor
drives on a 3ware 7450 controller).  The basic format
of the directory structure is as follows:

/partition/00/yyyymmdd/hhmm/file1 (15k)
/partition/00/yyyymmdd/hhmm/file2 (15k)
/partition/00/yyyymmdd/hhmm/file3 (15k)
.
.
.
/partition/00/yyyymmdd/hhmm/file1800 (15k)

Where yyyymmdd is a date and hhmm is a time.  My test
program simulates a production system.  I'm writing
1800 files filled with nulls as fast as my CPU will
allow for each subdirectory in an effort to fill the
raidset.

I compute the time in milliseconds that it takes to
fill a directory with the 1800 files.  As the disk
fills, the number of megabytes the application can
write per second gradually degrades from around 8.5
mb/sec when the disk is 2% full to 1.3 mb/sec at 23%
full.  I tried the same test on a single 160gb disk
and, although the performance was a bit better, the
degradation is still there.  A single 160gb formatted
with ext2 does not seem to show this gradual
degradation.

Does this sound like normal behavior and does anyone
have a suggestion on what could be done to optimize
this?  My production application can handle multiple
partitions so I could break up the 800gb raid.

Any help or suggestions would be appreciated.

Bill





=====
Bill Rees - bill@billrees.com - http://billrees.com

__________________________________________________
Do You Yahoo!?
Yahoo! Tax Center - online filing with TurboTax
http://taxes.yahoo.com/
