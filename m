From: Matthew Palmer <mpalmer@hezmatt.org>
Subject: Re: reiser4 non-free?
Date: Sun, 9 May 2004 17:08:12 +1000
Message-ID: <20040509070812.GB1247@hezmatt.org>
References: <4097CCA4.4060707@namesys.com> <87fzag139k.fsf@aule.evenmere.org> <4099A868.9030406@slaphack.com> <20040506.083242.41632888.wlandry@ucsd.edu> <87k6zpy8ke.fsf@aule.evenmere.org> <20040506143643.GB25505@raptus.homelinux.org> <877jvpy08v.fsf@aule.evenmere.org> <409A7F98.7040609@namesys.com> <20040506232310.GA25081@hezmatt.org> <409BB5CE.3020805@namesys.com>
Mime-Version: 1.0
Return-path: <bounce-debian-legal=debian-legal=m.gmane.org@lists.debian.org>
Content-Disposition: inline
In-Reply-To: <409BB5CE.3020805@namesys.com>
Resent-Message-ID: <Fw2DFD.A.LNF.gkdnAB@murphy>
List-Id: <reiserfs-devel.vger.kernel.org>
List-Post: <mailto:debian-legal@lists.debian.org>
List-Help: <mailto:debian-legal-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-legal-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-legal-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-legal/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: debian-legal@lists.debian.org, reiserfs-list@namesys.com

On Fri, May 07, 2004 at 09:14:06AM -0700, Hans Reiser wrote:
> Matthew Palmer wrote:
> > Hans Reiser:
> >>Q: Can we the distro preserve the credits but send the credits to 
> >>/dev/null.
> >>
> >>A: No. How can you even ask such a question?
> >
> >Q: Can we the distro send the credits to another virtual console other than
> >the one the user is currently looking at?
> >
> >Likely Answer: No.  How can you even ask such a question?
> >
> >Actual answer: ???
> >
> >Q: Must we then force the user to stay on the virtual console which the
> >credits are displayed until the notice has finished displaying?
> >
> >Likely Answer: No.
> >
> >Actual Answer: ???
>
> the current credits do not prevent console switching, though they do 
> print to the one the user interacted with when he caused the mkreiserfs 
> to occur.  why would you want to change that?

I'm not thinking in terms of modifying mkreiserfs directly, although that is
a possible option.  I was trundling along the installer thought path, and
having noted that you dismissed redirecting the credits to /dev/null, I
thought about a GUI installer, which invokes mkreiserfs in the background,
and the user doesn't see any of the output under normal circumstances.  It
probably isn't redirected to /dev/null, but it would be printed on the VC
which invoked the X session, not in the GUI, which would mean that it would
be *very* unlikely that the user would ever see the credits messages. 
That's very, very close to sending the output to /dev/null.  So I was just
interested in where you thought the line-in-the-sand would be.

If it's permissible to cause the credits not to appear in the user's
ordinary line of view, as long as they appear *somewhere*, I can imagine
that the credits will appear in all sorts of unlikely places.  That way the
distributors will always be following the letter of your licence, and can
still play their branding games[1].

> >Q: Where is the limit between displaying the credits where the user won't
> >necessarily see them, and forcing the user to read them?
> >
> >Likely Answer: Umm...
> >
> >Actual Answer: ???
>
> Display the credits at the same times that running the tool without the 
> wrapper would display them, and the license is satisfied.  If you want 

Now that is a fairly explicit description of what the terms of the licence
are.  I would respectfully suggest that become an integral part of the
licence -- preferably with the exact description of the credits to be
displayed, so that differing interpretations of the term "credits" and
confusion with "adverts" (which even dictionaries can't agree on) don't get
in the way.

> >There's something I haven't seen answered in this thread or the other
> >recurring ones on the same topic: have you ever actually made a formal
> >request to any of the distributions which have butchered your credits to
> >reinstate them?  If so, what was the response?
>
> I did not make a formal request first before changing the license.  
> Maybe you have a point there.  I was pretty pissed when they removed the 
> credits without even mentioning that they had done so....  You see, that 
> is part of the problem.  I won't know about all the times the credits 

Understandably.

> get removed if it is not in the license.....  but you are right that I 
> missed the chance to see if the top level of the distros could be talked 
> out of their actions.

I'm not sure that your chance has been missed.  A nicely worded letter
(probably hard copy, for surety) to appropriate places at the major
distribution vendors would probably get a few "oops, didn't realise"
responses.

I'm a great believer in discussion to settle problems, rather than trying to
play legal games -- and your attempts at an Anti-plagiarism licence are a
good demonstration of why.  If you write a licence which people want to get
around, it's fairly hard to stop them.  Your typical human-readable
languages aren't real good at comprehensively eliminating all grey areas --
they're too open to interpretation.

So, in a battle of licencing, you write your terms, and your "opponents"
read those terms, find the loopholes, and keep doing what they're doing. 
You write a new licence, they find new loopholes, and keep going.  Lather,
rinse, repeat.  They keep doing this because you're hoping that they'll
stick to the spirit of the licence, but they've no reason to because they're
opponents.

If you don't treat the distributors as "opponents", but rather as allies in
the world of software, you'll probably get a lot further.  True allies will
generally stick to the spirit of licencing, because they don't want to annoy
you - you're a friend.  But without any friendly relationship there,
distributors can't know what your desires are, and you can't see what the
distributor's desires are.  You've attributed shady motives when, in my
experience, it's usually just overzealousness or some other form of innocent
misunderstanding.  This is the reason, IMO, why Debian encourages developers
to get to know the upstreams of their packages.

- Matt

[1] Are you familiar with the game of brandings?  Group of (usually young,
stupid) kids line up against a wall, one person with a tennis ball some
distance away, tries to hit someone with the ball, keeps trying until they
succeed, when the thrower becomes the hit person?  Painful and pointless
game, really.  Don't know why I thought of it.  <grin>

