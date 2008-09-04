From: Volker Armin Hemmann <volker.armin.hemmann@tu-clausthal.de>
Subject: Re: reiserfs do_journal_end unnecessary hd wake up?
Date: Fri, 5 Sep 2008 01:54:00 +0200
Message-ID: <200809050154.00318.volker.armin.hemmann@tu-clausthal.de>
References: <loom.20080904T211127-782@post.gmane.org> <1df1788c0809041632h726fff6cq2eacd86076215017@mail.gmail.com> <1df1788c0809041647n5f5e4d64yaa2f47d3302494fe@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1df1788c0809041647n5f5e4d64yaa2f47d3302494fe@mail.gmail.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: reiserfs-devel@vger.kernel.org

On Friday 05 September 2008, Br=C3=A1ulio Barros de Oliveira wrote:
> just found out! it is konsole, unbelievable! going to file a bug
> report right now.
> again, thank you very much for the support.
> br=C3=A1ulio

let me guess - konsole writes to a temp file in /tmp containing the bac=
klog?
That is not a bug but a feature. You can 'save' you some trouble by put=
ting=20
/tmp on a tempfs. 256mb should be enough.
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
