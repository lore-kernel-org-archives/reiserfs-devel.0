From: Oleg Drokin <green@namesys.com>
Subject: Re: Data-logging and md as / fs bug
Date: Mon, 12 May 2003 11:37:30 +0400
Message-ID: <20030512073730.GB21604@namesys.com>
References: <3EB30852.6090402@netscape.net> <200305071641.37361.christian.mayrhuber@gmx.net> <1052318606.14616.394.camel@tiny.suse.com> <200305071652.00627.christian.mayrhuber@gmx.net> <1052321005.14616.407.camel@tiny.suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14073-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1052321005.14616.407.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <mason@suse.com>
Cc: Christian Mayrhuber <christian.mayrhuber@gmx.net>, reiserfs-list <reiserfs-list@namesys.com>

Hello!

On Wed, May 07, 2003 at 11:23:25AM -0400, Chris Mason wrote:

> The right fix is probably to skip the bdget when the journal device is
> not external , and just set journal->j_dev_bd to super->s_bdev.
> Oleg/namesys, do you see any reason this won't work?

Well, this is probably the most simple solution.
The more full one would probably be to only grab journal in case of RW mount
and to release journal when remounting read-only. This way we will be able to also free
the RAM assotiated with journal that never used because the FS is readonly.
What do you think?

Bye,
    Oleg
