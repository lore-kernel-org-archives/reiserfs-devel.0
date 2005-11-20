From: Leo Comerford <lrc1@st-andrews.ac.uk>
Subject: Re: File as a directory - file-as-dir vs. link-dirs (again) - 3/3
Date: Sun, 20 Nov 2005 22:35:01 +0000
Message-ID: <ff8010840511201435q61383637i2d7d107a82ce7c@mail.gmail.com>
References: <ff8010840511171942x2ae2ebd0m954209103da18740@mail.gmail.com>
	 <878xvlqqhv.fsf@evinrude.uhoreg.ca>
	 <ff8010840511192303o7c581368o119b68d78b2fe722@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-27039-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: leocomerford@gmail.com
In-Reply-To: <ff8010840511192303o7c581368o119b68d78b2fe722@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hubert Chan <hubert@uhoreg.ca>
Cc: reiserfs-list@namesys.com

(Apologies for email snafu - hit the wrong button.)

Difference 2 can also be left aside for now.

3) Say we just used standard directories to indicate relations. Then
if a user comes across  these "names" -

/(something)/father-son
/(something)/father-son/aardvark
/(something)/father-son/aardvark/son
/(something)/father-son/aardvark/father

- while browsing the filesystem she can use her common sense to guess
that /(something)/father-son expresses a father-son relation.
'father-son' likely suggests a relationship between fathers and sons,
and indeed /(something)/father-son/aardvark has children called father
and son. Pretty obvious. Similarly, if she comes across

/usr/bin
/usr/bin/alpha
/usr/bin/bravo
[etc. etc.]

, if she is familiar with Unix she will know that /usr/bin/ indicates
user binaries. Every (non-directory) file in /usr/bin/ isA '/usr/bin',
a user binary. (Also, common sense might suggest that /usr/bin/ has so
many children that it's unlikely to be one giant relationship.) But
what if she comes across

/(something)/mumble
/(something)/mumble/thingy/alpha
/(something)/mumble/thingy/bravo

? Is alpha a '/(something)/mumble/thingy', or is it in the 'alpha'
role of a '/(something)/mumble' relationship with another file? (Or it
could be in the 'thingy/alpha' role of a '/(something)' relationship.)

This matters a lot. The distinction between being a foo and being a
party in a foo relationship is clear and important. For example, there
is a big difference between being a marriage and being a married
person. So we need to know which one is meant. What's more, we need to
be *told*, because the other two solutions - guessing and knowing
already - aren't good enough. The person who created
/(something)/mumble/thingy would be able to tell us that if only she
had some way of indicating to us that we should interpret
/(something)/mumble/thingy as an instance of a relation. And that is
(to a first approximation) all that link-directories are - directories
with a simple binary flag set at creation time to indicate how they
should be interpreted.

Leo.
--
Leo Richard Comerford - http://www.st-and.ac.uk/~lrc1 - accept no namesakes=
 :)
