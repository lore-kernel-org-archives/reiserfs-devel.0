From: Jason Holt <jason@lunkwill.org>
Subject: RE: Write-once file system
Date: Fri, 27 Jun 2003 17:37:05 +0000 (UTC)
Message-ID: <Pine.LNX.4.44.0306271724390.3922-100000@potato.zayda.com>
References: <12C7D768CC8ED4118A9200508BEEC6FB033776CE@zanexch.zantaz.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14751-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <12C7D768CC8ED4118A9200508BEEC6FB033776CE@zanexch.zantaz.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fong Vang <FVang@Zantaz.com>
Cc: "'reiserfs-list@namesys.com'" <reiserfs-list@namesys.com>

On Fri, 27 Jun 2003, Fong Vang wrote:

> Physical access to the machine is a separate issue which we're already
> addressing with biometrics and other measures.
> 
> Could root be disabled completely?  I haven't tried this before so I don't
> know what impact disabling root on the system would do.
[...]

*Somebody* has to have root.  Just like *something* on the disk has got to be
physically capable of writing a sector that it shouldn't.  You just need to
construct a machine (speaking abstractly), whether hardware or software, that
can make a proper decision about when it's appropriate to do so.  That machine
needs to be secure against whoever it is you don't trust.

So now you have to define who you'll trust to run that machine, and what you
need non-trusted people to be able to do.  (Even if there was a magic OS or
disk that did exactly what you want, there's still somebody you're trusting -
the person who designed it.)

					-J

