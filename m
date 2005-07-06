From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 plugins
Date: Wed, 06 Jul 2005 15:53:45 -0500
Message-ID: <42CC44D9.8000306@slaphack.com>
References: <42CB1E12.2090005@namesys.com> <1740726161-BeMail@cr593174-a>	 <87hdf8zqca.fsf@evinrude.uhoreg.ca> <42CB7DE0.4050200@namesys.com>	 <1120675943.13341.10.camel@localhost>  <87mzozemqp.fsf@evinrude.uhoreg.ca> <1120681998.13341.23.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25008-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1120681998.13341.23.camel@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jonathan Briggs <jbriggs@esoft.com>
Cc: Hubert Chan <hubert@uhoreg.ca>, "Alexander G. M. Smith" <agmsmith@rogers.com>, ross.biro@gmail.com, vonbrand@inf.utfsm.cl, mrmacman_g4@mac.com, Valdis.Kletnieks@vt.edu, ltd@cisco.com, gmaxwell@gmail.com, jgarzik@pobox.com, hch@infradead.org, akpm@osdl.org, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com, zam@namesys.com, vs@thebsh.namesys.com, ndiller@namesys.com, vitaly@thebsh.namesys.com

Jonathan Briggs wrote:
> On Wed, 2005-07-06 at 15:51 -0400, Hubert Chan wrote:
> 
>>On Wed, 06 Jul 2005 12:52:23 -0600, Jonathan Briggs <jbriggs@esoft.com> said:
> 
> [snip]
> 
>>>It still has the performance and locking problem of having to update
>>>every child file when moving a directory tree to a new parent.  On the
>>>other hand, maybe the benefit is worth the cost.
>>
>>Every node should store the inode number(s) for its parent(s).  Not the
>>path name.  So you don't need to do any updates, since when you move a
>>tree, inode numbers don't change.
> 
> 
> You do need the updates if you change what inode is the parent.
> 
> /a/b/c, /a/b/d, /a/b/e, /b
> mv /a/b /b
> Now you have to change the stored grand-parent inodes for /a/b/c, /a/b/d
> and /a/b/e so that they reference /b/b instead of /a/b.

no, c, d, and e all would reference /a/b's *inode*, not *pathname*. 
Then /a/b would reference /a.  So with the above mv, you just change the 
reference in /a/b (now /b/b) to point to /b as parent.

Only way you would have to touch c, d, and e is if you did:

mkdir /b/b
mv /a/b/* /b/b/

but, since you're also essentially unlinking them from /a/b and linking 
them into /b, it's not that much more of a performance hit to update one 
pointer in the file.

