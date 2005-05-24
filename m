From: David Masover <ninja@slaphack.com>
Subject: Re: Reiser4 O_DIRECT
Date: Tue, 24 May 2005 18:28:58 -0500
Message-ID: <4293B8BA.20808@slaphack.com>
References: <1116525192.29446.5.camel@zion> <1116578526.3532.463.camel@tribesman.namesys.com> <1695540869.20050521234900@wp.pl> <200505222247.j4MMlr85008867@turing-police.cc.vt.edu> <4291225B.5090503@slaphack.com> <20050523095212.GD11013@nysv.org> <200505231653.j4NGrksq017538@turing-police.cc.vt.edu> <42921886.40404@namesys.com>            <42939E37.8060107@slaphack.com> <200505242155.j4OLt9mD023120@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24133-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200505242155.j4OLt9mD023120@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Valdis.Kletnieks@vt.edu
Cc: Hans Reiser <reiser@namesys.com>, =?UTF-8?B?TWFya3VzIO+/vQ==?= <mjt@nysv.org>, Pysiak Satriani <pysiak.satriani@wp.pl>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Valdis.Kletnieks@vt.edu wrote:
> On Tue, 24 May 2005 16:35:51 CDT, David Masover said:
> 
> 
>>My feeling is that you create the standard as you create the test, not
>>the other way around.  If the test works, then there are by definition
>>few bugs if any in the system itself -- any other bugs are actually in
>>the application, not the system.
> 
> 
> That's even worse.  Then if somebody bodgers it all up with some corner case
> that your test system didn't cover, you're by definition screwed, as the
> standard won't say what it *SHOULD* do....
> 
> Consider the vast philosophical difference between "This is what the FS *should*
> do" and "This is what we tested the FS for".  You want the standard to be the
> first, not the second.....

No, you want them all to be the same thing.  You want "This is what we
tested the FS for" to be broad enough that you really don't have very
many bugs at any stage in development.

But then, I'm being overly optimistic.


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQpO4ungHNmZLgCUhAQKDIg//S5gF75thisHjI7DjzecyVCjhvSJxNIX6
aTljjVP9QjNu85X2q7QFHvqoKL8frrn+nTZ+70gUdN9FQL4S7nn0SbtBED/Rra9A
C2vPDr89yoCOpP1mTVw/0URnDtwV3AmFxwnMYrfz1nfBReCUcYKeY6NBUNeS/eWV
h51FvSc10r7dxsI287svUlxpNTeyySogvjhhTa6C2v1kkLAyvgJ5AEmTDXkE01k9
aaJ+YJgAfgu5l1TRQHpZm9ck7ikBkXqGMrc/+vb6L3AHnMGfbinIDN8x8UD/l7XB
0nF4sgh+h30bjwF08+B5vc6SQeTSKL/L5ZxUg6J3G0GhduS9wAYb5bvGxZUYd79X
Va+/M1kWjFF14o9ORGIfsNDNXxzM1dPL+0JjtnDwnqF2ahuKEYfIq67A4ggRFL3+
HkZb1p4cVi0YaGG39nADEiOOddyL/5vQxIyRgbY/j7gZWORZd3XS0tYGRfyz4lBF
8WLLvoKtO3PEVF89KSFj4nOUR9piIbHt96zEckbX11v4igskl5Uf9VZzTfuUzzlY
Fhr22FPJLCBmYQGljjBguwOExYHbATCPaYjFwl99SHx7XAAc0ezz5qwP+UUMcRUc
riiYaHN0MgSctz3h/D1KeiUvyMjpm2QTKOAw59h0/XB0owfnpovnW9xznPIlu5e4
f4CR1VQPMfI=
=c/WP
-----END PGP SIGNATURE-----
