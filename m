From: Rik van Riel <riel@redhat.com>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 11:54:51 -0400 (EDT)
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0408261152340.27909-100000@chimarrao.boston.redhat.com>
References: <20040826154446.GG5733@mail.shareable.org>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20040826154446.GG5733@mail.shareable.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamie Lokier <jamie@shareable.org>
Cc: Christophe Saout <christophe@saout.de>, Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>, Christer Weinigel <christer@weinigel.se>, Spam <spam@tnonline.net>, Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, jra@samba.org, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

On Thu, 26 Aug 2004, Jamie Lokier wrote:
> Christophe Saout wrote:

> > And if you read test.compound (the main stream) you get a special format
> > that contains all the components. You can copy that single stream of
> > bytes to another (reiser4) fs and then access test.compound/test.txt
> > again.
> 
> (To Rik especially), this is the design which more or less satisfies
> lots of different goals at once.

And if an unaware application reads the compound file
and then writes it out again, does the filesystem
interpret the contents and create the other streams ?

Unless I overlook something (please tell me what), the
scheme just proposed requires filesystems to look at
the content of files that is being written out, in
order to make the streams work.

-- 
"Debugging is twice as hard as writing the code in the first place.
Therefore, if you write the code as cleverly as possible, you are,
by definition, not smart enough to debug it." - Brian W. Kernighan


