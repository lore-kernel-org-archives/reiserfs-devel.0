From: Guillermo Torreiro <gtorreiro@yahoo.com>
Subject: What is reiserfsck telling me?
Date: Sun, 23 Feb 2003 10:14:51 -0800 (PST)
Message-ID: <20030223181451.28117.qmail@web9807.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12876-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list <reiserfs-list@namesys.com>

Hi!

I run reiserfsck to check a partition and this
happened:

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.x.1b

Will read-only check consistency of the filesystem on
/dev/hda7
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to
type Yes):Yes
###########
reiserfsck --check started at Sun Feb 23 11:28:32 2003
###########
Replaying journal..
0 transactions replayed
Checking S+tree../ 27 (of  40)/ 37 (of 170)
pass_through_tree: unable to read 11434 block on
device 0x3



Aborted

<---END :)---->

So... ok, I got a problem there with block 11434, I
can't read it, but why? what is that mean? block 11434
turned to be a bad block? Can I find a work around to
this so I could get to read that block? Anyone can
explain that to me? How do I proceed with this kind of
problems?

Best Regard,

Guillermo

__________________________________________________
Do you Yahoo!?
Yahoo! Tax Center - forms, calculators, tips, more
http://taxes.yahoo.com/
