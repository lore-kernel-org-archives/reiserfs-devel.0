From: Oleg Drokin <green@namesys.com>
Subject: Re: access beyond end of device again
Date: Mon, 24 Jun 2002 18:49:48 +0400
Message-ID: <20020624184948.B896@namesys.com>
References: <1951319530634.20020624073524@redefine.org> <20020624183557.A2171@namesys.com> <20020624144501.GA28013@matrix.wg>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10818-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020624144501.GA28013@matrix.wg>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dirk Mueller <dmuell@gmx.net>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Jun 24, 2002 at 04:45:01PM +0200, Dirk Mueller wrote:

> >    Do you get these during normal operations? 
> >    Then it seems some of unformatted pointers were corrupted and you need
> >    to run reiserfsck to clear these.
> most lilely the partition is indeed to small (played with fsck lately ?)

reiserfs does not allocates any blocks past the partition size,
so I cannot even imagine what are you speaking about ;)

Bye,
    Oleg
