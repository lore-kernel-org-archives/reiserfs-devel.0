From: Chris Dukes <pakrat@www.uk.linux.org>
Subject: Re: Rapid system transfers
Date: Sat, 20 Mar 2004 02:49:11 +0000
Sender: <pakrat@www.linux.org.uk>
Message-ID: <20040320024911.GA30755@parcelfarce.linux.theplanet.co.uk>
References: <20040320015410.GB10665@mrball.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17337-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040320015410.GB10665@mrball.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Fri, Mar 19, 2004 at 05:54:10PM -0800, Todd Lyons wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Recently we've had the need to move a few machine instances from one
> physical machine to a more powerful machine.  These machines use Reiser
> (an old version, don't know exactly which one, but it's probably RH 8.0)
> because a portion of the fs contains a lot of small files.  It requires
> us to basically bring the system down (database) and rsync it over to
> another box.  On boxes where we have ext3 filesystems, we can do
> dump/restore and have the systems up and running in a couple of hours.
> We don't have the same luxury with this Reiser system.  rsyncing a few
> million files (100 GB) across a 100 Mbit link is much slower than a
> comparable dump/restore.
> 
> What do others do to handle this situation?  Are there tools and
> utilities out there that I'm not aware of?

If most of the files remain unchanged, I'd make an initial copy
with cpio while things are running and use rsync to copy the changes
while the database is shut down.

(cpio is somewhat faster for initial copy.  rsync is much better
for copying the changes).
Worked great for backing up clearcase VOBs.
You can test the timing while things are still in production.


-- 
Chris Dukes
Been there, done that, got the slightly-charred t-shirt. -- Crowder
