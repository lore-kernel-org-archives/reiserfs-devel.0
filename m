From: Mattia Dongili <malattia@linux.it>
Subject: Re: argh! it's reiserfs deadlocking! [was: Re: JFS - real deadlock and lockdep warning (2.6.18-rc5-mm1)]
Date: Thu, 14 Sep 2006 22:30:36 +0200
Message-ID: <20060914203036.GC3963@inferi.kami.home>
References: <20060905203309.GA3981@inferi.kami.home> <1157580028.8200.72.camel@kleikamp.austin.ibm.com> <20060907184930.GA13380@inferi.kami.home> <45095C58.5020106@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29890-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <45095C58.5020106@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Mahoney <jeffm@suse.com>
Cc: Dave Kleikamp <shaggy@austin.ibm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, akpm@osdl.org, reiserfs-dev@namesys.com, reiserfs-list@namesys.com

n Thu, Sep 14, 2006 at 09:42:48AM -0400, Jeff Mahoney wrote:
> Mattia Dongili wrote:
> > On Wed, Sep 06, 2006 at 05:00:28PM -0500, Dave Kleikamp wrote:
> >> I meant to reply to this earlier.  I've had a lot of distractions.
> >>
> >> On Tue, 2006-09-05 at 22:33 +0200, Mattia Dongili wrote:
> >>> Hello,
> >>>
> >>> as the subject says it's some time[0] I'm experiencing deadlocks[1] (I'm
> >>> only tracking -mm, and sporadically using the stable series). I have a
> >>> couple of use cases that seem to reliably trigger the deadlock, namely
> >>> using Eclipse and Firefox.
> > [...]
> >>> /dev/hda1 on / type reiserfs (rw)
> >>> /dev/hda3 on /usr type reiserfs (rw)
> >>> /dev/hda5 on /home type jfs (rw)
> >>>
> >>> bootlog: http://oioio.altervista.org/linux/dmesg-2.6.18-rc5-mm1-lockdep
> >>> config: http://oioio.altervista.org/linux/config-2.6.18-rc5-mm1-lockdep
> > 
> > Dave,
> > 
> > I have to apologize. Reiser3 seem to be the one deadlocking here
> > actually. Changing /home to reiser4 still deadlocks.
> > 
> > Now, reiserfs-developers:
> > would you want me to keep the filesystem around to try to test patches
> > or potential fixes or can I wipe it out?
> > The good thing is that the deadlock is 100% repeatable, the bad thing is
> > that this laptop has a broken cdrom and I have to take the drive out and
> > fsck it via usb1.1 each time. :)
> > 
> > Thanks
> 
> 
> How is it that you arrived on reiser3 and reiser4 deadlocking here?

oh, no that's not what I said.

I had:

/dev/hda1 on / type reiserfs (rw)
/dev/hda3 on /usr type reiserfs (rw)
/dev/hda5 on /home type jfs (rw)

the deadlock was there. I then changed to

/dev/hda1 on / type reiserfs (rw)
/dev/hda3 on /usr type reiserfs (rw)
/dev/hda5 on /home type reiser4 (rw)

still deadlocking, so it wasn't jfs but reiserfs.

Anyway I wiped out the reiserfs partitions, it was starting to become
really annoying sorry.

-- 
mattia
:wq!
