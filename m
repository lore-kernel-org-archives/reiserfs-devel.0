From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 plugins
Date: Fri, 08 Jul 2005 11:45:28 -0500
Message-ID: <42CEADA8.4060303@slaphack.com>
References: <42CB1E12.2090005@namesys.com> <1740726161-BeMail@cr593174-a>	<87hdf8zqca.fsf@evinrude.uhoreg.ca> <42CB7DE0.4050200@namesys.com>	<1120675943.13341.10.camel@localhost> <42CCCEEA.7040302@namesys.com> <87oe9duu9o.fsf@evinrude.uhoreg.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25061-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87oe9duu9o.fsf@evinrude.uhoreg.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hubert Chan <hubert@uhoreg.ca>
Cc: Hans Reiser <reiser@namesys.com>, "Alexander G. M. Smith" <agmsmith@rogers.com>, ross.biro@gmail.com, vonbrand@inf.utfsm.cl, mrmacman_g4@mac.com, Valdis.Kletnieks@vt.edu, ltd@cisco.com, gmaxwell@gmail.com, jgarzik@pobox.com, hch@infradead.org, akpm@osdl.org, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com, zam@namesys.com, vs@thebsh.namesys.com, ndiller@namesys.com, vitaly@thebsh.namesys.com

Hubert Chan wrote:
> On Wed, 06 Jul 2005 23:42:50 -0700, Hans Reiser <reiser@namesys.com> said:
> 
> 
>>Oh no, don't store the whole path, store just the parent list.  This
>>will make fsck more robust in the event that the directory gets
>>clobbered by hardware error.
> 
> 
>>I don't think it affects the cost of detecting cycles though, I think
>>it only makes fsck more robust.
> 
> 
> It doesn't affect the worst-case cost of detecting cycles; by necessity,
> any (static [1]) directed cycle detection algorithm must take O(n) time,
> n being the size of the tree (nodes + links).  However, under
> "reasonable assumptions" (where the reasonableness of those assumptions
> may be questioned, but I think they're reasonable), I think that doing a
> depth-first-search through the parent links makes the algorithm
> not-too-terrible.  Namely, the "reasonable assumptions" are that a node
> doesn't have "too many" parents, and the filesystem hierarchy is not
> "too deep".

And, remember, there are other things affected by depth of the tree 
anyway.  For that matter, most of the time, when you push a system past 
"reasonable assumptions", you hit performance issues, if not stability 
ones.  Most everything but Reiser assumes that you won't have "too many" 
files in a directory, or "too many" small files in the FS as a whole.

I think it's fair to assume people will keep things "reasonable", 
especially if we tell them what "reasonable" means.  As in, "This is the 
kind of organization which Reiser4 handles really well, and this is the 
kind of organization which will absolutely kill your performance."

