From: Jamie Lokier <jamie@shareable.org>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 19:20:42 +0100
Message-ID: <20040826182042.GU5733@mail.shareable.org>
References: <20040826194010.548e4a4c.diegocg@teleline.es> <Pine.LNX.4.44.0408261358370.27909-100000@chimarrao.boston.redhat.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20751-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0408261358370.27909-100000@chimarrao.boston.redhat.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rik van Riel <riel@redhat.com>
Cc: Diego Calleja <diegocg@teleline.es>, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

Rik van Riel wrote:
> > /bin could be separated (like linus said) but cat /bin/.compound could
> > do it. This is the /etc/passwd Hans' example, I think:
> 
> Arghhhh.  I wrote it down to ridicule the idea and now people
> are taking it seriously ;(
> 
> It should be obvious enough that anything depending on the
> kernel parsing file contents will lead to problems.

This is one case where the kernel _isn't_ parsing file contents,
but I agree it's ridiculous :)

-- Jamie
