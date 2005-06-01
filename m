From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: File as a directory - VFS Changes
Date: Wed, 1 Jun 2005 14:43:00 +0400
Message-ID: <17053.37172.885941.857716@gargle.gargle.HOWL>
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
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24257-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <17053.36948.892227.432434@gargle.gargle.HOWL>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jonathan Briggs <jbriggs@esoft.com>
Cc: Hans Reiser <reiser@namesys.com>, Valdis.Kletnieks@vt.edu, "Alexander G. M. Smith" <agmsmith@rogers.com>, leocomerford@gmail.com, reiserfs-list@namesys.com, ninja@slaphack.com, Nate Diller <ndiller@namesys.com>

Nikita Danilov writes:

[...]

 > 
 >  > 
 >  > Yes. :-)  It is radical, and the idea is taken from databases.  I
 >  > thought that seemed to be the direction Reiser filesystems were moving.
 >  > In this scheme a name is just another bit of metadata and not
 >  > first-class important information.  The name-query directories would be
 >  > there for traditional filesystem users and Unix compatibility.  They
 >  > would probably be virtual and dynamic, only being created when needed
 >  > and only being persistent if assigned meta-data (extra names (links),
 >  > non-default permission bits, etc) or for performance reasons (faster to
 >  > load from cache than searching every file).
 > 
 > That latter bit, about making them persistent, is where the tr
 > 

[Hmm... grue ate my message.]

That latter bit, about making them persistent, is where the trouble
begins: once queries acquire identity and a place in the file system
name-space, they logically become part of that very name-space they are
querying! This leads to various complication, and you are trying to work
around them by claiming that queries are not _always_ part of name-space
("file1 [only] **appears** to be a child..."). This non-uniform behavior
is a big disadvantage.

Nikita.
