From: Greg Ward <gward@python.net>
Subject: Re: Safely spinning down SCSI ReiserFS disk
Date: Mon, 28 Apr 2003 22:40:00 -0400
Message-ID: <20030429024000.GB4729@cthulhu.gerg.ca>
References: <20030426211638.GA690@cthulhu.gerg.ca>
 <20030428053150.GA22902@namesys.com> <20030429003341.GA2203@cthulhu.gerg.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-list-return-13888-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <20030429003341.GA2203@cthulhu.gerg.ca>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On 28 April 2003, I said:
> I realized that I forgot to remount all filesystems readonly, so I'll be
> sure to add that next time I give this a try.

This seems to have done the trick.  I had to bring the system to single-user
mode in order to remount / ro; I suspect syslog or some other daemon was
trying to write to / after I spun it down.  I'll post a more detailed recipe
when I'm not so tired.

        Greg
-- 
Greg Ward <gward@python.net>                         http://www.gerg.ca/
"Very funny, Scotty.  Now beam my *clothes* down."
