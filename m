From: Boyd Waters <bwaters+moz@nrao.edu>
Subject: Re: getting UUID and label of a filesystem
Date: Mon, 10 Nov 2003 13:40:19 -0700
Message-ID: <3FAFF7B3.5030306@nrao.edu>
References: <3FAAB330.5040503@nrao.edu> <1068152041.2327.34.camel@dragonball> <3FAFF00C.1000404@ysu.edu> <20031110201432.GB2014@mis-mike-wstn.matchmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16042-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20031110201432.GB2014@mis-mike-wstn.matchmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Mike Fedyk wrote:
| On Mon, Nov 10, 2003 at 03:07:40PM -0500, John Dalbec wrote:
|
|>I've added myself to the "disk" group and it works for me as non-root.
  You
|>just need read access to the raw device, no?
|
|
| Yes.
|
| But how many need access to the UUID information?  That can be a big
| security hole...

Cool discussion.

Um, can you point me to info regarding security holes in exposing the
UUID of a filesystem? I can't come up with a use-case that would support
this statement, but I'm willing to believe there is such.

I am using UUID's to track the source filesystem of a large
distributed-backup; I have lots of copies of stuff strewn across various
filesystems and I am in the process of pouring it all into a centralized
version-control system (Subversion). I can set arbitrary name=value tags
on the versioned files, and I'm currently setting one of them to the
source filesystem's UUID.

(Later, I'll start another thread which explores how to use ReiserFS
features to support Subversion, without an intervening database layer...)

So: What's the security hole in exposing the filesystem UUID?

~ - boyd

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQE/r/ez0is8k1r0QeURAvvjAJsFAKITHuQUcPhdS14/VecHvDL31wCfVEIs
4B+HXCitmX4m3QpVH5I/g7c=
=J0yK
-----END PGP SIGNATURE-----

