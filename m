From: "Fabiano Reis" <silos.reis@ig.com.br>
Subject: Re: mount hang on kernel 2.6
Date: Mon, 8 Mar 2004 09:47:51 -0300
Message-ID: <007801c4050b$91aa1b00$3f32a8c0@ds.ig.com.br>
References: <20040307_223203_003004.silos.reis@ig.com.br> <1078700846.25077.205.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-17118-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com


Good point. I will try it.

Thanks!

----- Original Message -----=20
From: "Chris Mason" <mason@suse.com>
To: "Fabiano Reis" <silos.reis@ig.com.br>
Cc: <reiserfs-list@namesys.com>
Sent: Sunday, March 07, 2004 8:07 PM
Subject: Re: mount hang on kernel 2.6


> On Sun, 2004-03-07 at 17:32, Fabiano Reis wrote:
> > Hi list,
> >
> > I=B4m having problems to mount a reiserfs filesystem using kernel 2.6.3=
 on
> > RedHat 9.
> >
> > The fs I=B4m trying to mount was formated using kernel 2.4.20-24.9 (the
latest
> > kernel for RH9) with ReiserFS version 3.6.25 (from dmesg) and
reiserfsprogs
> > 3.6.4 (from reiserfsck -v command)
> >
> > I upgraded to kernel 2.6.3 (rpm from
> > http://people.redhat.com/arjanv/2.6/RPMS.kernel/)
> >
> > The symptom: When I execute the command
> >
>
> Can you reproduce with a vanilla or -mm kernel?
>
> -chris
>
>
>

