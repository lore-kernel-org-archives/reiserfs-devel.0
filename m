From: Hans Reiser <reiser@namesys.com>
Subject: Re: V4 status
Date: Wed, 03 Dec 2003 22:30:00 +0300
Message-ID: <3FCE39B8.20307@namesys.com>
References: <16333.14692.61778.304155@pc7.dolda2000.com> <3FCD47C4.50500@ninja.dynup.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16216-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FCD47C4.50500@ninja.dynup.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Masover <jedi@ninja.dynup.net>
Cc: reiserfs-list@namesys.com, nikita@namesys.com

David Masover wrote:

>
>
> The only thing I might complain about is that, although it was listed 
> as a possibility to display file permissions as files within a file 
> (for example, I should be able to do 'touch file; ls file'), I have 
> had two problems there.  First, ls seems to know it's a file, and so I 
> can't see any files within it.  Second, it needs the executable bit, 
> or I get permission denied errors when trying to look at any files 
> inside it.  Third, even with ls not working, no guesses I've made on 
> potential filenames has worked.

Nikita will comment on the state of this code, and your remarks below.

>
> I know almost nothing about the interface behind this.  That said, 
> here's what I'd suggest (without knowing any better):
> - - If I look at something without using a trailing slash, it should 
> be treated as a file, except maybe for compatibility reasons.
> - - If I do use a trailing slash, or as a parent directory to 
> anything, it should be treated as a directory.
> - - If it is a regular file (and not a directory pretending to be a 
> file through some odd plugin -- /etc/passwd could be a file 
> constructed from files in /etc/passwd/) then permission to view it as 
> a directory should be assumed for anyone with read access.  As an 
> alternative, the ability to change into a directory could be 
> implemented as another security attribute, which is automatically 
> linked to executable permission for "normal" directories.
>
>
>
>


-- 
Hans


