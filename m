From: Chris Mason <mason@suse.com>
Subject: Re: udpated data logging available
Date: 25 Jun 2003 21:47:47 -0400
Message-ID: <1056592066.20899.10.camel@tiny.suse.com>
References: <1055764071.24111.650.camel@tiny.suse.com>
	 <200306231853.04098.christian.mayrhuber@gmx.net>
	 <1056568529.10097.135.camel@tiny.suse.com>
	 <200306260216.41204.christian.mayrhuber@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14701-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200306260216.41204.christian.mayrhuber@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Cc: reiserfs-list@namesys.com

On Wed, 2003-06-25 at 20:16, Christian Mayrhuber wrote:
> Am Mittwoch, 25. Juni 2003 21:15 schrieb Chris Mason:
> > Thanks for giving things a try.  I just uploaded io-stalls-7.diff, which
> > should do better at fixing latency during heavy io.
> >
> > -chris
> 
> My feeling is that io-stalls-6 is where standard 2.4.21 was if it comes down to latency.
> But io-stalls-7 makes a big improvement for me during heavy io. The directory listing
> in Konqueror, including image preview, appears nearly immedeately even during heavy io. 

Great to hear, thanks for giving it a try.  io-stalls-6 helped most when
you've got multiple devices and a streaming write to one was slowing
down all the others.  -7 added in a tweaked form of Andrea's elevator
latency fixes, and they make a big difference when there's a lot of
writes to the drive you're trying to read from.

Hopefully we'll be able to hash out something suitable for 2.4.22-pre.

-chris


