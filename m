From: Pierre Etchemaite <petchema@concept-micro.com>
Subject: Re: Using fs views to isolate untrusted processes: I need an
 assistant architect in the USA for Phase I of a DARPA funded linux kernel
 project
Date: Tue, 3 Aug 2004 12:08:37 +0200
Message-ID: <20040803120837.3b75614a@rayanne>
References: <410D96DC.1060405@namesys.com>
	<200408021112.08981.christian.mayrhuber@gmx.net>
	<87r7qpo3dj.fsf@uhoreg.ca>
	<410EBBD5.4080308@dgreaves.com>
	<873c35nl2l.fsf@uhoreg.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19934-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <873c35nl2l.fsf@uhoreg.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Le Mon, 02 Aug 2004 20:04:34 -0400, Hubert Chan <hubert@uhoreg.ca> a =E9cri=
t :

> Possibly.  But, from my understanding of views, apache would not even
> be able to see that /etc/passwd exists -- it is not just limited to not
> being able to read it.  I don't think you can do that with acls, and
> still allow apache to see some entries in /etc.

Vserver has been mentionned, but now I cannot help but think about grsec
patch (http://www.grsecurity.net/), and possibly other similar works.
There's interesting papers on this site on how they improved the performance
of their rules system with v2.0.

Implementing file access at filesystem level looks more natural, on the
other hand implementing it as a separate patch has advantages (filesystem
independancy, unification of rules for both files and non-files objects
-like processes-)...

