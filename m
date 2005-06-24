From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: -mm -> 2.6.13 merge status
Date: Thu, 23 Jun 2005 21:13:01 -0400
Message-ID: <87fyv8h80y.fsf@evinrude.uhoreg.ca>
References: <20050620235458.5b437274.akpm@osdl.org.suse.lists.linux.kernel> <p73d5qgc67h.fsf@verdi.suse.de>
 <42B86027.3090001@namesys.com> <20050621195642.GD14251@wotan.suse.de>
 <42B8C0FF.2010800@namesys.com> <84144f0205062223226d560e41@mail.gmail.com>
 <42BB0151.3030904@suse.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24526-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: linux-kernel@vger.kernel.org

On Thu, 23 Jun 2005 14:37:05 -0400, Jeff Mahoney <jeffm@suse.de> said:

> As someone who spends time debugging reiser3 issues, I've grown
> accustomed to the named assertions. They make discussing a particular
> assertion much more natural in conversation than file:line. It also
> makes difficult to reproduce assertions more trackable over time. The
> assertion number never changes, but the line number can with even the
> most trivial of patches.

How about something of the form "nikita-955(file:line)"?  Or the
reverse: "file:line(nikita-955)".  Would that keep everyone happy?

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

