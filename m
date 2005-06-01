From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: File as a directory - VFS Changes
Date: Wed, 1 Jun 2005 14:39:16 +0400
Message-ID: <17053.36948.892227.432434@gargle.gargle.HOWL>
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
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24255-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1117580508.25017.21.camel@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jonathan Briggs <jbriggs@esoft.com>
Cc: Hans Reiser <reiser@namesys.com>, Valdis.Kletnieks@vt.edu, "Alexander G. M. Smith" <agmsmith@rogers.com>, leocomerford@gmail.com, reiserfs-list@namesys.com, ninja@slaphack.com, Nate Diller <ndiller@namesys.com>

Jonathan Briggs writes:
 > On Wed, 2005-06-01 at 02:36 +0400, Nikita Danilov wrote:

[...]

 > > 
 > > One problem with the above is that directory structure is inconsistent
 > > with lists of names associated with objects. For example, file1 is a
 > > child of /tmp/A/B/C/A, but Object 1001 doesn't list /tmp/A/B/C/A/file1
 > > among its names.
 > 
 > file1 *appears* to be a child because it is actually returned as the
 > query result for its name of /tmp/A/file1 because A is a query

I beg your pardon, but this is confusing. Objects have "real" names that
are stings attached to them. User, on the other hand, accesses objects
through paths in directory hierarchy which is just a way to execute
queries on real-names. But some paths do correspond to real-names and
same do not? I, personally, would be very wary to use such a behavior as
a fundamental model of file system.

Also, if directories are just queries, it is not clear why they have
real-names on their own. For example, what does it mean, for object O1
(a directory) to have a real-name "/a/b", and to return ("c" -> O2) as a
part of query result, where O2 has only one name, viz. "/d/e"?

Basically, without some extra restrictions, your model doesn't provide
consistency between user visible paths, and hidden real-names, which
makes it not very useful in the practice, I am afraid.

 > for /tmp/A/.  If the shell was smart enough to normalize its path by
 > asking the directory for its name, it would know that /tmp/A/B/C/A
 > was /tmp/A.   

/tmp/A/B/C/A may have other names beyond /tmp/A, which one to choose?

 >               But yes, a stupid program could be confused by the
 > difference between names.

A _user_ will most definitely be confused, which is much more important.

[...]

 > 
 > Moving an object with "mv" would change its name.  Moving a top-level
 > directory like /usr would require visiting every object starting
 > with /usr and doing an edit.  A compression scheme could be used where
 > the most-used top-level directory names were replaced with lookup
 > tables, then /usr could be renamed just once in the table.

Heh, you just invented good old directories, by the way.

[...]

 > 
 > Yes. :-)  It is radical, and the idea is taken from databases.  I
 > thought that seemed to be the direction Reiser filesystems were moving.
 > In this scheme a name is just another bit of metadata and not
 > first-class important information.  The name-query directories would be
 > there for traditional filesystem users and Unix compatibility.  They
 > would probably be virtual and dynamic, only being created when needed
 > and only being persistent if assigned meta-data (extra names (links),
 > non-default permission bits, etc) or for performance reasons (faster to
 > load from cache than searching every file).

That latter bit, about making them persistent, is where the tr
