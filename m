From: Linus Torvalds <torvalds@osdl.org>
Subject: Re: [some sanity for a change] possible design issues for hybrids
Date: Thu, 26 Aug 2004 21:46:00 -0700 (PDT)
Message-ID: <Pine.LNX.4.58.0408262144350.2304@ppc970.osdl.org>
References: <20040826223625.GB21964@parcelfarce.linux.theplanet.co.uk>
 <Pine.LNX.4.58.0408261538030.2304@ppc970.osdl.org>
 <20040826225308.GC21964@parcelfarce.linux.theplanet.co.uk>
 <Pine.LNX.4.58.0408261619230.2304@ppc970.osdl.org>
 <20040826234048.GD21964@parcelfarce.linux.theplanet.co.uk>
 <Pine.LNX.4.58.0408261652240.2304@ppc970.osdl.org>
 <20040827010147.GE21964@parcelfarce.linux.theplanet.co.uk>
 <Pine.LNX.4.58.0408261934570.2304@ppc970.osdl.org>
 <20040827034550.GG21964@parcelfarce.linux.theplanet.co.uk>
 <Pine.LNX.4.58.0408262051030.2304@ppc970.osdl.org>
 <20040827043058.GH21964@parcelfarce.linux.theplanet.co.uk>
 <Pine.LNX.4.58.0408262135160.2304@ppc970.osdl.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20874-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.58.0408262135160.2304@ppc970.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: viro@parcelfarce.linux.theplanet.co.uk
Cc: Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>, Rik van Riel <riel@redhat.com>, Diego Calleja <diegocg@teleline.es>, jamie@shareable.org, christophe@saout.de, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com



On Thu, 26 Aug 2004, Linus Torvalds wrote:
>
> > 	if (vfsmount is marked as hybrid && dentry == vfsmount->mnt_dentry)
> > 		return;
> 
> Hmm.. Here we shouldn't have a vfsmount. If we have one, that means that 
> we found it in the hashes, and we should just have returned it 
> immediately (whether hybrid or not doesn't matter at that point).

Ahh, I misunderstood you. 

You mean that if the _old_ vfsmount was already a hybrid one, we won't try 
to recurse if we didn't find any other, so we return NULL at that point.

Got it. Yes, I bow before your cunningness.

		Linus
