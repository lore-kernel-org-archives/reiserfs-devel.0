From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: silent semantic changes with reiser4
Date: Sun, 29 Aug 2004 20:07:24 -0400 EDT
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <1326059983-BeMail@cr593174-a>
References: <1093821430.8099.49.camel@lade.trondhjem.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <1093821430.8099.49.camel@lade.trondhjem.org>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: viro@parcelfarce.linux.theplanet.co.uk, reiser@namesys.com, flx@msu.ru, pj@sgi.com, riel@redhat.com, ninja@slaphack.com, diegocg@teleline.es, jamie@shareable.org, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com, torvalds@osdl.org

Trond Myklebust wrote on Sun, 29 Aug 2004 19:17:10 -0400:
> Is it just the fantasy of supporting hard-links across "stream
> boundaries" (as in "touch a b; ln b a/b; ln a b/a")? I'm pretty sure
> nobody wants to have to add cyclic graph detection to their filesystems
> anyway. 8-)

Been there, done that.  It works in a rough form in an experimental RAM file system for BeOS.  But deleting files requires a graph traversal to see if it is isolating just one item or a whole bunch of them.  It also implies keeping track of multiple parent directories for everything.  It does make it useful for the user - you can have files and directories in multiple places, so you don't have to decide on one classification for a file (or directory).  One other downside is a lot of locking complexity (or not if you don't need fine grained locking) to guarantee atomicity of the delete.

For user convenience, the low level delete function returns an error code if there is more than one item cut off from the root, but it could just as well delete all of them (sort of like rmdir giving an error if the directory isn't empty rather than just deleting everything).

- Alex
