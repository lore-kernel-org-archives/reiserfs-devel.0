From: Robert Brockway <robert@timetraveller.org>
Subject: Re: Problem with my HDD
Date: Thu, 30 May 2002 15:49:15 +1000 (EST)
Message-ID: <Pine.LNX.4.44.0205301547280.22928-100000@avon.timetraveller.org>
References: <20020530091410.B3922@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10447-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020530091410.B3922@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: Cookie-Monster <cookie.monster@starfall.de>, reiserfs-list@namesys.com

On Thu, 30 May 2002, Oleg Drokin wrote:

> Hello!
> 
> On Thu, May 30, 2002 at 09:45:50AM +1000, Robert Brockway wrote:
> 
> > If you can I'd consider getting an image of the drive.  It may help with 
> > data recovery later.  something like:
> > dd if=/dev/sda1 of=/bigfilesystem/diskimage
> 
> That does not work on bad hard drives, resulting image would be almost useless.
> BTW, this way it stops on first read error.

Yeah, I know but I figure that a partial recovery is better than none at 
all.  You could always go through a binary dump or pay $$$ for a 
professional data recovery group to do a professional job of it.
Cheers,
	-Rob

-- Robert Brockway B.Sc. email: robert@timetraveller.org  ICQ: 104781119
   Linux counter project ID #16440 (http://counter.li.org)
   blake: up 1 day,  3:50,  4 users,  load average: 0.49, 0.47, 0.61
   "The earth is but one country and mankind its citizens" -Baha'u'llah

