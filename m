From: The Amazing Dragon (Elliott Mitchell) <ehem@cs.pdx.edu>
Subject: Re: Re: duplicate files and recent changes
Date: Fri, 7 Jun 2002 01:11:30 -0700 (PDT)
Message-ID: <200206070811.g578BUtA008730@sirius.cs.pdx.edu>
References: <87ofeo70st.fsf@labatt.uhoreg.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10664-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <87ofeo70st.fsf@labatt.uhoreg.ca> from "Hubert Chan" at Jun 06, 2002 01:51:46 PM
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hubert Chan <hubert@uhoreg.ca>
Cc: reiserfs-list@namesys.com

> From: Hubert Chan <hubert@uhoreg.ca>
> >>>>> "Valdis" =3D=3D Valdis Kletnieks <Valdis.Kletnieks@vt.edu> writes:
> 
> Valdis> On Thu, 06 Jun 2002 13:25:05 +0400, Oleg Drokin said:
> >> But MD5 may be identical for different files.
> 
> Valdis> Only a 2**128 chance of that.  If you know a way to force a hash
> Valdis> collision more frequently than that, the crypto world wants to
> Valdis> hear from you.. ;)
> 
> You probably wanted to say "one in 2**128 chance".  2**128 is a pretty
> big probability that it would happen! :-)
> 
> Technically, the probability is actually somewhere between one in 2**128
> and one in 2**127 (depending on how many files you have), due to the
> birthday attack.  But one in 2**127 is still pretty small.

Wrong. I'm not going to claim I've got the right factor for how badly the
birthday attack mangles the probability, but I believe 2**64 gives you
around a 50% chance of finding a matching pair. At 2**127 you've got
better than a 99% chance of having at least one collision. Still, even
2**64 is a *lot* of files/blocks (I'd tend to compare the files to ensure
they're identical prior to merging).


--
|\__/|\__/|\______          --=> 8-) EHM <=--          ______/|\__/|\__/|
\    |    |       | EHeM@cs.pdx.edu      PGP 8881EF59 |       |    |    /
  \   \   | ______| -O #include <stddisclaimer.h> O-  |______ |   /   /
    \___\_|/82 04 A1 3C C7 B1 37 2A   E3 6E 84 DA 97 4C 40 E6\|_/___/


