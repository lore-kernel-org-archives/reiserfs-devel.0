From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: power loss -> corruption
Date: Thu, 8 May 2003 13:48:41 +0200
Message-ID: <200305081348.42359.Dieter.Nuetzel@hamburg.de>
References: <m1k7d11yaz.fsf@orchid.mirar.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14003-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <m1k7d11yaz.fsf@orchid.mirar.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mirar <mirar-yg@mirar.org>, reiserfs-list@namesys.com

Am Donnerstag, 8. Mai 2003 13:18 schrieb Mirar:
> I've had this problem for a while. Every time the system gets a power
> loss, all files that was recently written to gets garbage in them.
> (It seems to me like the wrong content gets in the wrong files.)
>
> I assume it's not supposed to be that way.
>
> Is this something known?

Maybe, if you have some more details.

> It happens with 2.4.19 and 2.4.20 kernel versions.
> Is there anything I can do to track down this issue?

data-logging patches and mount option "data=ordered" solved similar problems 
for me.

Regards,
	Dieter
