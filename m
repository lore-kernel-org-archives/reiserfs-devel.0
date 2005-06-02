From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: File as a directory - VFS Changes
Date: Thu, 2 Jun 2005 13:11:05 +0400
Message-ID: <17054.52521.798502.981907@gargle.gargle.HOWL>
References: <17050.62052.318426.711322@gargle.gargle.HOWL>
	<75229416615-BeMail@cr593174-a>
	<17052.12223.708707.757538@gargle.gargle.HOWL>
	<429C7D0A.6040200@namesys.com>
	<200505311630.j4VGUeIt007432@turing-police.cc.vt.edu>
	<1117558515.13252.21.camel@localhost>
	<17052.43941.64870.716568@gargle.gargle.HOWL>
	<429CADA4.4070600@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24280-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <429CADA4.4070600@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Jonathan Briggs <jbriggs@esoft.com>, Valdis.Kletnieks@vt.edu, "Alexander G. M. Smith" <agmsmith@rogers.com>, leocomerford@gmail.com, reiserfs-list@namesys.com, ninja@slaphack.com

Hans Reiser writes:
 > What about if we have it that only the first name a directory is created
 > with counts towards its reference count, and that if the directory is
 > moved if it is moved from its first name, the new name becomes the one
 > that counts towards the reference count?   A bit of a hack, but would work.

This means that list of names has to be kept together with every object
(to find out where "true" reference has to be moved). And this makes
rename of directory problematic, as lists of names of all directory
children have to be updated.

 > 
 > Hans

Nikita.
