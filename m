From: Valdis.Kletnieks@vt.edu
Subject: Re: Proposal for keying encrypted filesystem
Date: Thu, 03 Apr 2003 11:14:07 -0500
Message-ID: <200304031614.h33GE7S7004132@turing-police.cc.vt.edu>
References: <200303282026.23543.phma@webjockey.net> <200303291155.40419.phma@webjockey.net> <3E85E338.CEAA7DC7@namesys.com> <200303301130.24136.phma@webjockey.net> <3E8824B4.55C63A55@namesys.com> <3E88300C.22B54FD7@namesys.com> <20030331133618.GO8452@hvs.envisage.co.za> <3E88496C.E83B780F@namesys.com> <20030331164502.GU8452@hvs.envisage.co.za> <3E8985D5.7CA598FF@namesys.com>
            <3E89B908.1070106@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_593051530P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13546-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Tue, 01 Apr 2003 20:06:32 +0400."
             <3E89B908.1070106@namesys.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com, reiserfs-dev@namesys.com

--==_Exmh_593051530P
Content-Type: text/plain; charset=us-ascii

On Tue, 01 Apr 2003 20:06:32 +0400, Hans Reiser said:

> Are you sure we should not get keys from the environment? Is there too 
> much performance cost?

It's not just a performance cost issue.  It's also a security issue.

There's too many ways to leak the contents of /proc/<nnnn>/environ.  Yes,
it's mode 600.  (Think all the LD_* environment variable bugs.. ;)

Also, there's the problem that keys are per-file (possibly) while environments
are per-process.  As a result, a process that uses files in multiple security
domains can chew up a *LOT* of environment space.

A better bet would be to use the LSM security framework to create a module
that carries the tokens around for the process - this could even allow you
to do things like add a new key token to a process group leader and have
it propagate to already-running children (which is a phenomenally useful
thing to do that you can't do with an environment variable).  So for
instance, you could add a new key to your X login process, and all the
myriad subshells would get it - and thus any processes THEY launch) without
the need to log out from X and log back in again...

> It would be best if people could use applications that are unaware of 
> the crypto mechanism when accessing files.

Correct.  If the app can't use the normal open() call it's a non-starter.

--==_Exmh_593051530P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE+jF3OcC3lWbTT17ARAkhmAKDS+yvKH3toyrPEbYZXKXgH54FcsQCfe/nq
DrkwblRrAg8Tv1yJY3isGNs=
=7Q/k
-----END PGP SIGNATURE-----

--==_Exmh_593051530P--
