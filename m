From: David Masover <ninja@slaphack.com>
Subject: Re: Recursive modified-timestamp?
Date: Thu, 06 Jan 2005 16:31:38 -0600
Message-ID: <41DDBC4A.6020305@slaphack.com>
References: <4329085595-BeMail@cr593174-a> <41D834E1.6030404@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23054-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41D834E1.6030404@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: "Alexander G. M. Smith" <agmsmith@rogers.com>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hans Reiser wrote:
| Alexander G. M. Smith wrote:
|
|>
|> Possibly.  But I'd like to generalize it a bit.  Percolated attributes
|> are
|> perhaps a better more general idea.  We already have inherited attributes
|> (such as security of children being inherited from the parent) so
|> going in
|> the other direction isn't all that big step, it just needs an
|> application,
|> like your modification detection system.
|>
|>
| The general form of inheritance should not be restricted to inheriting
| from parents.  Parents should merely be a default if nothing is
| specified as what one inherits from.  And when one inherits, one can
| write through to what one inherits from, at least by default.

Right.  Thinking back to the recursive-mtimes, one possible way to get
an mtime for a tree is to have every modification to one of its files
percolate back up the tree (child-to-parent), meaning a parent is
"inheriting" that attribute from each of its children.

This could be made fast by merely having a flag that says "this file has
been modified since this program last checked", so that the change-flag
doesn't have to go all the way back up the tree each time.

One possible way to do this is to give each file/directory a list of
links to each of its parents.  How hard would that be to add?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQd28SXgHNmZLgCUhAQLBfBAAlRBz2RKpBpYxqI5D1LXUQsv6/pDPO3kF
ROlGCaS4lbFIsVHuJazS1uVW+JSY/7FQWRBx06PpsM3jB8RHCKnlhx8WUgGEt9sb
r7AQ+u91nPk2Oh638X6tNgFPbiUMCFpRZXuQ7e7SmyxIuqEEwUsIsEIirqo6uru5
KN7/2JiABMlUIQAF8SbPB4RwNxUbAP1d//khAhhseLlq4b7nyT426kLVmxQY5hjq
QiMxJWvODm9ifuKu+Kwe2DhZa+s/jKAHCIdKNP25rzUTSaOtRnqX90zAJmO/vtL6
HKGAW3+YpuVv+wV7wcSfKNoCRSdr1m2HxgmIoyF5I7Z1G4/hMCqilroK+2lii2aA
DhjvSSUFlLwnvZcvWwnsE8T/pRXICT5RR/pvmtIiji+HJUJEufn75+QxPk/IFYNk
HboXahafDm669tQiOPvHhBIRNxblXmO4BsumJ5C8b3Qt6Xpx434VkHfqWmcgnTjg
a/wyXSa5/AiD4KrMR9GcN1PkOVP6Kr42o2w/iGEUZqQfM11kWCLAvYA/8fcYgxWm
der1Pa+jrw9/t4eJFTEPE0jKNau7MXlA/yeIXXVh+0T51fApdXuPsOCs8J5GWzCZ
8EUaXS7FO7FrI4/ynarnewlOtVvAOGiit1aMDdN89fF1WlTWU3aze8pCPgJ+EQb8
T8Sb9/eLWJM=
=hNoL
-----END PGP SIGNATURE-----
