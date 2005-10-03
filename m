From: Chris Bainbridge <chris.bainbridge@gmail.com>
Subject: Re: 2.6.13 + reiser4 = scheduling while atomic
Date: Mon, 3 Oct 2005 10:35:18 +0100
Message-ID: <623652d50510030235h3fcaab10x@mail.gmail.com>
References: <623652d50510021049l66c481d4v@mail.gmail.com>
	 <43403560.2060807@mid.email-server.info>
	 <5d8b7b90510021502x67f006e4xc0465c948a8abea8@mail.gmail.com>
Reply-To: Chris Bainbridge <chris.bainbridge@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26381-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <5d8b7b90510021502x67f006e4xc0465c948a8abea8@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On 02/10/05, Islam Amer <pharon@gmail.com> wrote:
> On 10/2/05, Alexander Skwar <listen@alexander.skwar.name> wrote:
> > Chris Bainbridge schrieb:
> > > Hi,
> > >
> > > Today I updated from vanilla 2.6.12.5 + reiser4 to vanilla 2.6.13 +
> > > reiser4-for-2.6.13-1.patch + spin_macros patch from this list.

The errors went away with CONFIG_PREEMPT_NONE. CONFIG_PREEMPT seems to
be the problem.
