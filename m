From: Felipe Alfaro Solana <lkml@felipe-alfaro.com>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 27 Aug 2004 00:20:38 +0200
Message-ID: <200408270020.39190.lkml@felipe-alfaro.com>
References: <Pine.LNX.4.44.0408261607070.27909-100000@chimarrao.boston.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20826-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.44.0408261607070.27909-100000@chimarrao.boston.redhat.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rik van Riel <riel@redhat.com>
Cc: Linus Torvalds <torvalds@osdl.org>, Diego Calleja <diegocg@teleline.es>, jamie@shareable.org, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

On Thursday 26 August 2004 22:10, Rik van Riel wrote:

> Do we really want to have a file paradigm that's different
> from the other OSes out there ?
>
> What happens when users want to transfer data from Linux
> to another system ?

I think it depends on the transport being used: some transports could allow 
for metadata (i.e. a MIME-compatible transport) while some others don't. Of 
course, the remote side needs to also support metadata (i,e. using a 
MIME-compatible transport against a remote host that doesn't understand 
metadata is certainly impossible).

For example, with FTP transports, I guess the only possible option is to 
transfer the unnamed/default stream. NFS should allow metadata, but this 
probably needs some kind of extensions to the NFS protocol.
