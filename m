From: "JP Howard" <jh_lists@fastmail.fm>
Subject: Re: Oops with in nfsd - 2.4.19-pre6
Date: Thu, 31 Oct 2002 22:12:43 UT
Message-ID: <20021031221243.6358A30BBCC@server5.fastmail.fm>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11877-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>
Cc: =?ISO-8859-1?Q?Philippe=20Gramoull=E9?= <philippe.gramoulle@mmania.com>, Oleg Drokin <green@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On 31 Oct 2002 16:30:04 -0500, "Chris Mason" <mason@suse.com> said:
> This bug is pretty hard to hit.  It has been in every single version of
> journaling reiserfs, including 2.2.x.  So far, we've gotten two reports
> of it in about 3 years (oddly, both were this month).
> 
<...>
> If you have less than a million files, you'll probably never be able to
> hit it.  I'm still going to try and get the fix into 2.4.20 though.

We have over a million files. I'd love to see a patch against 2.4.20
that's been checked by the Namesys crew if possible, even if it doesn't
make it into 2.4.20-release.

Many thanks,
  Jeremy
