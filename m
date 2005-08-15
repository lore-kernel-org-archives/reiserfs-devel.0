From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: Reiser4 and ACLs
Date: Tue, 16 Aug 2005 00:19:59 +0400
Message-ID: <17152.63727.435377.223362@thebsh.namesys.com>
References: <42FEC9F1.9040709@perkel.com>
	<20050814080812.GA22983@king.bitgnome.net>
	<42FF388F.3010506@perkel.com>
	<b14e81f005081405316a06995c@mail.gmail.com>
	<17151.17921.996376.693013@gargle.gargle.HOWL>
	<87k6in5dri.fsf@evinrude.uhoreg.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25495-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87k6in5dri.fsf@evinrude.uhoreg.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hubert Chan <hubert@uhoreg.ca>
Cc: reiserfs-list@namesys.com

Hubert Chan writes:
 > On Sun, 14 Aug 2005 17:24:17 +0400, Nikita Danilov <nikita@clusterfs.com> said:
 > 
 > > Not exactly. As a matter of fact, ACL and EA support was already
 > > implemented in reiser4. But it used standard xattrs API to interface
 > > to the user-land, and it was decided that reiser4 should go
 > > sys_reiser4() route instead. So, it was reaped.
 > 
 > Does this mean that file-as-dir has also been abandoned?

Sorry, it seems I was too vague. It's exactly the opposite: standard
xattr API was abandoned in favour of accessing EAs and ACLs through
pseudo files. The latter method is not implemented yet, and I don't know
how stable sys_reiser4() API is currently. Hans is the proper person to
ask.

 > -- 
 > Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/

Nikita.

