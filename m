From: Linus Torvalds <torvalds@osdl.org>
Subject: Re: [some sanity for a change] possible design issues for hybrids
Date: Thu, 26 Aug 2004 16:24:51 -0700 (PDT)
Message-ID: <Pine.LNX.4.58.0408261619230.2304@ppc970.osdl.org>
References: <Pine.LNX.4.44.0408261356330.27909-100000@chimarrao.boston.redhat.com>
 <200408262128.41326.vda@port.imtp.ilyichevsk.odessa.ua>
 <Pine.LNX.4.58.0408261132150.2304@ppc970.osdl.org>
 <20040826191323.GY21964@parcelfarce.linux.theplanet.co.uk>
 <20040826203228.GZ21964@parcelfarce.linux.theplanet.co.uk>
 <Pine.LNX.4.58.0408261344150.2304@ppc970.osdl.org>
 <20040826212853.GA21964@parcelfarce.linux.theplanet.co.uk>
 <Pine.LNX.4.58.0408261436480.2304@ppc970.osdl.org>
 <20040826223625.GB21964@parcelfarce.linux.theplanet.co.uk>
 <Pine.LNX.4.58.0408261538030.2304@ppc970.osdl.org>
 <20040826225308.GC21964@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20842-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040826225308.GC21964@parcelfarce.linux.theplanet.co.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: viro@parcelfarce.linux.theplanet.co.uk
Cc: Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>, Rik van Riel <riel@redhat.com>, Diego Calleja <diegocg@teleline.es>, jamie@shareable.org, christophe@saout.de, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com



On Thu, 26 Aug 2004 viro@parcelfarce.linux.theplanet.co.uk wrote:
> 
> What dentry->d_mountpoint?  No such thing...

Sorry - set "dentry->d_mounted++" + "add vfsmount/dentry to hashes".

Yes, it's not a direct list off the dentry, but it effectively is the same
thing.

So basically: the "d_mounted++" just makes sure we get into
"lookup_mnt()". That's where we will usually find the actual mount thing.

And that's also where the special case comes in: if we _don't_ find the 
mount thing there, that's where we need to create it. That will only 
happen if somebody looks it up using another namespace, though, so it 
should be rare.

And when it does happen, we can just create a new vfsmount - we have all
the information there (we'll have to walk the per-inode-or-whatever
vfsmount list to find all the information to populate the thing with, of
course. But we need that list _anyway_, so it should be a fairly 
straightforward special case).

			Linus
