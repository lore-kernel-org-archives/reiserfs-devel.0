From: "Yury Yu. Rupasov" <yura@yura.polnet.botik.ru>
Subject: Re: BTW: 2.4.19-patches-to-come?
Date: Tue, 07 May 2002 18:02:28 +0400
Sender: root
Message-ID: <3CD7DE73.E2D486D8@yura.polnet.botik.ru>
References: <3CD72AB1.6010607@netscape.net> <20020507092207.A6678@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10277-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: Manuel Krause <manuelkrause@netscape.net>, reiserfs-list <reiserfs-list@namesys.com>

Oleg Drokin wrote:

> Hello!
>
> On Tue, May 07, 2002 at 03:15:29AM +0200, Manuel Krause wrote:
>
> > 1.) the deleted/truncated/completed-files-on-mount at least
> >     printed in the kernel logs, at best with the real filename
>
> Huh??
>
> >     -- as afterwards they are not retrievable --
>
> Sure. Files are deleted already. How do you plan to retrieve deleted files?
> (not using backups, that's it).
>
> >     That's a security reason -- whoever can trigger a crash
> >     with various methods (I know the admin should take care
> >     against this case... but on my home sytem I'd like to know
> >     that info, too) but to get back the file from backups in
> >     case... who knows it before a
> >     crash... ? Am I missing something?
>
> This is unclear to me. You mean to crash a system to get a copy of deleted file,
> or to crash a system to delete a file? Both things sound very unlikely.
>
> > 2.) a disk/drive/partition distinction in reiserfs related
> >     messages -- Oleg, you promised it to get real and best
> >     would be a real "patch" !
>
> Yes, I remember.
>
> > 3.) a hint on how to turn on/off data-journaling for "some"
> >     of our existing reiserfs partitions if it exists at all
> >     for now and why it could be needed in some cases?!.
>
> Data journaling is available only in form of a separate patch from Chris for
> now.
>
> > 4.) a hint why there is iicache code in the latest
> >     speedup-compound-patch (so that the latest iicache patch
> >     would not apply)
>
> Hm? What do you mean by latest speedup-compound-patch? I know Chris does not
> believe iicache should be good to use, because similar functionality (with
> less overhead) can be achieved by pagecache.
>

I think it is :
ftp://ftp.namesys.com/pub/reiserfs-for-2.4/testing/linux-2.4.19p7-compound-speedup-2.patch

It contains Chris's sppedup patch, Oleg's hole_sppedup patch
and iicache patch.

All other speedup approaches are welcome of course.

Thanks,
Yura


