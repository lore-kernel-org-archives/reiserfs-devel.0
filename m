From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: reiser4 plugins
Date: Fri, 08 Jul 2005 12:39:31 -0400
Message-ID: <87oe9duu9o.fsf@evinrude.uhoreg.ca>
References: <42CB1E12.2090005@namesys.com> <1740726161-BeMail@cr593174-a>
	<87hdf8zqca.fsf@evinrude.uhoreg.ca> <42CB7DE0.4050200@namesys.com>
	<1120675943.13341.10.camel@localhost> <42CCCEEA.7040302@namesys.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel=40m.gmane.org-S262707AbVGHQj7@vger.kernel.org>
In-Reply-To: <42CCCEEA.7040302@namesys.com> (Hans Reiser's message of "Wed,
 06 Jul 2005 23:42:50 -0700")
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: "Alexander G. M. Smith" <agmsmith@rogers.com>, ross.biro@gmail.com, vonbrand@inf.utfsm.cl, mrmacman_g4@mac.com, Valdis.Kletnieks@vt.edu, ltd@cisco.com, gmaxwell@gmail.com, jgarzik@pobox.com, hch@infradead.org, akpm@osdl.org, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com, zam@namesys.com, vs@thebsh.namesys.com, ndiller@namesys.com, ninja@slaphack.com, vitaly@thebsh.namesys.com

On Wed, 06 Jul 2005 23:42:50 -0700, Hans Reiser <reiser@namesys.com> said:

> Oh no, don't store the whole path, store just the parent list.  This
> will make fsck more robust in the event that the directory gets
> clobbered by hardware error.

> I don't think it affects the cost of detecting cycles though, I think
> it only makes fsck more robust.

It doesn't affect the worst-case cost of detecting cycles; by necessity,
any (static [1]) directed cycle detection algorithm must take O(n) time,
n being the size of the tree (nodes + links).  However, under
"reasonable assumptions" (where the reasonableness of those assumptions
may be questioned, but I think they're reasonable), I think that doing a
depth-first-search through the parent links makes the algorithm
not-too-terrible.  Namely, the "reasonable assumptions" are that a node
doesn't have "too many" parents, and the filesystem hierarchy is not
"too deep".

[1] BTW, I had also previously looked at online/dynamic algorithms, for
those who are familiar with that area.  The best known so far is still
O(n) worst case, but much, much smaller in "most cases".

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.
