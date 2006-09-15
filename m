From: Quinn Harris <lists@qutek.net>
Subject: Re: v3 rebuild-tree left system in unusable state because of space shortage
Date: Fri, 15 Sep 2006 15:38:11 -0600
Message-ID: <200609151538.14341.lists@qutek.net>
References: <2f4958ff0609150125w123284b0if6f59ca0a6df8d05@mail.gmail.com> <200609151600.01978.vs@namesys.com> <2f4958ff0609151006j6a023d4fq9cd6c50b224b25e5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29901-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <2f4958ff0609151006j6a023d4fq9cd6c50b224b25e5@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: reiserfs-list@namesys.com

Are you still able to mount the fs read write?  If so, you might see if you=
=20
can find files to delete, or possibly the 4G file was hardlinked to somewhe=
re=20
else.  This should list all files on the partition with the largest last.

find -type f -exec du {} \; | sort -n

Then wait a long time.
Does that turn up anything interesting?

KDE has a nice "file size view" graphic tool as a kpart for konqueror.

On Friday 15 September 2006 11:06, Grzegorz Ja=C5=9Bkiewicz wrote:
> On 9/15/06, Vladimir V. Saveliev <vs@namesys.com> wrote:
> > Could it be that the file was opened when you deleted it?
>
> nope, I know that issue. I rebooted the system twice before trying any
> other way.
