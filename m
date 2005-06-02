From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: File as a directory - VFS Changes
Date: Thu, 2 Jun 2005 14:38:59 +0400
Message-ID: <17054.57795.295945.256623@gargle.gargle.HOWL>
References: <17050.62052.318426.711322@gargle.gargle.HOWL>
	<75229416615-BeMail@cr593174-a>
	<17052.12223.708707.757538@gargle.gargle.HOWL>
	<429C7D0A.6040200@namesys.com>
	<200505311630.j4VGUeIt007432@turing-police.cc.vt.edu>
	<1117558515.13252.21.camel@localhost>
	<429C97F9.8000009@namesys.com>
	<1117559594.13252.26.camel@localhost>
	<429CAC86.3080308@namesys.com>
	<1117573285.13252.63.camel@localhost>
	<1117573714.13252.69.camel@localhost>
	<17052.59096.785042.935234@gargle.gargle.HOWL>
	<1117580508.25017.21.camel@localhost>
	<17053.36948.892227.432434@gargle.gargle.HOWL>
	<17053.37172.885941.857716@gargle.gargle.HOWL>
	<1117634812.26560.33.camel@titania.zlynx.org>
	<17053.51551.825703.450388@gargle.gargle.HOWL>
	<1117640452.12866.9.camel@localhost>
	<17053.61465.359382.791640@gargle.gargle.HOWL>
	<1117652606.28827.7.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24282-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1117652606.28827.7.camel@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jonathan Briggs <jbriggs@esoft.com>
Cc: Hans Reiser <reiser@namesys.com>, Valdis.Kletnieks@vt.edu, "Alexander G. M. Smith" <agmsmith@rogers.com>, leocomerford@gmail.com, reiserfs-list@namesys.com, ninja@slaphack.com, Nate Diller <ndiller@namesys.com>

Jonathan Briggs writes:
 > On Wed, 2005-06-01 at 21:27 +0400, Nikita Danilov wrote:
 > [snip]
 > > Frankly speaking, I suspect that name-as-attribute is going to limit
 > > usability of file system significantly.
 > > 
 > > Note, that in the "real world", only names from quite limited class are
 > > attributes of objects, viz. /proper names/ like "France", or "Jonathan
 > > Briggs". Communication wouldn't get any far if only proper names were
 > > allowed.
 > > 
 > > Nikita.
 > 
 > Bringing up /proper names/ from the real world agrees with my idea
 > though! :-)

I don't understand why if you are liberty to design new namespace model
from scratch (it seems POSIX semantics are not binding in our case), you
are going to faithfully replicate deficiencies of natural languages.

It is common trait in both science and engineering that when two flavors
of the same functionality (real names vs. indices) arise, an attempt is
made to reduce one of them to another, simplifying the system as a
result.

In our case, motivation to reduce one type of names to another is even
more pressing, as these types are incompatible: in the presence of
cycles or dynamic queries, namespace visible through the directory
hierarchy is different from the namespace of real names.

Indices cannot be reduced to real names (as rename is impossible to
implement efficiently), but real names can very well be reduced to
indices as exemplified by each and every UNIX file system out there.

So, the question is: what real names buy one, that indices do not?

[...]

 > -- 
 > Jonathan Briggs <jbriggs@esoft.com>
 > eSoft, Inc.

Nikita.
