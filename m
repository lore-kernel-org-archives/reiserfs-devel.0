From: David Masover <ninja@slaphack.com>
Subject: Re: searching on groups of files in reiser4
Date: Wed, 27 Apr 2005 16:57:31 -0500
Message-ID: <42700ACB.1050304@slaphack.com>
References: <20050417113856.155b8166.a.nielsen@shikadi.net> <426F934D.504@maya.com> <426FA09D.8090009@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23931-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <426FA09D.8090009@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Nicolas Smallwood <smallwood@maya.com>, reiser <reiserfs-list@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hans Reiser wrote:
> Nicolas Smallwood wrote:
> 
>> Hello,
>>
>> My question concerns searching through a group of files on reiser4.
>> Assume that we are dealing with a directory full of files (say a few
>> million or so).
>>
>> If I am currently viewing a given file, and wish to iterate to the
>> next file in the directory,
>> is there a method to do so without opening the base directory and
>> moving from one
>> directory entry to the next until you find it?
>>
>> In short, are there any constructs to perform a binary search on these
>> directories instead of a slow
>> O(n) search using seekdir or whatever method?
>>
>> Or is some type of plugin our best route?
> 
> 
> We can write some sort of plugin for you, and it will be the best
> solution.  I assume that readdir() does not do what you need because the
> order you need to iterate in is not that of readdir()?  (Your exact
> phrasing would seem to indicate that your needs are met by iterating
> through the directory using readdir() ).

I'm guessing it's got nothing to do with the order of readdir, simply
that to grep through all files in the directory, readdir is the fastest
option.

I think what he's saying is that he wants a way to do

grep foo *

in a directory of 500 files, 1K each, only he wants it to approach the
speed of

grep foo bar

where "bar" is a 500K file.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQnAKy3gHNmZLgCUhAQIWXQ//d+lBV1UrVqlrg4B3Bv5lRTiRZ0ZJFm+R
eRVTPP+30W9wtwZpLXVYSpnfAwYEYWGD2mUiZ1Qrq9OG5E1QcULp8pFfCL7uPNlX
64+RlajsppjJB7XSc0j+xF8qIBCZIgtk+4BTvRug6d2/bhf45iwenmEyWJwSBS78
dMqCNtuAkfFKb6jujGjZOYRkGtSRtZB3LEqFkBQlyR4rHkFxdsNC9JbqnoxZxPqr
p+BBUo5rtuqxUpmeMhcHI2l0NmxTNrpOvMHBelv83ZIN1PkYMMrKl3jfKVbkE/+a
IPBXtgNTf1yWx9q/PiIRncGQHVbwIrouI5YKQZUMjQtGtpermjuy6E3XluqSg9Sn
nqEHln5m6czZefR3vz2UdgxLFBykJYfmvbkOwzjWK7joUDnMpw8ltNkEYH6CY8wE
uDmWbcEneP/N8BFzC9SpH/KPD1OyM0qWY+ydy4U0r/rRZ/gRtvknJUrRRn74BgrZ
X0G8g9eJaStvTNPZUdD44d2Iu+Sv82pv2nA+kg0LR43UHMY6dKq9IfyvdfofYy+f
541q70mUrBdncR3nXdg3+QJbgzlBfk1uCe8EWyU2M7/wSKNmsuuPHj7lNDR1OuqL
SU0qtaKEU1cXA4BEj0IM2l55NnHwsc3t9XSM4eUDRiU3Hl5QmkBrJm3IiUGYo3O5
89BSikQG/K4=
=3jFe
-----END PGP SIGNATURE-----
