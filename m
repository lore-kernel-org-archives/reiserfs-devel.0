From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: File as a directory - back to predicates
Date: Mon, 05 Sep 2005 21:05:18 -0400 EDT
Message-ID: <22495652651-BeMail@AlexDualP3>
References: <ff80108405082323511225c1f6@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25869-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <ff80108405082323511225c1f6@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

Leo Comerford wrote on Wed, 24 Aug 2005 07:51:19 +0100:
> Firstly, I apologise for the absurdly late reply!

That's OK, my reply is also a bit late due to summer vacations.

> One workaround is to append a different, meaningless extra segment to
> each of their date_taken path"names", so one photo is
> /(whatever)/date_taken/2004/3/4/aardvark while the other is
> /(whatever)/date_taken/2004/3/4/zebra

That reminds me of what I did for the experimental RAM file system.  When you
viewed one of the indices (such as one for a date attribute), it stuck on a
clunky unique serial number (inode actually) string after the string version
of the values.

Mon Sep  5 20:31:24 55 /RAMDisk/.Indices>ls -l last_modified
total 1638
lrwxrwxrwx   0 agmsmith agmsmith        2 Sep 10  2001 1000158923000000 #604cb708 -> /RAMDisk/PineappleData/news/Servers/NLZ/music.in_fidelity
lrwxrwxrwx   0 agmsmith agmsmith        2 Sep 10  2001 1000159028000000 #609da6d8 -> /RAMDisk/PineappleData/saved/Keepsakes/PM999697.pmf
lrwxrwxrwx   0 agmsmith agmsmith        2 Sep 10  2001 1000159085000000 #609d5638 -> /RAMDisk/PineappleData/saved/Keepsakes/PM999691.pmf

The indice's entry of "1000158923000000 #604cb708" corresponds to a date of
1000158923000000 microseconds since 1970 (BeOS kernel doesn't have time zone
conversion code or date printing - thus the raw number string) with a
uniqifier of "#604cb708", just in case multiple files have the same date.

> The search "list by title the photos taken in 2004" (that is, list
> the opaque descendants of /(whatever)/date_taken/2004/ by their
> entries in /(whatever)/title/ ) will produce something like:
> 
> My\ cat\ Socks My\ dog\ Spot My\ gerbil\ Patch My\ turtle\ Alberich

I wouldn't split up the date parts.  They should be one value, so that range
comparisons can work nicely.  That would make finding all files between
December 12 2005 and January 7 2005 an easy less than and greater than
comparison, not some recursive horror.

> Finally, what if the value in one of the registry's name-value pairs
> is /not/ a string? For example, what if a photo object has a
> name-value pair named "thumbnail" whose value is an image file?

In my system all indexed attributes were converted to strings for display and
naming.  Ideally ones that make sense - like readable numbers for numeric ones.
Each attribute raw type (string, int16, int32, float, etc) had functions for
converting it to a string and back.  Pure binary and unknown ones would be
represented as a binary dump of the first few hundred bytes, plus the uniquer -
good enough to find the same file if you use that as the filename to open when
in the index "directory".  Indeed, that clunky uniquer is needed if you wish
to reuse the resulting file names without ambiguity.  Hans has a fancier
naming system, but this is what I had to do to cram indices into the Posix
naming system.

In the other direction, data to metadata (m-d vs d-m is a good concept to
focus the argument around - thanks for pointing it out), you just open the
file as a directory and look inside to see the attributes (date modified,
thumbnail, etc) for that file.  In BeOS there's a separate API for that;
with files as directories, it could be elegantly avoided.

The one big difference is that your scheme somehow has split attribute keys.
The photo is filed under 2004/March, sort of like having a key of years and a
sub-key of months.  Databases do have composite keys, made by concatenating
multiple fields.  Is this useful for general purpose attributes?  I think not,
since you could simulate the effect with a multiple key query, like finding
files where "year_modified==2004 && month_modified==3".  Thus keeping it simpler
(a flat list of all indexed metadata (the .Indices directory in the example))
works well enough.  Otherwise I'd have to have indices in indices or something
else weird.

michael chang wrote on Fri, 2 Sep 2005 11:57:20 -0400:
> Could it end up being a user-space/high-level library?  Manually
> implementing this as it is will have sucky performance anyways.  The
> idea would be to discourage it's use unless it's necessary, at least
> on older FSes.  Then the API wouldn't get adopted, however.

Sounds like LibFerris.  http://witme.sourceforge.net/libferris.web/  If everyone
uses it, fine.  But to get everyone to use it, it's better if the functionality
is in the file system.  Then metadata queries can be used by common tools, like
"ls", "grep" or even "cd".

- Alex
