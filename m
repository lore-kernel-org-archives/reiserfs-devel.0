From: Cyrille Chepelov <cyrille@chepelov.org>
Subject: Re: reiser4 vs. apache2 bad interaction?
Date: Tue, 8 Jun 2004 11:49:23 +0200
Message-ID: <20040608094923.GA29423@chepelov.org>
References: <20040607115743.GA27255@chepelov.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19079-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040607115743.GA27255@chepelov.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Le Mon, Jun 07, 2004, =C3=A0 01:57:43PM +0200, Cyrille Chepelov a =E9crit:

> I plan to move my /big partition back to reiserfs tonight, to confirm
> (or infirm) the hypothesis that it's a bad interaction between apache2
> and reiser4, or if it's not, to give me back the freedom to change
> between kernel revisions until the problem is nailed [...]

for what it's worth, the system has been running without a flaw for 14
hours now, with /big downgraded to reiserfs. Using reiser4 was
triggering the problem within 30 minutes of uptime, with a >99% probability.

	-- Cyrille

--
