From: Oleg Drokin <green@namesys.com>
Subject: Re: Mounting reiserfs with nonstandard journal size fails
Date: Thu, 31 Oct 2002 08:43:37 +0300
Message-ID: <20021031084337.C1017@namesys.com>
References: <1035934581.1487.1409.camel@rivendell.arnor.net> <20021030093911.B5560@namesys.com> <3DC04F39.1030709@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11850-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3DC04F39.1030709@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Torrey Hoffman <thoffman@arnor.net>, Linux Kernel <linux-kernel@vger.kernel.org>, Reiserfs List <reiserfs-list@namesys.com>

Hello!

On Thu, Oct 31, 2002 at 12:29:29AM +0300, Hans Reiser wrote:
> >>I'm having trouble mounting a reiserfs filesystem created with a
> >>nonstandard (smaller) journal size.  But if I use the default journal
> >>size, it works fine.
> >Sure. Non-standard journal is only supported in 2.5 kernel for now.
> That should be in the queue for the next pre1, yes?

Yes. Also lots of other stuff which we, unfortunatelly have not
put in 2.5, too.

Bye,
    Oleg
