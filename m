From: Stefan Schweizer <sschweizer@gmail.com>
Subject: Re: Reiser4 mount support, Grub support
Date: Fri, 20 Aug 2004 08:42:23 +0200
Message-ID: <e7963922040819234234cca45f@mail.gmail.com>
References: <e7963922040819082125b7d8aa@mail.gmail.com> <20040819203850.GR5154@backtop.namesys.com> <4125989F.1070907@namesys.com> <20040820062819.GS5154@backtop.namesys.com> <41259BC3.50208@namesys.com> <e796392204081923407c8b8938@mail.gmail.com>
Reply-To: Stefan Schweizer <sschweizer@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20421-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <e796392204081923407c8b8938@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> >
> Ah, and symlinks are grub related also?
>
Sure, they are grub related - but many people have a /usr/src/linux -
so if someone really had tried the grub patch he would have recognized
it. In fact it does not work at its current stage if I cannot boot a
kernel Image and if I cannot boot it from the symlink ..
