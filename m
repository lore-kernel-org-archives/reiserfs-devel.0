From: Oleg Drokin <green@namesys.com>
Subject: Re: problem with overwriting large files
Date: Thu, 24 Jul 2003 19:12:56 +0400
Message-ID: <20030724151256.GB21786@namesys.com>
References: <DAEMLNOMDHGLGENEIALPGELLCAAA.suman@broadware.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15027-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <DAEMLNOMDHGLGENEIALPGELLCAAA.suman@broadware.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Suman Puthana <suman@broadware.com>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Jul 21, 2003 at 08:30:19AM -0700, Suman Puthana wrote:
> We do not see any problem when we are writing into empty space(using the
> "write" call in a C program) as the file is extending( the "write" operation
> takes less than 3 ms), but for a certain part of the application we need to
> over-write these files and we find that the "write" operation is taking
> about 200-300 ms every few minutes, sometimes every few seconds depending on
> the system load.

The description is very nice, but it would be even more nice if you can
provide a sample test code that we can run and just see the problem.
 
> 3.) Would writing in file system blocks(4096 bytes?) or multiples of blocks
> help this situation?  From some basic tests it doesn't seem to help by much.
> >From the file system performance point of view, is it better to write
> sixteen 4K chunks or one 64K chunk?

Actually rewriting should be way more faster just because you are not allocating stuff
and only changing mtime. So... I'd really appreciate a sample code
that demonstrates a problem.

Also give an info about what kernel you are trying to use that shows the problem
andstuff like that.

Thank you.

Bye,
    Oleg
