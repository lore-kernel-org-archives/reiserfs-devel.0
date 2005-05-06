From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Reiser4 support on parted ...
Date: Fri, 6 May 2005 10:19:25 +0400
Message-ID: <20050506061924.GI6067@backtop.namesys.com>
References: <427A0834.7080201@futuretg.com> <427A99C0.2000105@slaphack.com> <20050505221204.GC8179@gnu.org> <427AA6CF.6000505@slaphack.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23999-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <427AA6CF.6000505@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>
Cc: Andrew Clausen <clausen@gnu.org>, "Dr. Giovanni A. Orlando" <gorlando@futuretg.com>, Hans Reiser <reiser@namesys.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>

On Thu, May 05, 2005 at 06:05:51PM -0500, David Masover wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Andrew Clausen wrote:
> > On Thu, May 05, 2005 at 05:10:08PM -0500, David Masover wrote:
> > 
> >>To support doing what to Reiser4?
> >>
> >>"parted" is a disk management project -- specifically, a way to create,
> >>delete, and resize partitions.  Think of it as fdisk with nicer units
> >>and built-in resizefs tools.
> >>
> >>This would, I think, involve creating a fully functional
> >>resizefs.reiser4 -- something I distinctly remember Hans telling me not
> >>to do, because my approach also created (most of) an online repacker,
> >>which is something Hans wants to do for money.
> > 
> > 
> > It would be possible to implement mkfs and fsck support only.
> 
> Couldn't this just be a wrapper to mkfs.reiser4 and fsck.reiser4?

libreiser4 was designed to support embedding into parted easily.  The AAL lib
provides block device abstraction layer which is needed in parted.

-- 
Alex.
