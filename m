From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: File as a directory - VFS Changes
Date: Sat, 4 Jun 2005 23:45:05 +0400
Message-ID: <17058.1217.672209.187032@gargle.gargle.HOWL>
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
Return-path: <reiserfs-list-return-24308-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42A099F6.20208@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Jonathan Briggs <jbriggs@esoft.com>, Valdis.Kletnieks@vt.edu, "Alexander G. M. Smith" <agmsmith@rogers.com>, leocomerford@gmail.com, reiserfs-list@namesys.com, ninja@slaphack.com, Nate Diller <ndiller@namesys.com>

Hans Reiser writes:
 > Nikita Danilov wrote:
 > 
 > >
 > >But cycles are "solvable" in current file systems too: they simply do
 > >not exist there.
 > >  
 > >
 > Yes, but Nikita, cycles represent semantic functionality that has value
 > because being able to embody more expressions means more power of

If you mean that multiple parents have some value, I agree. Problem is
that solutions proposed so far have severe limitation:

 - they add support for cycle detection that is necessary to support
 multiple parents, but that support is only efficient for "small"
 datasets: when total number of objects is not very big, and "average"
 object has only one parent.

 - even when there are no multiple parents, system is not efficient for
 large number of files.

 > expression.  If some way can be found to allow them, then functionality
 > is increased. Separating links that increase reference count from links
 > that merely point (ala hard vs. sym links) is one approach.  If there
 > was effective enough for real world use cycle detection, that would be
 > better.

It seems to me that in the domains where proposed designs are
applicable, symlinks already provide viable solution.

Nikita.
