From: Brian Tinsley <btlists@emageon.com>
Subject: Re: getting UUID and label of a filesystem
Date: Thu, 06 Nov 2003 14:54:01 -0600
Message-ID: <1068152041.2327.34.camel@dragonball>
References: <3FAAB330.5040503@nrao.edu>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=-3d6AGe45iTOL8UrXsfqg"
Return-path: <reiserfs-list-return-15997-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FAAB330.5040503@nrao.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-3d6AGe45iTOL8UrXsfqg
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2003-11-06 at 14:46, Boyd Waters wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Perhaps this is obvious, but I cannot find a way to print out the UUID
> or the label of a mounted reiser filesystem, in a manner similar to
> xfs_admin.
> 
> Best way to do this?


debugreiserfs /dev/xxx


> 
> On a mounted filesystem?


Yes.


> 
> As non-root user?


Doubtful


--=-3d6AGe45iTOL8UrXsfqg--

