From: David Masover <ninja@slaphack.com>
Subject: Re: Fibration questions
Date: Wed, 21 Jul 2004 01:20:55 -0500
Message-ID: <40FE0B47.3010600@slaphack.com>
References: <20040721054418.1150715C23@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19717-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040721054418.1150715C23@mail03.powweb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Dabbs <david@dabbs.net>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1




David Dabbs wrote:
|>|>
|>|>I must not understand fibration.  Do you have to know the fibration of
|>|>an object to find it?
|>|>
|>|
|>| Fibration is simply a means to physically group together filesystem
|>objects
|>=>> MEGA SNIP <<=
|>
|>So, what you're trying to say is, yes, because it's part of the key?
|>
|
|
| No, not really, at least you (as a filesystem client) don't specify the
| fibration when searching for an object. Yes, when the key is generated, of
| course the fibration bits matter, but they simply come from a blackbox
| plugin function that simply operates on the name and which may differ per

Thus, a fibration plugin must rely on the name to decide how to fibrate
something, because at lookup time, this plugin is asked "I'm looking for
a file named foo, how is that fibrated?"

| directory. As Hans pointed out, there may be an opportunity to offer some
| explicit support for * via the syscall interface -- as to whether or
not the
| implementation would even involve fibration is open for discussion.

It might.  If I'm looking for *.foo and fibration is by last character
in filename, then the system knows to only look in the *o files.

So it's an optimization for it to involve fibration.  But whether it
could be done elegantly, I don't pretend to know.

| It seems like we are violently agreeing, as my father sometimes says.
I too
| think it would be great to have an enhanced or more structured typing
| system. And it would be interesting to work on at some point, but not just
| yet, for me at least. There's still so much to learn about what's here.

I agree.  I'd much rather get the practical things done -- a stable
release, inclusion in distros, patches to common apps.

Also, I think I want to reimplement (a subset of) Lustre using reiser4
as a cache.  If I do any coding, it'll be on that.

| Anyway, I've kind of lost track of what it is you were looking to
accomplish
| in the thread.

So far, I'm experimenting with ideas.  My real goal is to learn, because
in the months that I've been on this list, I've discovered two things:

It's usually fine the way it is.

The best way to learn more about it is to suggest a change.

If I stumble on a *good* change idea, so much the better!



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQP4LR3gHNmZLgCUhAQJpRw//bbqBxze7wagRp1x7pIpIRc6udlYLzK2S
db3bGJwfcEcznENearTC8jn1D/Jf8IIHKpIK0evoaacndMQbxUOun+Aihuf8fbA2
PZPGgsTHgCXDJFYAIhLVFCSJ5D4gw8KsGRi5YLTLmoc0rE1bxNGhXEkLJ0ZSDkpx
dtsUnDxCCiui/lZ5WEf7HqeMFiUA7395X9DTfi96UcbgqwanBXv/UTs876r8W1au
9MzcY9S9sArROFRPr6O7NWfqj7Hn22AFaR1CIq8xpdh8DkUf3bwgVrwten2IJxJT
ZlbM/1R1o+qUYydRtCf0S0S4whyWfVkHNjAdw6TtwFoqzT9JMV6FGZFIJpF2dSbA
FZNPK0fYDxBoDgdlGXoCmF+P5wEaWL/rptGQy/iWGwCwWGGbFhclwUKJHjhxnNo7
u9L50jUMS93lXgH4paOFgjpuGII0bRRtpdCsev7apGYADirXpCo7HwU9yplT+7aa
FCm1CmpQp81/J+q9X9xfgHShU+yMPAAzgJcaCzm0qEM/imS63D2RwNs1uyiKZm/R
pMwyCdALWPJL4R6s+97IN9LviAGFQIgxh8/4iV6DINC1m+ukH80B3glBh92v3+Ed
5KHYS9n4WtBIqu4lXDCDkFMQqLEMglU4Wgx357x+tvXO5iUGunZXi0CB2mVoGZ2f
tbLco4gTnd0=
=OA/E
-----END PGP SIGNATURE-----
