From: Chris Mason <mason@suse.com>
Subject: Re: Re: [PATCH CFT] tons of logging patches
Date: 17 Jun 2002 15:04:39 -0400
Message-ID: <1024340679.18666.36.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10761-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <3D0D2DEE.7080909@mb.tu-ilmenau.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>, tomlins@cam.org
Cc: reiserfs-list <reiserfs-list@namesys.com>

On Sun, 2002-06-16 at 20:31, Manuel Krause wrote:

> > 
> > Hmmm, I might have found it, but this isn't a new bug to the 07 patch. 
> > Have you been able to reproduce, or have you fallen back to the older
> > patches?
> > 
> 
> You mean 03-beta-data-logging-7.diff.gz when saying "07 patch"? Then I 
> didn't go back according to my disk content.
> 

I've uploaded 03-beta-data-logging-8.diff.gz.  It will fix the oops Ed
hit, and hopefully your corruption problem as well.

-chris

