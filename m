From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: OpenAFS on Reiser4
Date: Sun, 16 Mar 2008 14:11:48 -0400
Message-ID: <47DD62E4.9050807@suse.com>
References: <b8d16a880803142159h61dffabewed8870dd889af8b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <b8d16a880803142159h61dffabewed8870dd889af8b@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christopher Sawtell <csawtell@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Christopher Sawtell wrote:
> I'm trying to set up an OpenAFS node on a machine which happens to be
> running Reiser4.
> The OpenAFS doco has dire warnings about running it with its cache on
> a ReiserFS partition.
> Do these warnings apply to the Reiser4 filesystem as well?
> 
> Many thanks in advance.

That's a question better asked of the OpenAFS guys. AFAIK, it only
really works well on ext[23], but then again I don't use it.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.4-svn0 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFH3WLkLPWxlyuTD7IRAtGlAJ4yTPCn+3ymeWRBEllo0Q8HNN3/ZgCfaAD0
JQQtBEbfZn36vczXfaEvzmE=
=Ubgw
-----END PGP SIGNATURE-----
