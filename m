From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: File as a directory - VFS Changes
Date: Wed, 1 Jun 2005 21:27:53 +0400
Message-ID: <17053.61465.359382.791640@gargle.gargle.HOWL>
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
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24268-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1117640452.12866.9.camel@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jonathan Briggs <jbriggs@esoft.com>
Cc: Hans Reiser <reiser@namesys.com>, Valdis.Kletnieks@vt.edu, "Alexander G. M. Smith" <agmsmith@rogers.com>, leocomerford@gmail.com, reiserfs-list@namesys.com, ninja@slaphack.com, Nate Diller <ndiller@namesys.com>

Jonathan Briggs writes:

[...]

 > 
 > However, query directories (or "smart folders") will have this namespace
 > problem in every case and there is no avoiding it.  If the query is for
 > every file modified in the past day, the file path through the query
 > directory is not going to match any given name of the file.  Same for
 > keyword queries, ownership queries, or whatever.

Which I think exactly points to one fundamental problem with the idea
that names are attributes of object: this idea is incompatible with the
notion of dynamically created "views" that in effect add new paths
through which objects are reachable. These paths _are_ names as far as
user is concerned (after all names exist to reach objects), but they are
not in the name-as-attribute model.

 > 
 > In the traditional directory system, a file doesn't have an official
 > name, just links to it from directory entries.  Perhaps if you think of
 > the proposed "name" meta-data as a "preferred name" the idea would work
 > better for you?

Frankly speaking, I suspect that name-as-attribute is going to limit
usability of file system significantly.

Note, that in the "real world", only names from quite limited class are
attributes of objects, viz. /proper names/ like "France", or "Jonathan
Briggs". Communication wouldn't get any far if only proper names were
allowed.

Nikita.
