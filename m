From: Matthew Wilcox <willy@debian.org>
Subject: Re: FIFO files
Date: Wed, 18 Jun 2003 15:28:43 +0100
Sender: <willy@www.linux.org.uk>
Message-ID: <20030618142843.GP24357@parcelfarce.linux.theplanet.co.uk>
References: <20030617162127.GA14124@chepelov.org> <3EEF40B3.6000300@gmx.net> <3EEF42B6.1000409@namesys.com> <3EEF4929.20503@gmx.net> <20030618061721.GA15283@namesys.com> <20030618102057.GA22264@vestdata.no> <3EF04F96.7030406@gmx.net> <1055944386.27851.7.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14605-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1055944386.27851.7.camel@passion.cambridge.redhat.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>
Cc: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>, Ragnar =?iso-8859-1?Q?Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>, Oleg Drokin <green@namesys.com>, Hans Reiser <reiser@namesys.com>, Cyrille Chepelov <cyrille@chepelov.org>, reiserfs-list@namesys.com, linux-fsdevel@vger.kernel.org

On Wed, Jun 18, 2003 at 02:53:07PM +0100, David Woodhouse wrote:
> I want to implement this for JFFS2 but refused to do it with an ioctl;
> it can be done through something non-fs-specific or not at all. As soon
> as there's a non-bletcherous way to expose it to the user, I'll be
> implementing it.

irix uses an fcntl to do it, but i see no reason to copy bad interface
design.  a new syscall would seem appropriate.

has anyone analysed this for races?  are they the same as the ones for
truncate?  (i suspect they aren't).  what are the semantics of another
thread or process reading from a block that's been punched out?  what are
the semantics of another thread or process writing to a block that gets
punched out?  what are the semantics of another thread or process that
has this region of the file mmaped?  what are the semantics if this
thread has it mmaped?  what if two threads try to punch out overlapping
regions simultaneously?  what if a region is being truncated and punched
out at the same time?

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
