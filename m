From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: How to break a reiserfs on Linux 2.4.20
Date: Tue, 14 Jan 2003 20:05:24 +0300
Message-ID: <15908.17236.966170.982897@laputa.namesys.com>
References: <avprcs$bfi$1@satsuki.furryterror.org>
	<b01ff1$sp0$1@genki.hungrycats.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12335-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b01ff1$sp0$1@genki.hungrycats.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Zygo Blaxell <eazgwmir@umail.furryterror.org>
Cc: reiserfs-list@namesys.com

Zygo Blaxell writes:
 > In article <avprcs$bfi$1@satsuki.furryterror.org>,
 > Zygo Blaxell <eazgwmir@umail.furryterror.org> wrote:
 > >I think I'm seeing a pattern of failure.  ...
 > 
 > And now I can reliably reproduce it.  It has nothing to do with MD,
 > linear, raid, SMP, or unclean shutdowns.
 > 
 > I can reproduce this bug on a plain IDE disk partition in about three
 > hours on Linux 2.4.20 (compiled for SMP but running on UP, full .config
 > and system details available on request).  My test system has about 4 gigs
 > under /etc, /usr, and /var, /dev/hdc2 is 25GB, and there is 1G of swap.
 > 

Thanks for the report. We shall try to reproduce it tonight.

By the way, do you have REISERFS_CHECK compiled in?

 > 
 > 

Nikita.
