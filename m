From: Andrew Clausen <clausen@gnu.org>
Subject: Re: EVMS Reiser FSIM
Date: Thu, 30 May 2002 19:53:23 +1000
Message-ID: <20020530095323.GA1076@gnu.org>
References: <OF7550755B.8F3C611F-ON85256BC8.0056E5DC@pok.ibm.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10450-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <OF7550755B.8F3C611F-ON85256BC8.0056E5DC@pok.ibm.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Pratt <slpratt@us.ibm.com>
Cc: Yury Umanets <umka@namesys.com>, reiserfs-list <reiserfs-list@namesys.com>

On Wed, May 29, 2002 at 11:28:38AM -0500, Steve Pratt wrote:
> Inadequate because it offers NO parameter passing to the file system code.
> How would you ever specify and external journal location or a journal size,
> Parted does not have the API support for this and I don't know when it
> will.

Agreed.  You could have sent a patch, though.

> Unstable because each of the file system utilities may or may not be a
> re-implementation of the utilities written by the file system developers.

s/may or may not/may not/ ?

Anyway, I agree this is a problem.

> I know this to be true for the ext2 code in Parted, which has segfaulted on
> me more than once while performing an expand.

I don't recall you sending me a bug report.

> I want to use the code approved by the owners of the file system.

Me too.  Just the ext2 maintainer doesn't like this approach, so
I'm going to need to push a bit harder (and I don't have time now)

> As I have stated previously, if the ReiserFS utilities package start
> shipping this as part of their standard tool set, then I would consider
> using it.  In fact if the file system community would come up with a
> standard library interface I would be even happier.

Me too.  I suspect that's very difficult, though.

> >BTW, I have almost done smart resizing (from partition start) in
> >libreiserfs. But you can't using the libraries of third pesons, so you
> >will haven't smart resizing and other features in your FSIM :))
> 
> Do you mean moving the start of the partition?  Not really interested.  But
> I am confused about your comment of not being able to use libraries of
> third persons.  EVMS is GPL and could link to any GPL code it wants.  If
> the libreiserfs is the *right* set of code to use, than I will use it.

I believe his point was: it would be possible to write non-GPL FSIMs.
(The GPL is probably unenforcable for "plugins")

> >Yet another issue. One man almost done JFS support for GNU Parted. Are
> >you going to add it to EVMS too? I think yes. And probably you will do
> >it in maner like ReiserFS (forking and piping).
> 
> Already done.  And I have the added benefit of picking up fixes in
> utilities whenever the file system developers make them.

The obvious long-term solution is to get jfs people to make a decent
library.  fork/pipe is Wrong.

> Is this person
> monitoring the JFS CVS tree to ensure that he does not miss an important
> fix that might go into JFS?  Does he have the external journal support in
> the library yet?  Oh wait, there is no way to pass parameters to filesystem
> code in Parted, so he can't have support for it.

I have encouraged him to try to create a libjfs (that would be maintained
by the jfs community).  I don't know what he's doing with this.

In any case, I'm not advocating (and haven't for several years) that
libparted should implement file system functionality.

I personally think libparted should be split into:

	(1) a low-level "device" system library.  This should include
	identification facilities and error handling IMHO.
	(2) a file system library
	(3) a partition library

And a (meta) LVM library could be added.

I doubt I'll have time to see all of this through, but I'm certainly
encouraging people who are working on parted FS support to structure
their code to make (2) easier.  BTW: I don't care who writes each
of these components, as long as they are in a highly modular/reusable form.
However, EVMS's infrastructure is very coupled together... for example,
implementations are tied to a particular module structure, there is
one libevms that contains all the infrastructure, and the userland
is coupled to evms's linux implementation.  So far, EVMS isn't
the solution... although perhaps it shouldn't be... perhaps it should
just use the solution.  Before such a solution exists, I think the EVMS
approach is reasonable... but I would be happy if EVMS people strived
for a more modular architecture.

Just to repeat: I think libparted is just as bad, but you seem
to have the resources to solve the above problems... why don't you?

Cheers,
Andrew

