From: Linus Torvalds <torvalds@osdl.org>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 10:20:36 -0700 (PDT)
Message-ID: <Pine.LNX.4.58.0408261019580.2304@ppc970.osdl.org>
References: <Pine.LNX.4.44.0408261315240.27909-100000@chimarrao.boston.redhat.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20735-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.44.0408261315240.27909-100000@chimarrao.boston.redhat.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rik van Riel <riel@redhat.com>
Cc: Diego Calleja <diegocg@teleline.es>, jamie@shareable.org, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com



On Thu, 26 Aug 2004, Rik van Riel wrote:
>
> On Thu, 26 Aug 2004, Diego Calleja wrote:
> 
> > All this looks like reinventing the file/directory concept wheel.
> > Instead of adding support for streams and "use files as directories",
> > why not orientate it to "use directories as files? Streams could very
> > well be provided by directories containing files,
> 
> So all I need to do is "cat /bin | gzip -9 > /path/to/backup.tar.gz" ?

No no. The stream you get from a directory is totally _independent_ of the 
contents of the directory. Anything else would be pointless.

		Linus
