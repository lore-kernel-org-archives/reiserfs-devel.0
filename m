From: Hans Reiser <reiser@namesys.com>
Subject: Re: future r4 maintenance question
Date: Sun, 23 Jul 2006 00:07:47 -0600
Message-ID: <44C31233.9080800@namesys.com>
References: <1992401892.20060722173244@wp.pl> <44C26870.6090200@namesys.com> <1287558327.20060722215128@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29153-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1287558327.20060722215128@wp.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: =?UTF-8?B?TWFjaWVqIFNvxYJ0eXNpYWs=?= <pysiak.satriani@wp.pl>
Cc: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

Maciej So=C5=82tysiak wrote:

>Hello Hans,
>
>Saturday, July 22, 2006, 8:03:28 PM, you wrote:
>
> =20
>
>>We are going to give changing the paradigm a try.  The difference
>>between 4.1-beta and 4.0 is that different plugins are the default, and
>>the experimental code is in the plugins you see when mounting with the
>>mount option 4.1-beta.   Let's see if it works in practice.....
>>   =20
>>
>I Understand. This is good news. Hm, do you think that reiser4's pluggabil=
ity
>is enough to have this single kernel tree (fs/reiser4) for a longer period
>of time.
>
Yes, reiser4 will have a much longer lifetime,  and improvements will
come out in small pieces rather than complete rewrites.  I think we can
add the enhanced semantics one feature at a time.  It was the storage
layer that was the big thing that had to be right before the rest could
proceed.  Now, what remains are a whole lot of incremental improvements
I hope.  If I can make enough money off the repacker or I get funding
from France or some other government and we are able to afford to keep
vs and zam working  on the storage layer, and Nate working on VFS
changes and Peter Foldiak and others at St. Andrews doing semantic
enhancements and Gorazd doing user space browsers things could get very
interesting.....  We need to get into the kernel, and money will
manifest, and programmers can get to work....

> I mean, can you predict a need of spawning something like reiser5
>in the forseeable future or would fs/reiser4 + plugins be enough to do
>away with the "future vision" and other "future *" stuff you've written
>about ? eg. I remember reading about very granular security ACLs like
>restricting a certain line in a file (like /etc/passwd)
> =20
>
Yes, I still want to do that stuff....

Hans

