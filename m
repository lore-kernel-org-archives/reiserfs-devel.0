From: Sam Vilain <sam@vilain.net> (by way of Sam Vilain <sam@vilain.net>)
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Fri, 14 Feb 2003 13:18:33 +1300
Sender: Sam Vilain <sv@vilain.net>
Message-ID: <200302141318.33057.sam@vilain.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12750-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Zygo Blaxell <eazgwmir@umail.furryterror.org>
Cc: reiserfs-list@namesys.com

On Thu, 13 Feb 2003 16:42, Zygo Blaxell wrote:
> Last time I checked, Windows and Mac OS come to a near total halt when
> they see a disk error while doing a write on non-removable media, unles=
s
> the application goes to extraordinary lengths to handle the error
> itself.

Perhaps it might, but it sure does a good job of cleaning them up with
ScanDisk.  And it almost certainly won't BSOD for a bad sector.

My experience is that it partially hangs the system while it retries the
write, but eventually comes back and the application either has died or
returns an error.  I actually think it's comparitively graceful.  I mean,
Windows might crash if you sneeze at it for no reason whatsoever, but it
handles disk errors quite well most of the time.  Baby's First FileSystem
(FAT) just doesn't have any structure to lose, which sure makes it
resilient.  Even if you get a bad block in the FAT it survives, because
there are two copies of it!

Windows doesn't handle resetting the IDE bus when it needs it very well,
I've seen one disk that didn't work in Windows but worked passably in
Linux because of this.  Of course it died a few months later :-).
--
Sam Vilain, sam@vilain.net

Real software engineers like C's structured constructs, but they are
suspicious of it because they have heard that it lets you get "close
to the machine."
