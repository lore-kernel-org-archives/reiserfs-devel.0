From: Troy Wu <troy@sequence.stanford.edu>
Subject: Re: [NFS] NFS/2.4.18/reiserfs question
Date: Wed, 11 Sep 2002 12:34:23 -0700 (PDT)
Message-ID: <Pine.LNX.4.44L1.0209111208160.20363-100000@sequence.stanford.edu>
References: <Pine.LNX.4.44.0209110853090.29369-100000@fogarty.jakma.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11427-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.44.0209110853090.29369-100000@fogarty.jakma.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: NFS at SourceForge <NFS@lists.sourceforge.net>
Cc: ReiserFS at NameSys <reiserfs-list@namesys.com>

I've gotten some very helpful information, but am still a little confused.
Basically, I've heard some people say that Reiser (RFS) is simply a bad
choice with NFS.  Others have said I'm using the wrong version of the
on-disk format.  I've also been reading up on the discussion at the
ReiserFS archives about this.

Am I to understand that RFS-3.5.x does not reliably work with NFS (because
of the stale filehandle problem caused by a weird inode generation
implementation)?  I'm not convinced that RFS-3.6.x will fix the problem.

	Basically, does RFS-3.6.x *fix* this problem or simply *mitigate*
	this problem?

	Secondly, even though I acknowlege that NFS is a bit lame,
	filesystem support is still critical to many operations (including
	ours).  We have terabytes of data, and copying files to move them
	to a new file format (which in this case seems necessary), is not
	something that we can do at the drop of a hat.  I understand it's
	my failing not to have checked this before using RFS, but can
	someone provide an objective picture of how seriously
	production-ready RFS/NFS is?

Can anyone point me to the actual references which describe this problem
(i.e., the inode numbers or file-handles and how they relate to NFS and
Reiser interacting badly)?  Or, if you're so inclined, to share that
information via email?  =)

Thanks--particularly to those who've already provided some valuable
information!

	--troy



