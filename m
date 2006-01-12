From: Yoanis Gil Delgado <fred@lab.matcom.uh.cu>
Subject: Re: Authoring a versioning plugin
Date: Thu, 12 Jan 2006 15:06:34 -0500
Message-ID: <200601121506.34947.fred@lab.matcom.uh.cu>
References: <200601111759.14638.fred@lab.matcom.uh.cu> <200601121014.37940.pvh@uvic.ca> <200601121439.09483.fred@lab.matcom.uh.cu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-27684-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200601121439.09483.fred@lab.matcom.uh.cu>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Yoanis Gil Delgado <fred@lab.matcom.uh.cu>, reiserfs-List@namesys.com

On Thursday 12 January 2006 02:39 pm, you wrote:
> On Thursday 12 January 2006 01:14 pm, you wrote:
> > > I'm planning to use a delta techniques for versioning storage (delta
> > > compression). The versioning will be at the write level. The versions
> > > will be saved in a special directory under the filesystem. I think the
> > > hard part is the one related to detecting the changes (a COW it's a
> > > possible solution, but i think it's to expensive). I'm thinking a
> > > possible solution will be detecting the bytes changing in each write
> > > and archiving then as the difference. =A0This introduce some problems
> > > like : 1-) What happens if the file shrinks?
> > > 2-) What happens if the file grows ?
> > >
> > > I will send another email with a solution to this problems.
> >
> > This will not be easy, I look forward to seeing your solution.
>
Well this is one of the interesting part of the projects. I will not start
 from scratch, since there is previous work on this area (the delta file
 system for example, although it's a little old).
