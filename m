From: Pierre Abbat <phma@webjockey.net>
Subject: Re: Proposal for keying encrypted filesystem
Date: Fri, 4 Apr 2003 19:01:52 -0500
Message-ID: <200304041901.52770.phma@webjockey.net>
References: <200303282026.23543.phma@webjockey.net> <3E8DBE93.8BAEAF29@namesys.com> <3E8DD2C6.2040106@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13581-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E8DD2C6.2040106@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com, reiserfs-dev@namesys.com

On Friday 04 April 2003 13:45, Hans Reiser wrote:
> Edward Shushkin wrote:
> > On the
> >other hand, on the last seminar we made a conclusion to check key
> > validness in oredr to avoid a possible security hole when read() first
> > looks for uptodate (decrypted!) pages in memory before reading encrypted
> > data from disk..
>
> So how about making a key of 0 be a special case which gets you the file
> in its encrypted form?

Sounds good, but we need to limit who can access the ciphertext. Otherwise the 
tape monkey could get out his infinite typewriter and trash the backup.

