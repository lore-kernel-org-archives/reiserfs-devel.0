From: David Masover <ninja@slaphack.com>
Subject: Re: ".meta." as a Name Prefix
Date: Tue, 20 Apr 2004 20:00:34 -0500
Message-ID: <4085C7B2.4010104@slaphack.com>
References: <2407572152-BeMail@cr593174-a>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18096-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <2407572152-BeMail@cr593174-a>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Alexander G. M. Smith" <agmsmith@rogers.com>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Alexander G. M. Smith wrote:

| I agree, it needs to start with a period.  I'd also drop the idea
The namespace of beginning with one period is almost as full as that of
no periods, as mentioned before.  Our best bet for uniqueness is to call
it "reiser4metas" or something similar (.r4 or ..r4).

| of having a separate directory for metadata and just use a common
That's what we were doing before.  I didn't like it -- consider the use
on files:

touch foo
chmod +x foo
cd foo/
ls

You either get 'foo/' or an error message.  You do not get a list of all
the pseudo files available.  I'm sorry, but 'cat ..pseudo' just isn't a
viable substitute for ls.

Also, the only disadvantage from the user's point of view is an extra '/'.

| I'm probably repeating myself, but the trouble is that the .meta
| directory isn't a full directory - you can't add attributes to it.
What kind of attributes would you want to add?  And btw, check out what
is currently 'metas/metas'.  I don't know if that's actually functional
or just read-only, but it works.  And I also see no reason why (in raw
uneducated theory) a plugin couldn't be implemented to make it into a
full directory for certain files (and thus losing no functionality for
other files).

| standard GUI file explorer to also check on attributes!  With a
| .meta directory, it seems good in a psychological organizational
| way but it breaks the object model.  That breakage will cause more

It doesn't have to.  Look at how the "pure object-oriented" languages
work.  Many of them make everything some subclass of "object" -- even
classes themselves.  A class is an object of type class.  I'm not sure
how this is implemented in code, but in concept it works fine.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQIXHsngHNmZLgCUhAQLLlw//a6cy5K4mI0OGoDuyTSuaedI9TSy/GHEX
UBWBynKUBQ3CNrTQoQzvfOOZIGJXPvWPSSTS286KVCgXAeiWvjNvPwSReqmuajbl
T5jxHpTxFcU6H3BzKbDiYcpGiqifoRydjkcj5jMJkvW1GNEVHX358IZp3N+PzxE2
NCWqdQoO1+/rt0laxNK5EtGLWX0PD77Qfx/0FNh3/NKCOIEULOkUbXL7CJ3M9AEP
ysKUq5ZLDgqi4MS5YFnkyw95ZireHGKkJC49DmA/dpOvlFJdrCcZfwWjBtbwXk5K
znCTPJZlylSw7C8nFxDAylv5vlz8DNSNzZ0MuxtWQPGbah8FanYdVbaSbf0jmCXc
9uP1FHMGTO7PdhLY5conDiWtHuHFwNt4I3OvVxKzcFCtiRF19i9//mdSZeWt1GL9
xWonh6O7pODQP+C63+SLWGu38S1QgI6MNVSn9BvSiqZ8VaT1mcKrKU4Tp5e15PRp
l/Hr9n9BXeBdl/Pz/wzKnzzxCDQ13kEuZNkpHWw3KfGYokLdoc1yB702kJ6yP9pv
eU1c+1LUSOoaJV+iRfZt9OrJiNT+euHmH/ej+Nc6KXZpxmrPb7j0leery6xyfW+t
bU/jbmn/VcOVfDOyHim9MpIoBhBuvZIAurFyNW04ezMB97D9cj2P1oJHIrHoat6R
W/yNeXayRto=
=TYLn
-----END PGP SIGNATURE-----
