From: Pierre Abbat <phma@webjockey.net>
Subject: Re: Will Reisefs have "undo"?
Date: Sat, 14 Jun 2003 15:42:43 -0400
Message-ID: <200306141542.43049.phma@webjockey.net>
References: <1055615895.698.129.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14548-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1055615895.698.129.camel@localhost>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS List <reiserfs-list@namesys.com>

On Saturday 14 June 2003 14:38, Joachim Zobel wrote:
> Hi.
>
> Are there any plans to add undo capabilities to reiserfs? Most modern
> desktops have a trash can. Am I the only one who has idea that this is a
> crappy workaround for something that should be in the filesystem.
>
> I am aware that this is not easy, but nearly everybody has had moments
> where he would have loved it. And disk space is cheap, there is rarely
> the need to overwrite anything.

I agree. I once moved a serverful of files from the old server (ext2) to the 
new server (reiser) and deleted them from the old server. Some of the files 
got somehow lost and I had to get them back with e2undel. A reiserundel 
program would be nice.

phma
-- 
.i toljundi do .ibabo mi'afra tu'a do
.ibabo damba do .ibabo do jinga
.icu'u la ma'atman.
