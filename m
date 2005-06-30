From: Chet Hosey <chosey@nauticom.net>
Subject: Re: dmapi support for reiser4
Date: Thu, 30 Jun 2005 07:42:31 -0400
Message-ID: <42C3DAA7.8040402@nauticom.net>
References: <20050628093408.GA23882@lisa.goe.net> <1119958258.3495.52.camel@tribesman.namesys.com> <20050629115713.GC3610@lisa.goe.net> <42C323AA.1070802@nauticom.net> <20050630071249.GR31371@vestdata.no>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24835-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050630071249.GR31371@vestdata.no>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Ragnar Kj=F8rstad wrote:

>On Wed, Jun 29, 2005 at 06:41:46PM -0400, Chet Hosey wrote:
> =20
>
>>Is there a standard VFS interface that these filesystems present, or is
>>it done via filesystem-specific extensions? If the latter, perhaps you
>>should consider submitting a kernel patch that adds the required
>>interface to the VFS layer, and note in your submission that XFS and JFS
>>aren't compliant.
>>   =20
>>
>
>The OpenXDSM project intended to extend the VFS layer with a few extra
>functions and to implement a generic XDSM/DMAPI layer on top of that.
>
>The project never really got anywhere and the sourceforge webpage has
>been removed, but you can still find some pointers to the VFS
>discussions if you google for OpenXDSM.
>
> =20
>
In short, no, there's no standard VFS implementation. Gotcha.

>In short, the filesystems needed to be extended with functionality in
>two primary areas:
>- persistent storage of metadata
>- beeing able to punch holes in existing files.
>
>The first item has since been solved by extended attributes, and I
>believe there were some ideas about how to change truncate to also be
>able to punch holes. There were probably a few more things needed to be
>done, but I don't remember. Google probably knows.
> =20
>
So essentially you're looking for an interface by which you can produce
holes in files? That sounds like a minor feature request, certainly one
without which a filesystem might still be a "real competitor" in a
general market.

>>You said that "reiser4 will not be a real competitor without this". A
>>competitor in what market? Can you name an application that depends on
>>DMAPI and is so important that without that particular application
>>Reiser4 is not appropriate for storing files?
>>   =20
>>
>
>DMAPI is used for Hirarchial Storage Management, migrating unused files
>to slower medium such as tape. It can also be used by backupsystems.
>
>I should add though, that not everybody that does HSM are big fans of
>DMAPI. It's quite possible that it would be just as productive to add a
>_different_ API for HSM to linux as adding DMAPI.
>
> =20
>
Let me clarify -- you made claims that reiser4 isn't a "real competitor"
without DMAPI. Specifically, DMAPI. I asked whether you can name a
DMAPI-dependent application which *must* work on a given filesystem in
order for it to be a "real competitor". You haven't thus far. Now you're
saying, well, not necessarily DMAPI, but *something*.You're being vague.

To publicly claim that Reiser4 isn't a "real competitor" without
your-favorite-buzzword without providing some *actual evidence* as to
why this is the case seems a little bit rude. Can you support your
accusations?

>>Just curious, as I'd not heard of DMAPI prior to your post, but you
>>claim it's quite important.
>>   =20
>>
>
>It is important in a relatively narrow (high end) market, not really for
>desktops and low end servers.
>
> =20
>
Again, I'd consider it polite to either clarify or adjust your claims
that Reiser4 isn't a "real competitor" (note that you didn't initially
name *any* market, you just made a broad statement that Reiser4 can't
compete).

-- chet

