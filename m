From: Szakacsits Szabolcs <szaka@sienet.hu>
Subject: Re: Marking bad blocks
Date: Mon, 21 Jul 2003 00:59:08 +0200 (MEST)
Message-ID: <Pine.LNX.4.30.0307210002150.22903-100000@divine.city.tvnet.hu>
References: <3F1A5E0E.6070505@edsons.demon.nl>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14972-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F1A5E0E.6070505@edsons.demon.nl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rudy L. Zijlstra" <rudy@edsons.demon.nl>
Cc: Whit Blauvelt <whit@transpect.com>, reiserfs-list@namesys.com


On Sun, 20 Jul 2003, Rudy L. Zijlstra wrote:

> In my experience, you are courting a great amount of data loss.

Considering Whit's disk is old and the bad sectors are new, quite probably.

   [... nice harddisk history summary ...]

I've believed the same on the current state. Until I wrote ntfsresize and
it started its life one year ago. I marked 'bad block handling' the lowest
priority but never really planned to implement it, you explained why. NTFS
keeps a list of bad sectors and ntfsresize only checks its presence and
refuses to make the modifications if the disk is "dying".

The problem, it appears there is a decent number of disks leaving the
factories nowaday already having bad sectors (in short, no hidden cylinders
or they are full). Users claim disk remains stable, no new bad sectors with
time and most of them aren't even willing to replace it. Just like in the
early 80's. So in the end, I "had to" write the code.

	Szaka

