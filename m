From: viro@parcelfarce.linux.theplanet.co.uk
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 21:32:28 +0100
Sender: <viro@www.linux.org.uk>
Message-ID: <20040826203228.GZ21964@parcelfarce.linux.theplanet.co.uk>
References: <Pine.LNX.4.44.0408261356330.27909-100000@chimarrao.boston.redhat.com> <200408262128.41326.vda@port.imtp.ilyichevsk.odessa.ua> <Pine.LNX.4.58.0408261132150.2304@ppc970.osdl.org> <20040826191323.GY21964@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20789-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040826191323.GY21964@parcelfarce.linux.theplanet.co.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@osdl.org>
Cc: Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>, Rik van Riel <riel@redhat.com>, Diego Calleja <diegocg@teleline.es>, jamie@shareable.org, christophe@saout.de, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

On Thu, Aug 26, 2004 at 08:13:23PM +0100, viro@parcelfarce.linux.theplanet.co.uk wrote:
 
> Hey, if we lose the "can't unlink/rmdir/rename over something that is
> a mountpoint in other life" - I'm happy and we can get a lot of much
> more interesting stuff to work.  It will take some work (e.g. making
> sure we can find all vfsmounts over given mountpoint and sorting out
> the locking issues, which won't be trivial), but the main obstacle in
> that direction is not in architecture - it's in SuS and tradition; as
> the matter of fact, our life would be much easier if we stopped trying
> to give -EBUSY here and just dissolved all subtrees mounted on anything
> that has that dentry.

Argh...  OK, now I remember why I went for -EBUSY for unlink() (we obviously
are not bound by SuS on that one).  Consider the following scenario:
	* local file foo got something else bound on it for a while
	* we are tight on space - time to clean up
	* oh, look - contents of foo is junk
	* rm foo
	* ... oh, fuck, there goes the underlying file.
