From: Rik van Riel <riel@redhat.com>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 13:57:33 -0400 (EDT)
Message-ID: <Pine.LNX.4.44.0408261356330.27909-100000@chimarrao.boston.redhat.com>
References: <Pine.LNX.4.58.0408261019580.2304@ppc970.osdl.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20743-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.58.0408261019580.2304@ppc970.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@osdl.org>
Cc: Diego Calleja <diegocg@teleline.es>, jamie@shareable.org, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

On Thu, 26 Aug 2004, Linus Torvalds wrote:

> > So all I need to do is "cat /bin | gzip -9 > /path/to/backup.tar.gz" ?
> 
> No no. The stream you get from a directory is totally _independent_ of the 
> contents of the directory. Anything else would be pointless.

It's a relief to know that nobody's taking my humorous
suggestion seriously, but now we still have the "standard
Unix tools can't manipulate files" problem...

-- 
"Debugging is twice as hard as writing the code in the first place.
Therefore, if you write the code as cleverly as possible, you are,
by definition, not smart enough to debug it." - Brian W. Kernighan

