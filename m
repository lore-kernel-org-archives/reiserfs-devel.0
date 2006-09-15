From: Quinn Harris <lists@qutek.net>
Subject: Re: v3 rebuild-tree left system in unusable state because of space shortage
Date: Fri, 15 Sep 2006 15:56:27 -0600
Message-ID: <200609151556.28464.lists@qutek.net>
References: <2f4958ff0609150125w123284b0if6f59ca0a6df8d05@mail.gmail.com> <200609151600.01978.vs@namesys.com> <2f4958ff0609151006j6a023d4fq9cd6c50b224b25e5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29902-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <2f4958ff0609151006j6a023d4fq9cd6c50b224b25e5@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: reiserfs-list@namesys.com

Scratch that last command use
find -type f -printf "%k\t%p\n" | sort -n | tail -n 100
its much faster.

On Friday 15 September 2006 11:06, Grzegorz Ja=C5=9Bkiewicz wrote:
> On 9/15/06, Vladimir V. Saveliev <vs@namesys.com> wrote:
> > Could it be that the file was opened when you deleted it?
>
> nope, I know that issue. I rebooted the system twice before trying any
> other way.
