From: =?UTF-8?Q?Grzegorz_Ja=C5=9Bkiewicz?= <gryzman@gmail.com>
Subject: Re: [PATCH] make fs/reiser4/search.c compile with gcc 4.0
Date: Wed, 22 Sep 2004 21:03:45 +0200
Message-ID: <2f4958ff0409221203524cabb9@mail.gmail.com>
References: <2f4958ff0409221145524aed7b@mail.gmail.com>
	 <200409221859.i8MIxb7h014797@turing-police.cc.vt.edu>
Reply-To: =?UTF-8?Q?Grzegorz_Ja=C5=9Bkiewicz?= <gryzman@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21876-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200409221859.i8MIxb7h014797@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "valdis.kletnieks@vt.edu" <valdis.kletnieks@vt.edu>
Cc: reiserfs-list@namesys.com

On Wed, 22 Sep 2004 14:59:37 -0400, valdis.kletnieks@vt.edu
<valdis.kletnieks@vt.edu> wrote:
> On Wed, 22 Sep 2004 20:45:55 +0200, =?UTF-8?Q?Grzegorz_Ja=C5=9Bkiewicz?= said:
> 
> > I know gcc 4.0 is still in it's alphas.
> > Obvious solution is to move function declared in other function
> > up-wards. Since it's static anyway, it won't make any diffrence.
> > Please consider applying to repo.
> 
> I'm not sure it's a good idea to be trying to "fix" reiser4 code to compile
> with an alpha compiler, at least without a *very* firm commitment from the gcc
> crew that this *is* a real error in the reiser4 code and not a bug in gcc
> causing a spurious message.
> 
> Why does this code compile cleanly with gcc 3.x and fail with a 4.0 alpha?
> Without knowing that, it's *STUPID* to change the code to suit the alpha...

This code uses stuppid gcc extension, that is not present in gcc 4.0.
There is no reason to keep it that way in sources, at least I didn't found any.
Function is static anyway, so symbos are not going to be exported.
The fact that gcc 4.0 is not compiling it, is just another excuse to move it.
There is at least one more that kinda bug in kernel.

-- 
GJ
