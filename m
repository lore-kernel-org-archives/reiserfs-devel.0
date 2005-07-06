From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 plugins
Date: Wed, 06 Jul 2005 09:11:09 -0500
Message-ID: <42CBE67D.9000507@slaphack.com>
References: <42CB1E12.2090005@namesys.com>	<1740726161-BeMail@cr593174-a>	<87hdf8zqca.fsf@evinrude.uhoreg.ca>	<42CB7DE0.4050200@namesys.com>	<42CBD7F6.2050203@slaphack.com> <20050706154349.5d6aa92c.reiser4@blinkenlights.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24994-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050706154349.5d6aa92c.reiser4@blinkenlights.ch>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Adrian Ulrich <reiser4@blinkenlights.ch>
Cc: reiser@namesys.com, hubert@uhoreg.ca, agmsmith@rogers.com, ross.biro@gmail.com, vonbrand@inf.utfsm.cl, mrmacman_g4@mac.com, Valdis.Kletnieks@vt.edu, ltd@cisco.com, gmaxwell@gmail.com, jgarzik@pobox.com, hch@infradead.org, akpm@osdl.org, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com, zam@namesys.com, vs@thebsh.namesys.com, ndiller@namesys.com, vitaly@thebsh.namesys.com

Adrian Ulrich wrote:
>>so all we have left is the issue of whether using /meta costs us 
>>performance, or whether breaking POSIX to add a symlink (such as 
>>foo/...) really gives us that much more usability.
> 
> 
> IMHO '/meta' isn't such a good idea, because a chrooted application
> won't be able to use it.

mount --bind.  Is there a performance hit for having too many of those?

mount --bind /meta/vfs/some/chroot /some/chroot/meta

Also, maybe a separately-mounted /meta, maybe with something like
'-o root='

I can't think of when you'd have a chrooted application that uses /meta, 
but wasn't written with /meta in mind, so as to have these mount 
commands in its init scripts.

