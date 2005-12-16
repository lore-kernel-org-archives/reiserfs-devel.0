From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: Specify tmgr.atom_max_age per directory ?
Date: Fri, 16 Dec 2005 19:53:47 +0300
Message-ID: <200512161953.48406.zam@namesys.com>
References: <20051216140522.GA9781@kruemel> <38753.207.162.80.7.1134751446.squirrel@x2a.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27406-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <38753.207.162.80.7.1134751446.squirrel@x2a.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Jonathan Bastien-Filiatrault <joe@x2a.org>, Ingo Bormuth <ibormuth@efil.de>, ingo@bormuth.org

On Friday 16 December 2005 19:44, Jonathan Bastien-Filiatrault wrote:
> Ingo Bormuth said:
> > Is it (or will it once) be possible to specify tmgr.atom_max_age on a per
> > directory basis. To do something link:
> >
> >   /      : tmgr.atom_max_age=300
> >   /data  : tmgr.atom_max_age=30
> >   /var   : tmgr.atom_max_age=900
> >   /tmp   : tmgr.atom_max_age=INFINITE
> >
> >
> > --
> > Ingo Bormuth, voicebox & telefax: +49-12125-10226517       '(~o-o~)'
> > public key 86326EC9, http://ibormuth.efil.de/contact   --ooO--(.)--Ooo--
>
> I do not know if this is intentional or not, but your message has been
> sent to this list at least 60 times. It would be appreciated if you
> correct the situation as soon as possible.

yes, the  efil.de (81.3.25.37) host is constantly sending that email.
I added a filter to the mailing list, will see how it helps.

> Thank you for your time,
> Jonathan

-- 
Alex.
