From: Oleg Drokin <green@namesys.com>
Subject: Re: newest libaal
Date: Mon, 19 May 2003 14:52:52 +0400
Message-ID: <20030519105252.GA1838@namesys.com>
References: <200305190011.28782.vibir@012.net.il> <3EC8985A.8040909@namesys.com> <200305191347.11211.vibir@012.net.il>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14162-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200305191347.11211.vibir@012.net.il>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Veber <vibir@012.net.il>
Cc: Yury Umanets <umka@namesys.com>, reiserfs-list@namesys.com

Hello!

On Mon, May 19, 2003 at 01:47:10PM +0300, Alex Veber wrote:
> > >whare can I get the newest version of libaal, I can compile reiser4progs
> > > from BK because I have an old version of libaal and 
> > > bk://bk.namesys.com/bk/libaal hasnt been updated for a long time now.
> > It is strange, but it is updating constantely. What is the problem you
> > are faced with?
> bk pull is not updating any files, the latest changeset is:
> ChangeSet@1.8, 2003-04-29 22:42:53+04:00, vitaly@digger.namesys.com
>   bugs in string operations were fixed

> compiling it gives me libaal-0.4.2

Well, seems that somebody forgot to set correct permissions on the repository.
Fixed.
Thanks for the report.

Bye,
    Oleg
