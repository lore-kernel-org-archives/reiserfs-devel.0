From: Chris Mason <mason@suse.com>
Subject: Re: Error Code 255 and "Permission Denied"
Date: 06 May 2002 21:53:42 -0400
Message-ID: <1020736422.988.74.camel@tiny>
References: <scd69d55.074@gwd.albion.edu> 
	<3CD725AC.6000708@mb.tu-ilmenau.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10272-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <3CD725AC.6000708@mb.tu-ilmenau.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Cc: Daniel Christiansen <christiansen@albion.edu>, Oleg Drokin <green@namesys.com>, reiserfs-list <reiserfs-list@namesys.com>

On Mon, 2002-05-06 at 20:54, Manuel Krause wrote:
> On 05/06/2002 09:12 PM, Daniel Christiansen wrote:
> 
> > Everything seems to work by using the 3.x.1b version of reisfsck with
> > --rebuild-tree.  Thank you very much, Oleg, for taking the time to solve
> > my problem.
> > 
> > I don't know anything about the "write cache enabled" issue below.  Is
> > this something I have to change with a jumper, a bios setting, or a
> > software configuration?
> > 

Most new IDE drives have this on by default.  You can turn it off with
hdparm -W 0, which will make you more able to withstand power failures.

> 
> Or is it somekind of connected to Chris Masons thread "2.4.19-pre7 / 
> corruption on unwanted reboot"??? If Chris and Jens found bugs on IDE 
> interaction with ReiserFS they should really put out a patch soon... ;-)
> 
> Chris M.? Is that related eventually? Just a doubt!

I haven't been able to reproduce problems after a crash with pre7, but
Dirk is not often wrong when we reports about a bug.  If anyone can
reliably reproduce I'd be grateful.

-chris


