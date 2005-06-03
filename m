From: Hans Reiser <reiser@namesys.com>
Subject: Re: File as a directory - VFS Changes
Date: Fri, 03 Jun 2005 10:57:10 -0700
Message-ID: <42A099F6.20208@namesys.com>
References: <17050.62052.318426.711322@gargle.gargle.HOWL>	<75229416615-BeMail@cr593174-a>	<17052.12223.708707.757538@gargle.gargle.HOWL>	<429C7D0A.6040200@namesys.com>	<200505311630.j4VGUeIt007432@turing-police.cc.vt.edu>	<1117558515.13252.21.camel@localhost>	<429C97F9.8000009@namesys.com>	<1117559594.13252.26.camel@localhost>	<429CAC86.3080308@namesys.com>	<1117573285.13252.63.camel@localhost>	<1117573714.13252.69.camel@localhost>	<17052.59096.785042.935234@gargle.gargle.HOWL>	<1117580508.25017.21.camel@localhost>	<17053.36948.892227.432434@gargle.gargle.HOWL>	<17053.37172.885941.857716@gargle.gargle.HOWL>	<1117634812.26560.33.camel@titania.zlynx.org>	<17053.51551.825703.450388@gargle.gargle.HOWL>	<1117640452.12866.9.camel@localhost>	<17053.61465.359382.791640@gargle.gargle.HOWL>	<1117652606.28827.7.camel@localhost>	<17054.57795.295945.256623@gargle.gargle.HOWL>	<1117737334.9224.51.cam
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24302-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <17055.39986.10130.284697@gargle.gargle.HOWL>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nikita Danilov <nikita@clusterfs.com>
Cc: Jonathan Briggs <jbriggs@esoft.com>, Valdis.Kletnieks@vt.edu, "Alexander G. M. Smith" <agmsmith@rogers.com>, leocomerford@gmail.com, reiserfs-list@namesys.com, ninja@slaphack.com, Nate Diller <ndiller@namesys.com>

Nikita Danilov wrote:

>
>But cycles are "solvable" in current file systems too: they simply do
>not exist there.
>  
>
Yes, but Nikita, cycles represent semantic functionality that has value
because being able to embody more expressions means more power of
expression.  If some way can be found to allow them, then functionality
is increased. Separating links that increase reference count from links
that merely point (ala hard vs. sym links) is one approach.  If there
was effective enough for real world use cycle detection, that would be
better.

> > 
> > If speeding up rename was very important, you can replace every pathname
> > component with a indirect reference instead of using simple strings.
> > Changing directory levels is still difficult.
>
>It is not only speed that will be extremely hard to achieve in that
>design; atomicity (in the face of possible crash during rename), and
>concurrency control look problematic too.
>
> > 
> > -- 
> > Jonathan Briggs <jbriggs@esoft.com>
> > eSoft, Inc.
>
>Nikita.
>
>
>  
>

