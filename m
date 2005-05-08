From: David Masover <ninja@slaphack.com>
Subject: Re: Reiser4 repackers
Date: Sat, 07 May 2005 20:10:18 -0500
Message-ID: <427D66FA.8050803@slaphack.com>
References: <427A0834.7080201@futuretg.com> <427A99C0.2000105@slaphack.com> <1115335902.24839.4.camel@localhost> <427ADAA4.8000407@slaphack.com> <20050506035921.GF8179@gnu.org> <427C46EC.6080009@slaphack.com> <20050507102514.GH8179@gnu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24008-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050507102514.GH8179@gnu.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Clausen <clausen@gnu.org>
Cc: Jonathan Briggs <jbriggs@esoft.com>, "Dr. Giovanni A. Orlando" <gorlando@futuretg.com>, Hans Reiser <reiser@namesys.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



Andrew Clausen wrote:
> On Fri, May 06, 2005 at 11:41:16PM -0500, David Masover wrote:
>
>>>Are you familiar with convertfs?
>>>
>>>	http://members.optusnet.com.au/clausen/ideas/convertfs.txt
>>
>>How easy is it to get the blocklist needed?  It seems like Reiser4's
>>packing doesn't help here...
>
>
> The blocklist is only needed to find the blocks in the nested file,
> which is huge.  (I don't know anything about reiser packing, but
> things like tail-merging aren't a serious problem.)

Yet, it's still a problem.  You want a standardized way to map files to
underlying blocks, and before Reiser4, I'd say this was easy.  But now,
who knows what the FS does to bastardize the file on the way down?
Crypto/compression?  Tail-packing?  Stenography?  The possibilities are
endless...

>>In both of these situations, convertfs seems workable, but overkill.  I
>>mean, a proper resizer would leave the FS in a useable state no matter
>>which way it went or when power was cut.  Convertfs means that if I lose
>>power at any point during the process, I'm very likely hosed, especially
>>with something doing lazy writes like Reiser4 as the original FS.  And
>>this is all assuming it would work at all.
>
>
> You could do journalling in this process.  (This would slow it down
> considerablly, however!)  If you've got some nice gui like qtparted
> on a knoppix live cd, it could be quite convenient.

Compared to the FS knowing how to resize itself?  You'd get to take full
advantage of existing Reiser4 transactions, not to mention the speed of
chopping off unused space vs. rebuilding the entire FS.

>>These are not situations where enterprise users would pay thousands of
>>dollars to be able to do this -- they can afford to do a full
>>backup/restore, just throw hardware at a problem and make it go away.
>>These are the scenario where small users like me tend to give up, back
>>up, reformat, and never touch such an inflexible FS again.
>
>
> Small users are happy to leave their computer overnight.

Maybe you are, but newbies aren't.  Maybe you got it wrong?  Maybe you
got all your stuff moved around properly, but didn't leave room for a
swap partition?  Looks like you have to start over!

Unless the newbies are following a VERY specific recipie or VERY good
tools, this process could easily take a few weeks, instead of a few
hours with the repacker.  And that repacker looks easier to implement
than a noob-proof UI.  Of course, people who know tell me I'm naive on
both counts...

The current situation is not impossible, unless you want real users (not
fanboys) to choose Reiser4 over ANYTHING else.  Why would I choose
Reiser4+convertfs over ReiserFS 3 + resize_reiserfs?  Or even
ntfs+ntfsresize?

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQn1m+ngHNmZLgCUhAQKMnA//WVX4RYXOVQVecJgUaiMLZEFPEiOtio9Y
jw6UT6O1QjRM9g1KHtxED9Mv4BfV6VMuZla5cuvhQpSDCK0t2NOfM9w1LF/ahe5s
+EN1DdlcD4/5R3SP+fbkkWH5tnxbtS65yQqdh29G+cEI670UDo7BtAmNPCiSCbKX
gdK5DqFjBOer6rQR52pBcd3N1+JskafG7OkQJq1jajSBnLeXyf4iQ8Tj9Ue/ABic
0mCKbzByBEYUGkr/S2EghnfaHL1AXR0DVzsb/lVyu7Asgx8qHFc3dHAbsAjiPsaS
4IzoMRmbKE07jxFRkef77hll06v3ex5nwuObRyTcS0cNccDLpXT4lbRC4h9jF1CV
hTHW0eIIO3uuIruzG8gx+JJCuJEUGzLA1jw8sxUkc8vCkRGKmnj7j9fS3m/tsFtw
EudCBKQmW7o3ub97n+kTcuNQ73yRBrLzaAjwynQxNVFc2PHH2WycVVqjwuAqh/R2
xGiXvPyq6KGcDkl14HSdWsplSD3pJtq/R5unLC+EF3LwlyywYeaRu+aYpovVZcVd
0Vrqal72ZxyYd+0TR0ejnFfuOWlb9E3XYRch15IF+k8XAgXu6pH9qrPvA1rslCtY
TRP82kG8CTDvMnpKv5MqCOnFvlMeJ40w4W/0R39z2tVkhwD6okj6fJQXiLLAAuNm
b9bFuyZCXzw=
=FfhY
-----END PGP SIGNATURE-----
