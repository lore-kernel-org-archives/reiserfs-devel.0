From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: File as a directory - VFS Changes
Date: Wed, 1 Jun 2005 18:42:39 +0400
Message-ID: <17053.51551.825703.450388@gargle.gargle.HOWL>
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
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24265-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1117634812.26560.33.camel@titania.zlynx.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jonathan Briggs <jbriggs@esoft.com>
Cc: Hans Reiser <reiser@namesys.com>, Valdis.Kletnieks@vt.edu, "Alexander G. M. Smith" <agmsmith@rogers.com>, leocomerford@gmail.com, reiserfs-list@namesys.com, ninja@slaphack.com, Nate Diller <ndiller@namesys.com>

Jonathan Briggs writes:
 > On Wed, 2005-06-01 at 14:43 +0400, Nikita Danilov wrote:
 > > Nikita Danilov writes:

[...]

 > > 
 > > That latter bit, about making them persistent, is where the trouble
 > > begins: once queries acquire identity and a place in the file system
 > > name-space, they logically become part of that very name-space they are
 > > querying! This leads to various complication, and you are trying to work
 > > around them by claiming that queries are not _always_ part of name-space
 > > ("file1 [only] **appears** to be a child..."). This non-uniform behavior
 > > is a big disadvantage.
 > 
 > In this scheme, query objects were always part of the name-space.

Then, paths visible through queries are inconsistent with names of
underlying objects. You querying system returns fake results
("/tmp/A/B/C/A/file1") that are not present in the database queries are
ran against. This is *wrong*. Nobody is going to tolerate DBMS that
sometimes returns extra rows in SELECT statement, right?

[...]

 > 
 > The user is responsible for sensible naming.   Under normal use, a user
 > would hardly notice the difference between traditional directories and
 > this name-query system.  

Heh, this assumes that users will continue to use new namespace as they
use old one. Which is not true. Usage is determined by features
provided. This is, by the way, one of driving forces behind reiserfs
support for small files and large directories.

If file system provides ability to create namespaces in the form of
arbitrary graphs, this will be used.

Nikita.
