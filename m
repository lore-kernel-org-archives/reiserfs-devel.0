From: David Masover <ninja@slaphack.com>
Subject: Re: Reiser4 support on parted ...
Date: Thu, 05 May 2005 17:10:08 -0500
Message-ID: <427A99C0.2000105@slaphack.com>
References: <427A0834.7080201@futuretg.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23990-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <427A0834.7080201@futuretg.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Dr. Giovanni A. Orlando" <gorlando@futuretg.com>
Cc: Hans Reiser <reiser@namesys.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Dr. Giovanni A. Orlando wrote:
> Hi Everyone,
> 
>    I am looking to know if someone have time to share with me to add the
> necessary code
>    inside 'parted' to support Reiser4.

To support doing what to Reiser4?

"parted" is a disk management project -- specifically, a way to create,
delete, and resize partitions.  Think of it as fdisk with nicer units
and built-in resizefs tools.

This would, I think, involve creating a fully functional
resizefs.reiser4 -- something I distinctly remember Hans telling me not
to do, because my approach also created (most of) an online repacker,
which is something Hans wants to do for money.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQnqZwHgHNmZLgCUhAQLFPRAAgJvmB0lc/43iVkEdAgdqGN+SJ5J2ysX4
yFTwaNvLC8PCQlsILWTcToAxXdmt+5ufFRnwLyI1knA8BX9PasdXqg2TMzCd+QX/
zmSuKuKddpxs4uZ1aKbyAsFQgdQGuWKuTwdeu1AWgKh8kauQCzvqqmClXzNDfkfj
jP5gWwmGe0SoZtgZjO3M09DtH84WvJUnqNI7gxbG9Kn6ohKXffXmaQmAOV3zk5o2
qrrWud4jUAbKOGu/OZb8xLk1dCj/HkcFT05XiEcie5gHrEpi2ym0EBMjX8tynqF6
6LNvlxZIfpBWqQbgsUt7dvsm+NR98Pso7BwLyJNEgqZGuiuMLptd8dZ8qHKZOZAX
lKyFYobBGOyyaPfXjs5qWICWs19UzPopAFJk1F/L+KEYv9m9Zr8LiugFbuH8P8Bj
2MB6Oi+uHuaOcefr7nXU7qlVdMYlcFlY+fHVeeG7wCoPIxa1OSUOuJ+ejNI3CZRb
VHiQ7XAlORxWMyZCQx8V273UInm2nEiIDvqfuTfyfrj3sH1NfoJaSAKAMizCv3VS
z5QCBX/AEsHhQCuhLA0HwBvQJZniwxbEqQUd7k/WHEQUvDQeSAYDzJ/Bva/4wGpJ
7sXQ1jIm3F6lx2F6Vt33IFAeabi78MgnHIMMZgWVl/dPpy3rkFAOp85hopLeZ1rz
fJg7fDMrngo=
=o34H
-----END PGP SIGNATURE-----
