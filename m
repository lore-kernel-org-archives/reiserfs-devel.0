From: Jarno Elonen <elonen@iki.fi>
Subject: Re: plagiarism of reiserfs by Debian
Date: Sat, 19 Apr 2003 21:40:07 +0300
Message-ID: <200304192140.09144.elonen@iki.fi>
References: <200304181604.28955.vitaly@namesys.com> <3EA17427.7040300@namesys.com> <20030419172906.GX2528@phunnypharm.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13720-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030419172906.GX2528@phunnypharm.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: debian-devel@lists.debian.org, Hans Reiser <reiser@namesys.com>
Cc: Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com, debian-testing@lists.debian.org

> I'd hardly call it plagiarism. Your copyright is, by will of our own
> policy and to abide by authors wishes, distributed with the tools in
> /usr/share/doc/<pkg>/copyright.

Ah.. I guess Hans is referring to the author list in README?
The package maintainer probably looked at COPYING (contains GPL, as usual) and 
AUTHORS (an empty file) and didn't realize that README was actually an 
important addendum to the license and omitted the file from the package by 
mistake.

To prevent such problems in the future, perhaps the ReiserFS project could 
move the deviations from GPL from README to the beginning of COPYING and move 
the author list to AUTHORS?

Additionally, it might be a good idea to provide a shoreter list of authors in 
addition to the detailed one for easier copying to 'standard copyright files' 
like 'copying' in Debian.

- Jarno
