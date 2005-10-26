From: Gregory Maxwell <gmaxwell@gmail.com>
Subject: Re: My Dad suggests a redundant copies plugin
Date: Wed, 26 Oct 2005 12:24:30 -0400
Message-ID: <e692861c0510260924h23b4fdacsc1782f67fae94981@mail.gmail.com>
References: <435DC714.6000505@namesys.com> <20051025072537.GB8402@favonius>
	 <435DFAA5.9050206@namesys.com> <20051025103543.GA11986@kruemel>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26660-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20051025103543.GA11986@kruemel>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ingo Bormuth <ibormuth@efil.de>
Cc: reiserfs-list@namesys.com, ingo@bormuth.org

On 10/25/05, Ingo Bormuth <ibormuth@efil.de> wrote:
> I agree, real backups are the major weappon against classical data loss d=
ue
> to hardware failure.
> Other quite anoying and common causes for data loss are accidentally dele=
ted,
> overwritten or modified files. A _simple_ versioning plugin would be very
> nice to have (I'd definitly use it in /etc).

It would be a sin to implement versioning in resier4 without taking
advantage of how transactions work since done right they can provide
this with almost zero overhead... plus it can be difficult to make
sure that you've got a consistent copy of the file because of how many
applications update files (is a version a write() call? no that won't
work.. so do we only version files that get unlinked and replaced?).=20
Between these two things a simple implementation wouldn't be so
simple.
