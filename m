From: Valdis.Kletnieks@vt.edu
Subject: Re: Fibration questions
Date: Fri, 23 Jul 2004 18:42:26 -0400
Message-ID: <200407232242.i6NMgQdk006184@turing-police.cc.vt.edu>
References: <20040721054418.1150715C23@mail03.powweb.com> <40FE0B47.3010600@slaphack.com> <40FF74BA.1050206@namesys.com> <16639.45062.695014.910604@laputa.namesys.com> <20040722143909.GE4990@nysv.org> <200407221957.i6MJvWHB028798@turing-police.cc.vt.edu> <20040722210515.GH4990@nysv.org> <200407222136.i6MLahRF015248@turing-police.cc.vt.edu>
            <20040723092849.GK4990@nysv.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-1908456612P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19779-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Fri, 23 Jul 2004 12:28:49 +0300."
             <20040723092849.GK4990@nysv.org> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Markus =?UNKNOWN?Q?T=F6rnqvist?= <mjt@nysv.org>
Cc: reiserfs-list@namesys.com

--==_Exmh_-1908456612P
Content-Type: text/plain; charset=us-ascii

On Fri, 23 Jul 2004 12:28:49 +0300, Markus =?UNKNOWN?Q?T=F6rnqvist?= said:

> I think desktops for all the Joe Q. Averages are pretty much a different
> scene from servers..

It's not as different as you might think.  Remember in most corporations that use
Active Directory, all the infrastructure boxes (domain controllers, etc) are Windows
boxes too.  Quite recently, an amazing number of webservers got 0wned because
somebody browsed the net using IE while logged on at the server console....

> >And how many times has the global RAM market been put under severe strain
> >because the latest Windows upgrade needed more RAM, so everybody went out and
> >bought more RAM, and more RAM, and more RAM...
> 
> But Windows isn't the only thing that starts requiring more RAM, and
> if you can buy more for a lesser price, that's what you'll do, regardless.

No, the price of RAM went *UP*, dramatically, because demand was higher
than supply, so you were buying less for a higher price.

The point is that the manufacturers of RAM and systems had *no* incentive
to do anything to stop it.

"Microsoft is expected to recommend that the "average" Longhorn PC feature a
dual-core CPU running at 4 to 6GHz; a minimum of 2 gigs of RAM; up to a
terabyte of storage; a 1 Gbit, built-in, Ethernet-wired port and an 802.11g
wireless link; and a graphics processor that runs three times faster than those
on the market today."

http://www.microsoft-watch.com/article2/0,1995,1581842,00.asp

Now *try* to convince me that the Dell and HP saw this, and their first thought
was "Let's see if we can get it to run well on a single-core 3GHz with 1G of RAM" ;)

If that was their first thought, the second was "OK, I'm done laughing, now I need
to pick myself up off the floor...."

> Maybe I'm the unexperienced obnoxious adolescent again, as I'm in only
> my second job so far, but I've noticed that both employers have the
> principle that if you can get anything, even the slightest guarantee,
> that something is faster and more stable at a somewhat higher cost, it's 
> worth it. Even if you'd be paying for a scapegoat-factor warranty.

Right. Which is why you end up *buying* that faster server at higher cost than
you might really need.

Most managers have a *really* hard time dealing with the concept "If you use this
alternative, totally free, no-cost, software, it will run faster and save you money".

> Tune even faster solution and get even more power, it'll last us
> all weekend, before it goes obsolete...

You'd be *amazed* at how many sites *dont* have somebody on the payroll
who can do tuning well.  Usually, it's whatever they remember from the MSCE
exam.  Just because my shop has people experienced in tuning everything from
old ferrite-core systems to top-10 supercomputers doesn't mean every shop does. ;)

> So a Dell 2650 could have could have handled what the 6600 did?

No, the 2650 would certainly have gotten swamped, the two boxes are doing
different things.  The point is that *DELL* didn't have any incentive to get
me to buy a 2650 instead of another 6600.

And if I had little clue, and actually talked to a Dell sales rep, they probably could
have convinced me I needed a 6600.  

> And they're still selling 6600s, how big an impact would Reiser4's speed
> advantage have really on them? But it seems I'm over over my head now :)

Trust me, it wouldn't have helped enough to get the 6600's workload to fit
on a 2650.

> Should I have said safe instead of secure? Maybe that would be the better
> English word for it.
> Like being safe at power failures.

Is it *demonstrably* better than ext3 with 'data=journal'?

> Then there's view security, which should be implemented.

Ahh.. but view security doesn't do you as much good as it could, mostly
because of the "support at the VFS level" issues.

> I make my meager living as a small-time administrator and writer of
> web (and similar) magick in Python, so I don't know why the xattrs 
> couldn't be mapped to Reiser4 calls, but shouldn't it be technically possible?

I'll refrain from saying anything except "read the list archives"....
 
> But these are just ideas, I have absolutely zero marketing experience
> so this should not be taken as a presumptuous manual on how to do things :)

You'd have more luck not talking to the people who sell hardware or systems, but
to the people who *use* hardware and systems, or who sell consulting/maintenance.

For instance, Google has multiple large server farms, each of which has 15K to 20K
systems in it.  They're a Linux shop, and would probably be willing to part with a
fairly large sum of cash if it meant their hardware upgrade costs went down even 5%.

There's lots of places making money doing custom one-off solutions based on
Linux - for instance, most of IBM's Linux revenue comes from consulting/
support. A shop that's doing systems integration might well be willing to pay
$100K for another thing in their bag of tricks that lets them land 20 contracts
that make them $10K profit each, by being able to deliver a solution that uses
$15K less hardware...

The only people willing to pay for something that uses less hardware are people
who are either trying to save money by spending less on hardware, or trying to
make money by selling less of somebody's hardware while charging the same
amount for consulting/development...


--==_Exmh_-1908456612P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFBAZRScC3lWbTT17ARAh41AKCA0FolORoUuFByDo0FuJrIdQI2GACgkhj2
Y0wLh/VMB8I6Mi3s72MT/5s=
=/bYD
-----END PGP SIGNATURE-----

--==_Exmh_-1908456612P--
