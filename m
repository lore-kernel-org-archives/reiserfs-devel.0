From: Chris Dukes <pakrat@www.uk.linux.org>
Subject: Re: nvram to protect fs during power loss?
Date: Fri, 31 Dec 2004 18:13:22 +0000
Message-ID: <20041231181322.GB18173@ZenIV.linux.org.uk>
References: <1062660450.20041231004008@tnonline.net> <20041231094126.GV1586@hvs.envisage.co.za> <273759260.20041231134532@tnonline.net> <20041231164620.GB1586@hvs.envisage.co.za> <ef5e15ed041231085194d6dd9@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23008-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <ef5e15ed041231085194d6dd9@mail.gmail.com>
Sender: <pakrat@ftp.linux.org.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nick Vahalik <nvahalik@gmail.com>
Cc: Spam <spam@tnonline.net>, reiserfs-list@namesys.com

On Fri, Dec 31, 2004 at 10:51:09AM -0600, Nick Vahalik wrote:
> Why not just purchase a UPS and place it on your system?  Seems like
> it be a lot cheaper.  That way the system can safely shut down in case
> of a power outage?

One would think that, then one discovers the magic of
broken UPSes.
I remember one installation where it was a mix of
machines on site power and machines on unmaintained UPSes.

There was a higher incident of power related down time on the systems
on UPSes because the UPSes hadn't had batteries replaced after
they'd been discharged too far, nor had the dust bunnies blown
out periodically.

Unfortunately UPSes and NVRAM fail to address what tends to be
the core problem.  Morons in the Machine Room.
-- 
Chris Dukes
Warning: Do not use the reflow toaster oven to prepare foods after
it has been used for solder paste reflow. 
http://www.stencilsunlimited.com/stencil_article_page5.htm
