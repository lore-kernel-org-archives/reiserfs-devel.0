From: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>
Subject: Re: Reiserfs/emacs incompatibility/bug ?
Date: Mon, 30 Sep 2002 01:54:40 +0200
Message-ID: <m3heg8mjwf.fsf@merlin.emma.line.org>
References: <H356C4$4F46E50E852BF25DA1E850A48426FCDF@voila.fr>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11558-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <H356C4$4F46E50E852BF25DA1E850A48426FCDF@voila.fr> ("arthur.chereau"'s
 message of "Sat, 28 Sep 2002 11:28:52 +0200")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

"arthur.chereau" <arthur.chereau@voila.fr> writes:

> If you use emacs, here are how to reproduce this:
>
> The "backup-by-copying" option tells emacs to make a backup file by copying the
> original file, thus preserving the original file's metadata. Let's have the following
> .emacs:
> $ cat .emacs
> (setq backup-by-copying t)
> $
>
> The correct bahavior is:
> $ emacs test
> $ ls -i test*
> 2971971 test
> $ emacs test
> $ ls -i test*
> 2971971 test 2971972 test~
> $ emacs test
> $ ls -i test*
> 2971971 test 2971973 test~
>
> This is what is observed on an ext2 fs, for instance.
>
> Now let's do the same on a reiserfs filesystem:
> $ emacs test
> $ ls -i test*
> 1505188 test
> $ emacs test
> $ ls -i test*
> 1505190 test 1505189 test~
> $ emacs test
> $ ls -i test*
> 1505191 test 1505189 test~
>
> Here the backup file metadata are preserved, instead of the original file ones.

Did you look at the file contents? (Modify the file and look at the SHA1
or MD5 digests.)

-- 
Matthias Andree
