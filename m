From: "Jason Mancini" <jayrusman@hotmail.com>
Subject: Re: 640.0 GB symlink
Date: Wed, 04 Dec 2002 00:12:03 -0800
Message-ID: <F121y8PvZHRiGIWFMRJ000156b4@hotmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12105-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com


I had an issue with my RAM settings a couple
months ago (swapped in a new XP processor,
reset the BIOS, and chose 333MHz accidentally
on DDR2100...) so most likely it's from that
little incident.  I redid the symlink and
nothing exploded -- at least yet!  >=]

Thanks for such a great fs,
Jason Mancini



----Original Message Follows----
From: Oleg Drokin <green@namesys.com>

Hello!

On Tue, Dec 03, 2002 at 09:02:38PM -0800, Jason Mancini wrote:

 > Should I just erase and remake the symlink?

Yes, that would be the simpliest thing.

 > It wasn't like this in July (my last backup, *cough*).

Then somebody corrupted it, or may be even the drive itself.

reiserfsck is generally does not shorten file sizes, but symlink is really
special file, so this will be fixed for next release for sure.
May be we will even include something like that check into the kernel.

Thank you for your report.

Bye,
     Oleg


_________________________________________________________________
The new MSN 8: advanced junk mail protection and 2 months FREE* 
http://join.msn.com/?page=features/junkmail

