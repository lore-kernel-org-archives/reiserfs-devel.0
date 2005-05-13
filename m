From: David Masover <ninja@slaphack.com>
Subject: Re: trusted processes
Date: Thu, 12 May 2005 21:13:46 -0500
Message-ID: <42840D5A.90004@slaphack.com>
References: <f18a8d98050512171937df19c4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24054-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <f18a8d98050512171937df19c4@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bedros Hanounik <2bedros@gmail.com>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Bedros Hanounik wrote:
> last year, I asked a question on this list whether we could have file
> permissions for programs (or processes) in addition to users and groups.
> we need this feature to reject malicious code from accessing system files.
> 
> Microsoft has a tech paper about having what they call trusted
> processes. you can find it here
> 
> http://msdn.microsoft.com/mobility/default.aspx?pull=/library/en-us/dnppcgen/html/wmsecurity.asp
> 
> I don't know for how long they've been working on this, but I bet I came
> up with this concept first.

I bet this is what Hans was thinking of with "views".  But views are
much more global than "trusted processes".  Specifically, views allow
different degrees of "normal" processes.

Other than that, I don't see how this is particularly helpful compared
to UNIX security -- root is trusted, others aren't trusted, use ACLs if
you need something complex.

Until something comes along that's as simple as UNIX but does at least
as much as ACLs, I'm going to avoid talking about security on the level
of an assumed-compromised system.

> what do you think guys of implementing such feature; should it be in the
> file system, kernel, or both.

Kernel.  It should apply to more than just files.  Ideally, you want to
be able to have kernel APIs which only certain processes can call.  I
think this can be done without slowing down the unaffected APIs.

> How hard is it to implement, besides the complexity of authentication
> management.

Ask someone else.  Or better, look at archives on "views" from about a
month ago, or whenever it was that I was brainstorming with someone
about how the user would control / be controlled by views.


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQoQNWngHNmZLgCUhAQKeUw//d7qJkKZKOUn9zjrIJTPqe73DjXLsYNeB
En3x5HRhfRduXg9OB6bnHByglR0IsXM+FegVNcknMHfLRANBCIDMNOIca34c/wVq
58f/18wSNiw4DJs9sqW+tEYIt9HnyG2mNa3hUOp3SXg/+VDzXPsbMbhEDhigcfsb
FXLuzWZoCHFhvziyWV++6FuOZmlHDmRBw8MY3FZtFjjxcIH8zhDt7UDM7m5kmklY
Ossi5nCK36C8Hi4vtL5gK2f5NoCY3A7a+hfBoTyXsYrwWR0635njN7vONdJMDPp9
cOmHr/iqttisdQT105ErjcnvofBG/LjvFKbPEQ/2S1h1rao8epIgd70t67Y8aG3G
VvNXQzSIsfF4rMEpHlY0GoLsesZgyXvIMYjtMA7jypPuw9Ra5/qz16LubzSNE3Xo
tmTFwS+iXOvfXBPWjd7GFJiS+8tCnZ95He3v0qvt1s6n4IEj7FRMNoQZYlNDmzj7
UhqqL6hbDONzpWJBHv2NoK2DYez5pZ0y+HmSSU36EwD3KIbhtuQSJaVG42zWBg3n
o5W6nPBHUPPbW2UuG4Ww0D2UsMWaUJMHhAa2wew8sBxBbohcn4w2yHnjcXHzxA2K
i7bcoAcPvIORBKgo/QsBw74t7gsugzNcKaJJQM+h1e1wOmDvwi4ZbnnlZqp5WI49
9C4ToF7DoXI=
=AUW0
-----END PGP SIGNATURE-----
