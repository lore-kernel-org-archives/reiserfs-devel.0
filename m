From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH] new data logging and quota patches available
Date: 12 Mar 2003 08:41:19 -0500
Message-ID: <1047476478.8215.517.camel@tiny.suse.com>
References: <1046922372.2161.275.camel@tiny.suse.com>
	 <3E66C88E.40207@mb.tu-ilmenau.de> <3E69FA70.5030601@mb.tu-ilmenau.de>
	 <1047227975.8215.150.camel@tiny.suse.com>
	 <3E6B74C0.5050702@mb.tu-ilmenau.de>
	 <1047230647.8219.161.camel@tiny.suse.com>
	 <3E6B7C61.9050405@mb.tu-ilmenau.de>
	 <1047415578.8215.383.camel@tiny.suse.com>
	 <20030312103800.A9291@namesys.com>
	 <1047475349.8219.499.camel@tiny.suse.com>
	 <20030312162850.A1840@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13223-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030312162850.A1840@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>, reiserfs-list <reiserfs-list@namesys.com>

On Wed, 2003-03-12 at 08:28, Oleg Drokin wrote:

> 
> > then it really only helps on long sequential reads.
> 
> That's true, but it made no difference for you on SCSI for sequentional reads too.

That's true, we were comparing your IDE drive results with my scsi for
reading a single big file.  It probably didn't help for the single big
file because of the page cache readahead triggering parallel tree
searches.

But Manuel's test is different, it's doing a long sequential read of
multiple files.  The page cache code only does readahead on one file at
a time, reading fileA won't trigger a parallel read of the indirect
items for fileB.  search_reada will work better in that case, since it
will grab indirect items for fileB.

Also, it will do readahead on the directory items, probably making
directory scanning faster.

-chris


