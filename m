From: Oleg Drokin <green@namesys.com>
Subject: Re: LVM array, one disk failed
Date: Mon, 6 Jan 2003 10:01:57 +0300
Message-ID: <20030106100157.A1881@namesys.com>
References: <1041044851.5964.32.camel@ganga> <20021228113942.A6599@namesys.com> <1041545041.13918.7.camel@ganga>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12270-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1041545041.13918.7.camel@ganga>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tuomas Jormola <tjormola@cc.hut.fi>
Cc: reiserfs-list@namesys.com

Hello!

On Fri, Jan 03, 2003 at 12:04:01AM +0200, Tuomas Jormola wrote:

> > If you do not plan to add anymore drives or if you just don't have
> > spare drive, you probably can run reiserfsck --rebuild-sb and after
> > couple of questions it will write updated superblock that
> > respects changed filesystem size (actually for this to work you first need
> > to tell your LVM to report current volume size that is now shorter
> > than it was at creation time).
> reiserfsck says
> Reiserfs with standard journal found, but there was specified a journal dev
> I guess guess it's bad thing :/

Try with reiserfsprogs-3.6.5-pre1

Bye,
    Oleg
