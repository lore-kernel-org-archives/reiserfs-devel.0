From: Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 21:28:41 +0300
Message-ID: <200408262128.41326.vda@port.imtp.ilyichevsk.odessa.ua>
References: <Pine.LNX.4.44.0408261356330.27909-100000@chimarrao.boston.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20753-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.44.0408261356330.27909-100000@chimarrao.boston.redhat.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rik van Riel <riel@redhat.com>, Linus Torvalds <torvalds@osdl.org>
Cc: Diego Calleja <diegocg@teleline.es>, jamie@shareable.org, christophe@saout.de, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

On Thursday 26 August 2004 20:57, Rik van Riel wrote:
> On Thu, 26 Aug 2004, Linus Torvalds wrote:
> > > So all I need to do is "cat /bin | gzip -9 > /path/to/backup.tar.gz" ?
> >
> > No no. The stream you get from a directory is totally _independent_ of
> > the contents of the directory. Anything else would be pointless.
>
> It's a relief to know that nobody's taking my humorous
> suggestion seriously, but now we still have the "standard
> Unix tools can't manipulate files" problem...

Is it possible to sufficiently hide "dirs inside files"
so that old tools will be unable to see them?

I just checked:

ls -d /foo  does lstat64("/foo", ...)
ls -d /foo/ does lstat64("/foo", ...)
	but
ls -d /foo/. does lstat64("/foo/.", ...)

Will it work out if "dir inside file" will only be visible when referred as "file/."?
--
vda

