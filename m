From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: reiser4 plugins
Date: Wed, 06 Jul 2005 17:31:58 -0400
Message-ID: <87ackzei41.fsf@evinrude.uhoreg.ca>
References: <hubert@uhoreg.ca>
	<200507062033.j66KXNqM008212@laptop11.inf.utfsm.cl>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-25013-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200507062033.j66KXNqM008212@laptop11.inf.utfsm.cl> (Horst von
 Brand's message of "Wed, 06 Jul 2005 16:33:23 -0400")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Horst von Brand <vonbrand@inf.utfsm.cl>
Cc: Jonathan Briggs <jbriggs@esoft.com>, "Alexander G. M. Smith" <agmsmith@rogers.com>, ross.biro@gmail.com, mrmacman_g4@mac.com, Valdis.Kletnieks@vt.edu, ltd@cisco.com, gmaxwell@gmail.com, jgarzik@pobox.com, hch@infradead.org, akpm@osdl.org, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com, zam@namesys.com, vs@thebsh.namesys.com, ndiller@namesys.com, ninja@slaphack.com, vitaly@thebsh.namesys.com

On Wed, 06 Jul 2005 16:33:23 -0400, Horst von Brand <vonbrand@inf.utfsm.cl> said:

> Hubert Chan <hubert@uhoreg.ca> wrote:
>> If you can store the parents, then finding cycles (relatively)
>> quickly is pretty easy: before you try to make A the parent of B,
>> walk up the parent pointers starting from A.  If you ever reach B,
>> you have a cycle.  If not, you don't have a cycle.  (Hmmm.  Do I need
>> a proof of correctness for this?  It's just depth-first-search, which
>> everybody learned in their first algorithms course.)

> Correct. And you need space for potentially a huge lot of up pointers
> for each file.

People (that I know of) don't normally have a huge lot of hardlinks to a
single file.

> And then there is the (very minor) problem is that meanwhile /nothing/
> can touch the filesystem to do any change...

If the DFS is quick, it shouldn't make much difference.

Lock nodes as you walk up the tree, and people can change unlocked nodes
without harming anything.  All you need to do is make sure that no up
pointers get added to nodes that you've already looked at.

People can also still edit files without changing the tree (and hence
not screwing up the DFS).

> How do you delete such an object? You will have to delete from each
> child down to the first object that has a pointer to it from the
> outside, if you don't want garbage left behind. And that means walking
> down to /each/ reachable object, then walking up from there to see if
> all its parents are in the DAG rooted at what you are going to
> delete. This means potentially walking through the whole filesystem
> (if you want to delete the root, or something near). You will run out
> of memory, and again, meanwhile no changes can be allowed.

What does deleting have to do with up pointers?  If you delete a
directory that has refcount greater than 1, you decrease the refcount,
remove the appropriate up pointer, and remove the inode entry from its
parent.  If you delete a directory that has refcount equal to 1, well,
we're in the same situation we're in right now when you delete a
directory; you need to "rm -r", which doesn't lock up the whole
filesystem.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

