From: Theodore Tso <tytso@mit.edu>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org regarding reiser4 inclusion
Date: Thu, 3 Aug 2006 12:50:31 -0400
Message-ID: <20060803165031.GC20603@thunk.org>
References: <200607312314.37863.bernd-schubert@gmx.de> <200608011428.k71ESIuv007094@laptop13.inf.utfsm.cl> <20060801165234.9448cb6f.reiser4@blinkenlights.ch> <1154446189.15540.43.camel@localhost.localdomain> <44CF9BAD.5020003@emc.com> <20060803140307.GB7431@merlin.emma.line.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29462-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20060803140307.GB7431@merlin.emma.line.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ric Wheeler <ric@emc.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Adrian Ulrich <reiser4@blinkenlights.ch>, "Horst H. von Brand" <vonbrand@inf.utfsm.cl>, bernd-schubert@gmx.de, reiserfs-list@namesys.com, jbglaw@lug-owl.de, clay.barnes@gmail.com, rudy@edsons.demon.nl, ipso@snappymail.ca, reiser@namesys.com, lkml@lpbproductions.com, jeff@garzik.org, linux-kernel@vger.kernel.org, wayned@samba.org

On Thu, Aug 03, 2006 at 04:03:07PM +0200, Matthias Andree wrote:
> On Tue, 01 Aug 2006, Ric Wheeler wrote:
> 
> > Mirroring a corrupt file system to a remote data center will mirror your 
> > corruption.
> > 
> 
> Which makes me wonder if backup systems shouldn't help with this. If
> they are reading the whole file anyways, they can easily compute strong
> checksums as they go, and record them for later use, and check so many
> percent of unchanged files every day to complain about corruptions.

They absolutely should do this sort of thing.

Also sounds like yet another option that could be added to rsync.
(Only half-joking.  :-)

						- Ted
