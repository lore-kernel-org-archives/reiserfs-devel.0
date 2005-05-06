From: David Masover <ninja@slaphack.com>
Subject: Re: Reiser4 support on parted ...
Date: Thu, 05 May 2005 21:29:20 -0500
Message-ID: <427AD680.3020708@slaphack.com>
References: <427A0834.7080201@futuretg.com> <427A99C0.2000105@slaphack.com> <20050505221204.GC8179@gnu.org> <427AA6CF.6000505@slaphack.com> <20050506000208.GE8179@gnu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23995-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050506000208.GE8179@gnu.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Clausen <clausen@gnu.org>
Cc: "Dr. Giovanni A. Orlando" <gorlando@futuretg.com>, Hans Reiser <reiser@namesys.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Andrew Clausen wrote:
> On Thu, May 05, 2005 at 06:05:51PM -0500, David Masover wrote:
> 
>>Couldn't this just be a wrapper to mkfs.reiser4 and fsck.reiser4?
> 
> 
> Almost.
> 
> As it stands, libparted can't delegate out I/O to external programs,
> because its filesystem API address in terms of disk sectors rather
> than partitions.  libparted could be improved to map sectors back
> to partitions for external communication, though.
> (I wonder if clever use of devicemapper could make this very simple?)

Ick.  Well, I suppose that just means some usage of libreiser4, maybe
some moving of code from the apps to the library?

> Also, error handling (especially with i18n) could be somewhat painful
> with this approach.

I know very little about error handling.  Most of the time, I don't add
error handling until something actually blows up, or until I have to
show my code to the world.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQnrWgHgHNmZLgCUhAQL+EhAAnA++jvIO2HyZT5B8jxTyRD3OUDexbrah
v/v7rBMUCdokOJfasusYwasPdCQQedzP1bcTuyWbxLmDl+xuQeJ5cwUQcLQ4ZHDT
lbedQdaT3K/hjDXWmgRrTPTQ6KQBhqpAs0z9mLIkaA22hMuNjluDI1Nebk8dqMqn
/qwfDQYcmu3ngk5rvwOP5Trr5ysqmoiPs/DQ1jxV4YMpN3CSr/CgD3jOkCf7smzQ
66+KYaTVXj2M/wUhVp/iAKbqGK70xy+pwTmczoGmAu08h0RZVNMvSw4LHQBsA1L0
yt9x5qqIw97NLbgh0vD5bJNltj//mQ0BhgvXFc7m+LpXIXGtd1Db8/FdLq2A1f7v
7KQiZFuiRDAFVW/L8WTbJZdSwaCjA+Tc28c4jFi3bw9P5ep+LKlFVv1+5A02P+xq
lvoic8tBhV/bbk6PnKqmZSFqRZiJOD4FUIKXU/0Ldcjzx3fCY1Q6rEdzriQeh1CH
vT+OxB720LRitZpg69sJ0KVCevlSUbPJNAeFlXWx30yTncwgRkquBXE+tSWZCL77
X2ndRDTAlwD4UYF+2oH1rtQk/zN37pOsI4Bge/Om6N8gFOdfS9eTZ8b8pwFWS8ug
ihqciwk5G0ssYkESNailwENI6Vhi/ev6YN6bt/QOjAglve/X1rQ3nPAQ0c0bNCSN
3QCvovaNz68=
=SPBl
-----END PGP SIGNATURE-----
