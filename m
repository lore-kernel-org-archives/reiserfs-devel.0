From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 for windows
Date: Sun, 05 Dec 2004 01:37:15 -0600
Message-ID: <41B2BAAB.5030401@slaphack.com>
References: <20041204211059.41930.qmail@web50908.mail.yahoo.com> <41B287C6.2060902@namesys.com> <41B2C381.5040207@futuretg.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22678-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41B2C381.5040207@futuretg.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Dr. Giovanni A. Orlando" <gorlando@futuretg.com>
Cc: Hans Reiser <reiser@namesys.com>, Job Bob <yzhang2004@yahoo.com>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Dr. Giovanni A. Orlando wrote:
| Hans Reiser wrote:
|
|> I should add that reiser4 for windows would be proprietary.   If they
|> can pay MS, they can pay me, and I see no reason to do free work for MS.
|>
| Hans,
|
|    Despite about this. The MS dominance is going down, and therefore
| have no sense.
|
|    I never suppose  you will  found the same 'good'  enviroment
| including C Compiler
|     filters, and other tools that only UNIX and GNU/Linux offers.

Define "good"?  There's cygwin.  There's also numerous commercial
software development suites.

I'm not advocating Windows development, but the things that are not
"good" are going to be the interfaces one has to deal with when writing
a driver.  No doubt if you get this working and it gets popular (free or
not), MS will change some API thing that only affects you and three
other apps no one cares about, and send it with a "security update".

If I ever develop for Windows, I pray to all that is holy that I will be
able to use some portability toolkit or virtual machine, neither of
which would work very well for a modern FS.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQbK6qngHNmZLgCUhAQKcZw/+K9edryj4cFsxBjn/KtuNXiBvt/1gePFs
sde/MJydtFJE8k0lEYmMdQDOizuF0iUZcyK2wgEsmNUQHVAJifwvrPrF29dpTF/a
bGbAcn4qtWyQvPYUIM1Zf7S07Q1j628P2Vxwiy8v0CMZRfR1gJAnPcJNVARBKEqM
C+WrZgjqt6qUx2yk8cfqDOSQ8z3ABlhrljPymDocIF9texuYrDEGG/dlfuTZwP8z
LSmTL4Hz25v6ahXVLufcashN9xcNLhygX3EO3DSW/+T0UB5iYS3QAhLp/X/wDprB
J74jF97KyrzAF7V14qufRJmxdcbomUWJogWpQsA++m+Vsq1gyxw3aws2HAr/NJdV
LSm3x3Ktv3u6ROs3a3ZyI63oLUwD1GcVC3JsR42zuztyjEjW5rOhBIbGWYCMYa5q
TisQpZwb/bnbBZqNTPJWWOPJyf3+kU7IvZJbAJiPhdUoattr3Ce+2nncule9YVWf
5fUGv6sbd4WMeQ920KtLvEmyL6sZE67fXqwqA2T8M9ZSr7lI4jp5jav53mMlZ3jv
5kZTMSA1JQ8uAola+k3MYoJ5pMnjTM/iFpUrQY77jNCUUhAscu3vdXSjfkG1bSpr
Ced4PfeiHtFqsWrLQZOSQVtA8hCm9zDjSk6LY3F1l6hvyoIkzXIF/s1TmuF8266z
/GcKixV3rR4=
=p/Ux
-----END PGP SIGNATURE-----
