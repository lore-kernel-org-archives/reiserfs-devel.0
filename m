From: Vijayan Prabhakaran <pvijayan@gmail.com>
Subject: Re: BUG in writeback mode - from data journaling patch
Date: Mon, 30 Aug 2004 12:12:43 -0500
Message-ID: <d68fdf7d04083010125e1f2de3@mail.gmail.com>
References: <d68fdf7d040819113256eba856@mail.gmail.com>
	 <200408301803.57727.Dieter.Nuetzel@hamburg.de> <1093884137.21878.442.camel@watt.suse.com> <d68fdf7d04083009504bb07433@mail.gmail.com> <2f9ccaae04083010074d49a0a0@mail.gmail.com>
Reply-To: Vijayan Prabhakaran <pvijayan@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21118-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <2f9ccaae04083010074d49a0a0@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Perry Kundert <perry.kundert@gmail.com>, reiserfs-list@namesys.com

No. That is wrong. If the syntax of the call is to update a stat
block, it must be done before the call finishes.

On Mon, 30 Aug 2004 11:07:57 -0600, Perry Kundert
<perry.kundert@gmail.com> wrote:
> On Mon, 30 Aug 2004 11:50:46 -0500, Vijayan Prabhakaran
> <pvijayan@gmail.com> wrote:
> > The fsync man page reads as:
> >
> > "...fsync copies all in-core parts of a file to disk, and waits  until
> >  the device  reports  that all parts are on stable storage.  It also
> > updates metadata stat information."
> >
> > So, according to POSIX standards, the stat data must be updated on fsyncs.
> > 
> Looks like it is not absolutely clear on *when* the stat metadata
> needs to be updated, though.  Perhaps if it is updated later than the
> "...parts are on stable storage" that is must wait for...
>
