From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: New dpkg panic.
Date: Tue, 7 Dec 2004 01:23:23 +0200
Message-ID: <20041206232323.GW26192@nysv.org>
References: <20041206153115.GV26192@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22697-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20041206153115.GV26192@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

On Mon, Dec 06, 2004 at 05:31:16PM +0200, Markus T=F6rnqvist wrote:
>
>I'd appreciate a prompt answer, so I can fsck my computer as fast
>as possible if that's needed...

Figured the Namesys guys weren't available so I took a metadata
pack and did an fsck and the fs was corrupted.

I can't really see why; but in light of this new information, is it=20
possible the panics were caused by a broken fs?

I uploaded the metadata and the fsck log at the aforementioned URL.

Hope this is worth anything to anyone; I'm just glad it works..

PS.
Is there a known reason which might cause such corruptions?
I am pretty sure I haven't had to do any unclean shutdowns, but I
probably wouldn't remember if I had, if there were no immediate effects :)
But those should be pretty well survived, yes?

Well, thanks anyway :)

--=20
mjt


