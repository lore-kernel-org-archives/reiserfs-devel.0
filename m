From: Jamie Lokier <jamie@shareable.org>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 18:27:03 +0100
Message-ID: <20040826172703.GR5733@mail.shareable.org>
References: <Pine.LNX.4.44.0408261315240.27909-100000@chimarrao.boston.redhat.com> <Pine.LNX.4.58.0408261019580.2304@ppc970.osdl.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20736-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0408261019580.2304@ppc970.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@osdl.org>
Cc: Rik van Riel <riel@redhat.com>, Diego Calleja <diegocg@teleline.es>, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

Linus Torvalds wrote:
> > So all I need to do is "cat /bin | gzip -9 > /path/to/backup.tar.gz" ?
> 
> No no. The stream you get from a directory is totally _independent_ of the 
> contents of the directory. Anything else would be pointless.

Surely it depends on the directory?

The stream from a "classic directory", i.e. something made with
mkdir(), mode drwxr-xr-x filled with files, might well be a reproducible
representation of its contents.

-- Jamie

