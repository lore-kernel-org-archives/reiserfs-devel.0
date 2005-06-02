From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: File as a directory - VFS Changes
Date: Fri, 3 Jun 2005 03:54:26 +0400
Message-ID: <17055.39986.10130.284697@gargle.gargle.HOWL>
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
	<17054.57795.295945.256623@gargle.gargle.HOWL>
	<1
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24296-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1117737334.9224.51.camel@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jonathan Briggs <jbriggs@esoft.com>
Cc: Hans Reiser <reiser@namesys.com>, Valdis.Kletnieks@vt.edu, "Alexander G. M. Smith" <agmsmith@rogers.com>, leocomerford@gmail.com, reiserfs-list@namesys.com, ninja@slaphack.com, Nate Diller <ndiller@namesys.com>

Jonathan Briggs writes:
 > On Thu, 2005-06-02 at 14:38 +0400, Nikita Danilov wrote:
 > > Jonathan Briggs writes:
 > >  > On Wed, 2005-06-01 at 21:27 +0400, Nikita Danilov wrote:
 > >  > [snip]
 > >  > > Frankly speaking, I suspect that name-as-attribute is going to limit
 > >  > > usability of file system significantly.
 > 
 > Usability as in features?  Or usability as in performance?

Usability as in ease of use.

[...]

 > 
 > A index is an arrangement of information about the indexed items.  The
 > index contents *belong* to the items.  An index by name?  That name
 > belongs to the item.  An index by date?  Those dates are properties of

In the flat world of relation databases, maybe. But almost nowhere else
improper name is an attribute of its signified: variable is not an
attribute of object it points to, URL is not an attribute of the web
page, block number is not an attribute of data stored in that block on
the disk, etc.

[...]

 > 
 > In the same way that you can descend a directory tree and copy the names
 > found into each item, you can check each item and copy the names found
 > into a directory tree.

Except that as was already discussed resulting directory tree is _bound_
to be inconsistent with "real names".

 > 
 > > 
 > > Indices cannot be reduced to real names (as rename is impossible to
 > > implement efficiently), but real names can very well be reduced to
 > > indices as exemplified by each and every UNIX file system out there.
 > > 
 > > So, the question is: what real names buy one, that indices do not?
 > 
 > By storing the names in the items, cycles become solvable because you
 > can always look at the current directory's name(s) to see where you
 > really are.  Every name becomes absolutely connected to the top of the
 > namespace instead of depending on a parent pointer that may not ever
 > connect to the top.

But cycles are "solvable" in current file systems too: they simply do
not exist there.

 > 
 > If speeding up rename was very important, you can replace every pathname
 > component with a indirect reference instead of using simple strings.
 > Changing directory levels is still difficult.

It is not only speed that will be extremely hard to achieve in that
design; atomicity (in the face of possible crash during rename), and
concurrency control look problematic too.

 > 
 > -- 
 > Jonathan Briggs <jbriggs@esoft.com>
 > eSoft, Inc.

Nikita.
