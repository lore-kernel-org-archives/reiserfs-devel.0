From: Chris Mason <mason@suse.com>
Subject: Re: Data-logging and md as / fs bug
Date: 07 May 2003 10:43:27 -0400
Message-ID: <1052318606.14616.394.camel@tiny.suse.com>
References: <3EB30852.6090402@netscape.net>
	 <200305062253.11535.christian.mayrhuber@gmx.net>
	 <1052310840.14616.344.camel@tiny.suse.com>
	 <200305071641.37361.christian.mayrhuber@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13987-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200305071641.37361.christian.mayrhuber@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On Wed, 2003-05-07 at 10:41, Christian Mayrhuber wrote:

> /dev/md0 is reiserfs mounted / and /dev/md1 is swap space, messages are from a
> Debian woody system. /dev/md0 needs to resync after reboot.
> /dev/md0 consists of hda1 and hdc1
> /dev/md1 consists of hda2 and hdc2
> The
> Here's the output from the failed shutdown:
> 
> Stopping RAID devices: md: md0 still in use
> /dev/md0: Device or resource busy

Interesting, I think I understand it.  You don't any warnings about
failures while unmounting /, right?

-chris


