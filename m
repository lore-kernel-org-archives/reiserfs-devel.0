From: Mirar <mirar-yg@mirar.org>
Subject: Re: power loss -> corruption
Date: 08 May 2003 21:39:53 +0200
Sender: mirar@orchid.mirar.org
Message-ID: <m1znlxw7li.fsf@orchid.mirar.org>
References: <m1k7d11yaz.fsf@orchid.mirar.org>
	<200305081348.42359.Dieter.Nuetzel@hamburg.de>
	<m1fznp1w3a.fsf@orchid.mirar.org>
	<200305081502.47455.Dieter.Nuetzel@hamburg.de>
	<m17k911sq4.fsf@orchid.mirar.org> <3EBAA8DB.3080202@namesys.com>
	<m14r45xn2i.fsf@orchid.mirar.org> <3EBAB07C.5020005@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14031-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3EBAB07C.5020005@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: =?iso-8859-1?q?Dieter_N=FCtzel?= <Dieter.Nuetzel@hamburg.de>, reiserfs-list@namesys.com

> Hmm, the right block got into the file, but the contents of that right
> block never reached disk because of the crash, does that make it
> easier to understand the problem?;-)

Ah yes, that makes sense. :)

I would suggest that checksums could be used to see if the right
blocks hit the disk when recapping the journal, but since V4 is on the
way anyway...

/Mirar
