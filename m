From: Yoanis Gil Delgado <fred@lab.matcom.uh.cu>
Subject: Re: Authoring a versioning plugin
Date: Thu, 12 Jan 2006 15:05:38 -0500
Message-ID: <200601121505.38907.fred@lab.matcom.uh.cu>
References: <200601111759.14638.fred@lab.matcom.uh.cu> <43C5FAE0.5090602@namesys.com> <200601121434.54881.fred@lab.matcom.uh.cu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-27682-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200601121434.54881.fred@lab.matcom.uh.cu>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Yoanis Gil Delgado <fred@lab.matcom.uh.cu>, reiserfs-List@namesys.com

On Thursday 12 January 2006 02:34 pm, you wrote:
> On Thursday 12 January 2006 01:44 am, you wrote:
> > Hans Reiser wrote:
> > > =A0
> > >
> > > =A0I am skeptical that having it occur with every
> > >write is desirable actually.
> > > =A0
> >
> > Consider the case where you type cat file1 >> file2. =A0This will produ=
ce
> > a version of file2 for every 4k that is in file1, because (well I didn't
> > look at the bash source, but I would guess) it appends in 4k incremental
> > writes rather than one big write. =A0Versioning on file close makes more
> > sense, but I suggest manual control using the ..../checkin pseudofile,
> > and then we can reasonably make it the default plugin for the whole FS
> > (write it so that it calls the other plugins so that when we change the
> > other plugins we don't need to change your code to do it). =A0People who
> > don't want versioning will simply never touch the checkin pseudofile.
> > Make sure that for that case there is just an if statement condition
> > check as overhead, and there will be no reason to not make versioning
> > the default plugin that happens to do nothing unless you use the checkin
> > pseudofile at least once during the life of the file.
> >
> > hmm, maybe ..../snap is better than ..../checkin ? =A0Well, let's decide
> > that once the code is written....;-)
> >
> > Do you agree with my points here?
>
 Yes I agree with your points. Still, i will like that some files have auto
 versioning.
