From: evilninja <evilninja@gmx.net>
Subject: Re: EACCESS vs ENOENT for nonexistent files-within-files
Date: Thu, 16 Sep 2004 02:00:43 +0200
Message-ID: <4148D7AB.4000301@gmx.net>
References: <20040913140637.GB29591@redhat.com>	<20040913161326.GB2252@backtop.namesys.com>	<20040913185255.GA1920@redhat.com>	<16709.63624.953839.299199@thebsh.namesys.com>	<41481FA5.2000504@gmx.net> <16712.10868.647572.90804@thebsh.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21800-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16712.10868.647572.90804@thebsh.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Nikita Danilov <nikita@clusterfs.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Nikita Danilov wrote:
> evilninja writes:
>  > -----BEGIN PGP SIGNED MESSAGE-----
>  > Hash: SHA1
>
> Hello, Christian evilninja :)

um, yes, it just sticks ;-)

>
> But in reiser4 file.txt _is_ a directory. That's the whole point: it
> contains other objects inside.
[...]
> This is very simple: do be able to do a lookup one needs +x bit. No +x
> bit--no lookup. No lookup---impossible to determine exists .htaccess or
> not.

ok, so things will be different when i'll try reiser4 on my box.

> Permission bits determine what operations are possible on
> object. Letting user to know that .htaccess doesn't exist while
> permission bits on parent explicitly disable lookups is a security
> hole.

yes, i think i got i now. thanks for the explanation.

Christian.
- --
BOFH excuse #65:

system needs to be rebooted
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFBSNerC/PVm5+NVoYRAuLsAJ99JCbKQ0ebl9xRPwwYK/un9OKRtgCg3nOu
tlYw+GkQWwO2Kfk1pEVlivE=
=5iJg
-----END PGP SIGNATURE-----
