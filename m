From: "Scott Bragg" <jsbragg@pacific.net.au>
Subject: How not to liquidate a company... (Upgrading from 2.2.x kernel (patched) to 2.4.x. [and testimonial])
Date: Wed, 19 Jun 2002 23:58:14 -0700
Message-ID: <IOELIGOBLCIAGKOJFKMBAECDCAAA.jsbragg@pacific.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10763-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS Mailing List <reiserfs-list@namesys.com>

I've taken half an hour browsing the web site and did some quick searches in
the archive but don't have a good answer to this issue (then again I'm tired
and may have missed it. If so I apologise now).

A previous (collapsed) employer (long amusing story about how NOT to run a
company follows) been asked to rebuild a large and critical (as in it's the
only server they own now) system that I deployed myself 18 months or so ago,
before the 2.4 kernel was out so patched 2.2.16. The first disk, holding the
Linux OS has failed and for reasons explained below there is no backup.

I'd like to install a newer distribution on the system, but am not sure if
there is an issue when switching from a system using a 2.2.16 kernel patched
with ReiserFS to a 2.4.18 kernel.

Here's the situation (more detailed explanation)
Optional Reading:
=================================================

My previous employer (a speech recognition R&D co.) collapsed a year ago
where I was the IT Manager. 6 months before I had purchased a very nice
external RAID controller with a 750Gb volume (using RAID-5) to hold the
speech data used for modelling.

At the time I think there was a 2.4.0test1 kernel release, but I was adding
it to a Debian Linux box running kernel 2.2.16 (I think) and patched the
kernel to use ReiserFS (hmm.. doing an fsck on a 750Gb volume...). After a
slight issue with the SCSI driver/controller, the machine was the most
stable machine on my network. (Since then I've used ReiserFS as often as
possible).

The issue is that the company failed and was liquidated (new American
management must have gone to the same training courses as Enron/Arthur
Anderson).

The core part of the company (IP and important infrastructure) was sold to
another company who also retained 3 employees to maintain the code/database.
This company also failed (!), was liquidated and this stuff was sold to a
new company. When they moved the infrastructure, the disk inside the server
(not RAID, just SCSI) failed, but since they auctioned off the 2Tb tape
library connected to the machine, there's been no backups. Even more
laughable is they auctioned off the backup tapes (!!!)

So, I have to install Linux on a new system disk, and would like to use
Mandrake 8.1 (as I run this version on 12 systems I currently manage). So..
can I just install Mandrake 8.1 and set up the 750Gb volume in fstab with
reiserfs, or will it not be that simple?

Regards,
Scott Bragg

