From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: Reiser4 and ACLs
Date: Mon, 15 Aug 2005 11:08:33 -0600
Message-ID: <87k6in5dri.fsf@evinrude.uhoreg.ca>
References: <42FEC9F1.9040709@perkel.com>
	<20050814080812.GA22983@king.bitgnome.net>
	<42FF388F.3010506@perkel.com>
	<b14e81f005081405316a06995c@mail.gmail.com>
	<17151.17921.996376.693013@gargle.gargle.HOWL>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-25486-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <17151.17921.996376.693013@gargle.gargle.HOWL> (Nikita
 Danilov's message of "Sun, 14 Aug 2005 17:24:17 +0400")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Sun, 14 Aug 2005 17:24:17 +0400, Nikita Danilov <nikita@clusterfs.com> said:

> Not exactly. As a matter of fact, ACL and EA support was already
> implemented in reiser4. But it used standard xattrs API to interface
> to the user-land, and it was decided that reiser4 should go
> sys_reiser4() route instead. So, it was reaped.

Does this mean that file-as-dir has also been abandoned?

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

