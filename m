From: claus@xn--frber-gra.muc.de (=?ISO-8859-1?Q?Claus_F=E4rber?=)
Subject: Re: silent semantic changes with reiser4
Date: 31 Aug 2004 13:01:00 +0200
Sender: news <news@sea.gmane.org>
Message-ID: <9FuGrTY3cDD@3247.org>
References: <Pine.LNX.4.44.0408261607070.27909-100000@chimarrao.boston.redhat.com>
	<412E4999.1050504@sover.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21205-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org

Stephen Wille Padnos <spadnos@sover.net> schrieb/wrote:
> How does the file manager / chooser decide whether you're trying to
> move into a directory, or the meta-data-directory for a directory?
> It's not just files that should have metadata - directories need* them
> too.  Making it possible to see attributes as a directory under a file
> is great, but you'd still need an O_META flag for accessing directory
> metadata (since there are already files under a directory).

A simple convention that meta data files start with, say ".$", would be  
enough.

Claus
-- 
http://www.faerber.muc.de


