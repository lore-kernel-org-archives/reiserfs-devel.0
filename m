From: Alex Brandt <alunduil@alunduil.com>
Subject: Re: Reiser4 compile error on vanilla-sources-2.6.27
Date: Sat, 11 Oct 2008 16:12:46 -0500
Message-ID: <48F116CE.7070108@alunduil.com>
References: <19928070.post@talk.nabble.com> <48EFFC5C.30504@alunduil.com> <19929422.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <19929422.post@talk.nabble.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

callx wrote:
> Oh my bad, I'm the one who made the typo when I wrote down the
> error.. :wistle: Did you use the same patch?
>
No, just noticed that problem from the error you submitted so if
that's not the problem in the patch, then the function in question is
not getting defined at the appropriate time. I'll try to take a look
at it when I get a few spare moments on Monday.

Regards,

Alex Brandt

- --
Student, B.S. Physics & Computer Science
Department of Physics and Astronomy, MSUM
Department of Computer Science and Information Systems, MSUM
www.alunduil.com
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAkjxFswACgkQvpZ9jByxpSdKvwCfU/meaG6+z93Sz4GhE22ecwOg
UfkAn37QeJ9af6iKoX8rnHprkz8OL+f3
=n/Y1
-----END PGP SIGNATURE-----

