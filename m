From: eazgwmir@umail.furryterror.org (Zygo Blaxell)
Subject: Re: How to break a reiserfs on Linux 2.4.20
Date: 15 Jan 2003 17:44:26 -0500
Message-ID: <b04o8a$eah$1@satsuki.furryterror.org>
References: <b01ff1$sp0$1@genki.hungrycats.org> <avprcs$bfi$1@satsuki.furryterror.org> <b01ff1$sp0$1@genki.hungrycats.org> <15908.17236.966170.982897@laputa.namesys.com>
Return-path: <reiserfs-list-return-12368-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

In article <15908.17236.966170.982897@laputa.namesys.com>,
Nikita Danilov  <Nikita@Namesys.COM> wrote:
>Zygo Blaxell writes:
> > In article <avprcs$bfi$1@satsuki.furryterror.org>,
> > Zygo Blaxell <eazgwmir@umail.furryterror.org> wrote:
> > >I think I'm seeing a pattern of failure.  ...
> > 
> > And now I can reliably reproduce it.  It has nothing to do with MD,
> > linear, raid, SMP, or unclean shutdowns.
> > 
> > I can reproduce this bug on a plain IDE disk partition in about three
> > hours on Linux 2.4.20 (compiled for SMP but running on UP, full .config
> > and system details available on request).  My test system has about 4 gigs
> > under /etc, /usr, and /var, /dev/hdc2 is 25GB, and there is 1G of swap.
>
>Thanks for the report. We shall try to reproduce it tonight.

Were you successful?  If your experience is anything like mine, you
should have hundreds if not thousands of broken files by now...

-- 
Zygo Blaxell (Laptop) <zblaxell@feedme.hungrycats.org>
GPG = D13D 6651 F446 9787 600B AD1E CCF3 6F93 2823 44AD
