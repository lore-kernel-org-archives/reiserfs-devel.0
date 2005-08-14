From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: Reiser4 and ACLs
Date: Sun, 14 Aug 2005 17:24:17 +0400
Message-ID: <17151.17921.996376.693013@gargle.gargle.HOWL>
References: <42FEC9F1.9040709@perkel.com>
	<20050814080812.GA22983@king.bitgnome.net>
	<42FF388F.3010506@perkel.com>
	<b14e81f005081405316a06995c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25458-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b14e81f005081405316a06995c@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: michael chang <thenewme91@gmail.com>
Cc: reiserfs-list@namesys.com

michael chang writes:
 > On 8/14/05, Marc Perkel <marc@perkel.com> wrote:
 > >  So - what's the story with that? Why no ACLs in a system built on a
 > > dadtbase?
 > 
 > Database.  And you *could* ask, I suppose, why there are no
 > compression or other plugins available in a system based on plugins. 
 > Why there is no repacker when there is supposed to be an interface for
 > one and is one of the main reasons Reiser4 is so wonderful.  Why...
 > 
 > The reason? Time.  Money.  Resources.

Not exactly. As a matter of fact, ACL and EA support was already
implemented in reiser4. But it used standard xattrs API to interface to
the user-land, and it was decided that reiser4 should go sys_reiser4()
route instead. So, it was reaped.

Nikita.
